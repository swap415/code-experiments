#!/usr/bin/env bash
# Run once in a fresh Linux evidence directory; refuses to overwrite run folders.
set -euxo pipefail
cd -- "$(dirname -- "$0")"
root=$PWD
python=${SHAP_PERF_PYTHON:-/tmp/shap-bench-venv/bin/python}
flamegraph=${SHAP_FLAMEGRAPH:-/tmp/FlameGraph}
export PYTHONPATH=${SHAP_PERF_LLVMLITE:-/tmp/shap-perf-jit.o4UxQr/llvmlite}
export NUMBA_ENABLE_PROFILING=1 NUMBA_DEBUGINFO=0 LC_ALL=C

sha256sum -c sources.sha256
{
    date -u
    uname -a
    perf version
    lscpu
    cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
    git -C "$PYTHONPATH" rev-parse HEAD
    git -C "$flamegraph" rev-parse HEAD
    "$python" -c 'from llvmlite import binding as llvm; print(llvm.llvm_version_info, llvm.has_perf_jit_events); assert llvm.has_perf_jit_events'
} > host.txt
diff -u original_numba_debug.py optimized_numba.py > source.diff || test "$?" -eq 1

mkdir verification
export JITDUMPDIR="$root/verification"
taskset -c 2 "$python" -u verify.py > verification/checks.json 2> verification/errors.log
for features in 8 13; do
    mkdir "timing-$features"
    export JITDUMPDIR="$root/timing-$features"
    taskset -c 2 "$python" -u compare.py benchmark --features "$features" \
        --repeats 10 --output "timing-$features" > "timing-$features/console.log" 2>&1
done

for variant in original optimized; do
    mkdir "$variant"
    (
        cd "$variant"
        mkdir jitdump
        mkfifo control ack
        export JITDUMPDIR="$PWD/jitdump"
        timeout 120 perf record -k 1 -F 499 -e cycles:u -m 64M \
            --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack \
            -o perf.data -- taskset -c 2 "$python" -u "$root/compare.py" profile \
            --variant "$variant" --features 13 --seconds 8 --output . \
            --control control --ack ack > console.log 2> record.log
        perf inject --jit -i perf.data -o perf.jit.data > inject.log 2>&1
        perf report -i perf.jit.data --stdio --no-children -g none --percent-limit 0 \
            > report.txt 2> report-errors.log
        perf script -i perf.jit.data > stacks.perf 2> script-errors.log
        "$flamegraph/stackcollapse-perf.pl" --all < stacks.perf > stacks.folded
        "$flamegraph/flamegraph.pl" --title "SHAP $variant | optimized code | jitdump" \
            --countname "cycle-event weight" stacks.folded > flamegraph.svg
        perf annotate -i perf.jit.data --stdio > annotation.txt 2> annotate-errors.log
    )
    mkdir "$variant-stat"
    (
        cd "$variant-stat"
        mkdir jitdump
        mkfifo control ack
        export JITDUMPDIR="$PWD/jitdump"
        timeout 120 perf stat --cputype core -x ';' --no-big-num \
            -e cycles:u,instructions:u,branches:u,branch-misses:u \
            --delay=-1 --control=fifo:control,ack -o counters.csv -- \
            taskset -c 2 "$python" -u "$root/compare.py" profile \
            --variant "$variant" --features 13 --seconds 8 --output . \
            --control control --ack ack > console.log 2> stat.log
    )
done
