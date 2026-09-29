#!/usr/bin/env bash
# Run with PYTHONPATH pointing to the perf-enabled llvmlite checkout.
set -euo pipefail

run_dir=${1:?usage: record_perf_jit.sh NEW_DIRECTORY MODE DEBUGINFO}
mode=${2:?choose original or serial_fusion}
debug=${3:?choose 0 (optimized symbols) or 1 (source diagnostics)}
case "$mode:$debug" in original:0|original:1|serial_fusion:0|serial_fusion:1) ;; *) exit 2 ;; esac
script_dir=$(cd -- "$(dirname -- "$0")" && pwd)
python=${SHAP_PERF_PYTHON:-/tmp/shap-bench-venv/bin/python}
flamegraph=${SHAP_FLAMEGRAPH:-/tmp/FlameGraph}

mkdir "$run_dir"
cd "$run_dir"
mkdir jitdump
mkfifo control ack
export JITDUMPDIR="$PWD/jitdump" NUMBA_ENABLE_PROFILING=1 NUMBA_DEBUGINFO="$debug"
"$python" -c 'from llvmlite import binding as llvm; assert llvm.has_perf_jit_events'

set -x
timeout 90 perf record -k 1 -F 499 -e cycles:u -m 64M \
    --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack \
    -o perf.data -- taskset -c 2 "$python" -u "$script_dir/perf_jit_driver.py" \
    "$mode" --features 13 --seconds 8 --control control --ack ack \
    > workload.log 2> record.log
perf inject --jit -i perf.data -o perf.jit.data > inject.log 2>&1
perf report -i perf.jit.data --stdio --no-children -g none --percent-limit 0 \
    > report.txt 2> report-errors.log
perf script -i perf.jit.data > stacks.perf 2> script-errors.log
"$flamegraph/stackcollapse-perf.pl" --all < stacks.perf > stacks.folded
"$flamegraph/flamegraph.pl" --title "SHAP $mode | debug=$debug | jitdump" \
    --countname "cycle-event weight" stacks.folded > flamegraph.svg
perf script -i perf.data > raw.perf 2> raw-errors.log
"$flamegraph/stackcollapse-perf.pl" --all < raw.perf > raw.folded
"$flamegraph/flamegraph.pl" --title "SHAP $mode | SAME capture BEFORE jit injection" \
    --countname "cycle-event weight" raw.folded > raw-flamegraph.svg
