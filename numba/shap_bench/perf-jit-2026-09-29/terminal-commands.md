# Terminal command transcript: symbolized SHAP perf recordings

Machine identifiers and home paths are redacted in this repository copy.
Commands are historical and require local path changes before reuse.

Scope: the 2026-09-29 profiling task, including failed attempts, diagnostic reads,
transfers and verification. This is a reconstruction from the tool-call history
and saved command traces, not a raw terminal-session capture. Commands are not
being rerun. Line breaks/SSH quoting are normalized for readability.

Local working directory throughout:
`<numba-checkout>`.

Linux blocks were submitted with this SSH wrapper (not an interactive login):

```bash
ssh -o BatchMode=yes -o ConnectTimeout=8 user@profiling-host 'REMOTE COMMAND BODY'
```

Initial remote cwd was `<profiling-home>`; subsequent `cd` commands are shown.
Remote commands in the same block were sequential unless joined with `&&` as
shown. Concurrent helper-agent validation is recorded separately at the end.
No packages were installed. Existing LLVM, Python/Numba, perf and FlameGraph
were reused. llvmlite was built in an isolated directory and loaded via
`PYTHONPATH`. Old profiles were not overwritten.

This is an audit, not a script to paste over the existing results: creation
commands expect fresh directories.

Driver, runner, summarizer and documentation edits used `apply_patch` rather than
terminal commands. Their current source is in [perf_jit_driver.py](../perf_jit_driver.py),
[record_perf_jit.sh](../record_perf_jit.sh), and
[summarize_perf_jit.py](../summarize_perf_jit.py). The exact commands emitted by
the runner during the three successful recordings are included after the main
sequence. UI tab-opening and process-output polling were tool calls, not shell
commands.

## 1. Local: inspect the workspace

```bash
git status --short
sed -n '1,180p' issues/shap_bench/README.md
sed -n '1,220p' issues/shap_bench/bench_compiler_fusion.py
```

## 2. First SSH attempt, then retry with network permission

This exact command was issued twice. The first failed with `ssh: connect to host profiling-host port 22: Operation not permitted`. The approved retry succeeded.

```bash
ssh -o BatchMode=yes -o ConnectTimeout=8 user@profiling-host 'pwd; uname -a; ls -ld /tmp/shap* /tmp/FlameGraph /tmp/*llvm* <profiling-home>/*llvm* 2>/dev/null'
```

## 3. Linux: inspect existing environments

```bash
ls -la /tmp/llvm22-perf-demo
ls -la /tmp/llvmlite-perf-remarks
ls -la <profiling-home>
command -v llvm-config
command -v perf
perf version
/tmp/shap-bench-venv/bin/python -c "import numba,llvmlite; import llvmlite.binding as l; print(numba.__version__, numba.__file__); print(llvmlite.__version__,llvmlite.__file__); print(getattr(l,\"has_perf_jit_events\",None))"
```

## 4. Linux: initial LLVM probes and new directory

The existing source directory was not a Git checkout; llvm-config and rg were absent. Continued with CMake metadata and grep. mktemp returned `/tmp/shap-perf-jit.o4UxQr`.

```bash
git -C /tmp/llvm22-perf-demo/llvmlite-src status --short
git -C /tmp/llvm22-perf-demo/llvmlite-src log -1 --format="%H %s"
/tmp/llvm22-perf-demo/install/bin/llvm-config --version
/tmp/llvm22-perf-demo/install/bin/llvm-config --built-shared-mode
/tmp/llvm22-perf-demo/install/bin/llvm-config --libs perfjitevents
rg "LLVM_USE_PERF|LLVM_ENABLE_LIBXML2" /tmp/llvm22-perf-demo/build/CMakeCache.txt /tmp/llvm22-perf-demo/install/include/llvm/Config/llvm-config.h
perf record -h 2>&1 | rg -A5 "control|delay|clockid"
mktemp -d /tmp/shap-perf-jit.XXXXXX
```

## 5. Linux: locate usable LLVM and perf controls

```bash
ls /tmp/llvm22-perf-demo/install
ls /tmp/llvm22-perf-demo/build/bin
grep -E "LLVM_USE_PERF|LLVM_ENABLE_LIBXML2|CMAKE_BUILD_TYPE|LLVM_LINK_LLVM_DYLIB" /tmp/llvm22-perf-demo/build/CMakeCache.txt
ls /tmp/llvm22-perf-demo/install/lib
grep -n -E "createPerf|HasPerf" /tmp/llvm22-perf-demo/llvmlite-src/ffi/executionengine.cpp /tmp/llvm22-perf-demo/llvmlite-src/ffi/config.cpp
perf record -h 2>&1 | grep -A5 -E "control|delay|clockid"
ls -d <profiling-home>/dev/*llvm* <profiling-home>/tmp/*perf* 2>/dev/null
command -v cmake
command -v ninja
df -h /tmp
```

## 6. Linux: clone exact PR branch and inspect build entry point

HEAD was `aecbe8f79dd56bb2752b0f55b02791b285ef8e97`.

```bash
git clone --depth 1 --branch codex/perf-jit-events https://github.com/swap415/llvmlite.git /tmp/shap-perf-jit.o4UxQr/llvmlite &&
git -C /tmp/shap-perf-jit.o4UxQr/llvmlite rev-parse HEAD &&
sed -n "1,220p" /tmp/shap-perf-jit.o4UxQr/llvmlite/ffi/build.py
```

## 7. Linux: build llvmlite

LLVM itself was reused, not rebuilt. The command completed successfully.

```bash
cd /tmp/shap-perf-jit.o4UxQr/llvmlite &&
CMAKE_ARGS=-DLLVM_DIR=/tmp/llvm22-perf-demo/install/lib/cmake/llvm CMAKE_BUILD_PARALLEL_LEVEL=4 /tmp/shap-bench-venv/bin/python ffi/build.py > /tmp/shap-perf-jit.o4UxQr/llvmlite-build.log 2>&1
```

## 8. Local: inspect existing explainer

```bash
sed -n '1,200p' issues/shap_bench/build_explainer.py
sed -n '1,160p' issues/shap_bench/explainer.template.html
```

## 9. Linux: inspect completed build

```bash
tail -15 /tmp/shap-perf-jit.o4UxQr/llvmlite-build.log
ls -l /tmp/llvm22-perf-demo/install/include/llvm/Config/llvm-config.h
ls /tmp/shap-perf-jit.o4UxQr/llvmlite/llvmlite/binding/libllvmlite.so 2>/dev/null
```

## 10. Linux: capability probe and wrong test-class attempt

Capability was True, but llvmlite version was initially unknown because the clone was shallow. Tests failed with `AttributeError: module 'llvmlite.tests.test_binding' has no attribute 'TestJIT'. Did you mean: 'TestMCJit'?`.

```bash
cd /tmp/shap-perf-jit.o4UxQr &&
PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite /tmp/shap-bench-venv/bin/python -c "import numba,llvmlite; from llvmlite import binding as l; print(numba.__version__,numba.__file__); print(llvmlite.__version__,llvmlite.__file__); print(l.llvm_version_info,l.has_perf_jit_events); assert l.has_perf_jit_events" &&
PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite /tmp/shap-bench-venv/bin/python -m unittest llvmlite.tests.test_binding.TestJIT.test_perf_jit_event_capability llvmlite.tests.test_binding.TestJIT.test_perf_jitdump_contains_debug_info -v
```

## 11. Linux: fetch version history and run correct tests

Both tests passed: 2 tests in 0.061 s.

```bash
cd /tmp/shap-perf-jit.o4UxQr &&
git -C llvmlite fetch --unshallow --tags > git-fetch.log 2>&1 &&
PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite /tmp/shap-bench-venv/bin/python -m unittest llvmlite.tests.test_binding.TestMCJit.test_perf_jit_event_capability llvmlite.tests.test_binding.TestMCJit.test_perf_jitdump_contains_debug_info -v > jit-tests.log 2>&1
cat /tmp/shap-perf-jit.o4UxQr/jit-tests.log
```

## 12. Local: inspect and syntax-check new driver/runner

```bash
sed -n '1,260p' issues/shap_bench/perf_jit_driver.py
bash -n issues/shap_bench/record_perf_jit.sh
```

## 13. Local: copy scripts and original reproducer to Linux

```bash
scp issues/shap_bench/perf_jit_driver.py issues/shap_bench/record_perf_jit.sh issues/shap_bench/bench_compiler_fusion.py issues/shap_bench/original_numba_debug.py user@profiling-host:/tmp/shap-perf-jit.o4UxQr/
```

## 14. Linux: first recording attempt

Recording produced 4,049 samples but the driver failed after disabling events: `RuntimeError: perf disable: expected ack, got '\x00ack'`. The failed attempt is not used in final results.

```bash
cd /tmp/shap-perf-jit.o4UxQr &&
PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite bash record_perf_jit.sh original-symbols original 0 > original-symbols-command.log 2>&1
status=$?
cat original-symbols-command.log
cat original-symbols/workload.log original-symbols/record.log original-symbols/inject.log
exit "$status"
```

## 15. Linux: inspect the failed attempt

The report and script-error files did not yet exist because the recording script stopped on the driver failure.

```bash
ls -lh /tmp/shap-perf-jit.o4UxQr/original-symbols
sed -n "1,55p" /tmp/shap-perf-jit.o4UxQr/original-symbols/report.txt
cat /tmp/shap-perf-jit.o4UxQr/original-symbols/script-errors.log
```

## 16. Linux: diagnostic injection of the first capture

This confirmed JIT symbol resolution independently of the acknowledgement fix.

```bash
cd /tmp/shap-perf-jit.o4UxQr/original-symbols &&
perf inject --jit -i perf.data -o perf.jit.data > inject.log 2>&1 &&
perf report -i perf.jit.data --stdio --no-children --percent-limit 1 > report.txt 2> report-errors.log &&
cat inject.log &&
head -55 report.txt
```

## 17. Local: copy the tested acknowledgement fix

The driver was changed using apply_patch, not a shell command: `.strip()` became `.strip("\x00\r\n")`. The runner also gained `-g none` on perf report.

```bash
scp issues/shap_bench/perf_jit_driver.py issues/shap_bench/record_perf_jit.sh user@profiling-host:/tmp/shap-perf-jit.o4UxQr/
```

## 18. Linux: the three successful recordings

```bash
cd /tmp/shap-perf-jit.o4UxQr &&
export PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite &&
bash record_perf_jit.sh original-symbols-v2 original 0 > original-symbols-v2-command.log 2>&1 &&
bash record_perf_jit.sh fusion-symbols serial_fusion 0 > fusion-symbols-command.log 2>&1 &&
bash record_perf_jit.sh original-source original 1 > original-source-command.log 2>&1
```

## 19. Linux: inspect recordings and symbols

```bash
cd /tmp/shap-perf-jit.o4UxQr &&
cat original-symbols-v2/workload.log original-symbols-v2/record.log
cat fusion-symbols/workload.log fusion-symbols/record.log
cat original-source/workload.log original-source/record.log
head -18 original-symbols-v2/stacks.folded
head -30 original-symbols-v2/report.txt
```

## 20. Linux: render the same original capture before injection and annotate NRT

```bash
cd /tmp/shap-perf-jit.o4UxQr/original-symbols-v2 &&
perf script -i perf.data > raw.perf 2> raw-errors.log &&
/tmp/FlameGraph/stackcollapse-perf.pl --all < raw.perf > raw.folded &&
/tmp/FlameGraph/flamegraph.pl --title "SHAP original | SAME capture BEFORE jit injection" --countname "cycle-event weight" raw.folded > raw-flamegraph.svg &&
perf annotate -i perf.jit.data --stdio --symbol NRT_decref > nrt-decref-asm.txt 2> annotate-errors.log &&
perf annotate -i perf.jit.data --stdio --symbol NRT_incref > nrt-incref-asm.txt 2>> annotate-errors.log &&
cat nrt-decref-asm.txt nrt-incref-asm.txt
head -27 /tmp/shap-perf-jit.o4UxQr/fusion-symbols/report.txt
cat /tmp/shap-perf-jit.o4UxQr/original-source/workload.log /tmp/shap-perf-jit.o4UxQr/original-source/record.log
```

## 21. Linux: source-line annotation

```bash
cd /tmp/shap-perf-jit.o4UxQr/original-source &&
perf annotate -i perf.jit.data --stdio -l > annotation.txt 2> annotate-errors.log &&
grep -n -m 12 -E "original_numba_debug.py|_mask_delta_score|lock inc|lock dec" annotation.txt
cat annotate-errors.log
head -8 report.txt
du -h annotation.txt
```

## 22. Local: create artifact directories

```bash
mkdir -p issues/shap_bench/perf-jit-2026-09-29/original issues/shap_bench/perf-jit-2026-09-29/serial-fusion issues/shap_bench/perf-jit-2026-09-29/original-source
```

## 23. Local: retrieve original artifacts

```bash
scp 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-symbols-v2/*.svg' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-symbols-v2/*.folded' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-symbols-v2/*.txt' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-symbols-v2/*.log' issues/shap_bench/perf-jit-2026-09-29/original/
```

## 24. Local: retrieve fusion artifacts

```bash
scp 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/fusion-symbols/*.svg' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/fusion-symbols/*.folded' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/fusion-symbols/*.txt' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/fusion-symbols/*.log' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/
```

## 25. Local: retrieve source-debug artifacts

```bash
scp 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-source/*.svg' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-source/*.folded' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-source/*.txt' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/original-source/*.log' issues/shap_bench/perf-jit-2026-09-29/original-source/
```

## 26. Local: inspect folded stacks

```bash
sed -n '1,65p' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded
sed -n '1,90p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/stacks.folded
```

## 27. Local: summarize resolution

```bash
shap/.venv/bin/python issues/shap_bench/summarize_perf_jit.py
```

## 28. Local: retrieve exact command traces and tests

```bash
scp 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/*-command.log' 'user@profiling-host:/tmp/shap-perf-jit.o4UxQr/jit-tests.log' issues/shap_bench/perf-jit-2026-09-29/
```

## 29. Local: final numeric and syntax checks

```bash
bash -n issues/shap_bench/record_perf_jit.sh
shap/.venv/bin/python issues/shap_bench/summarize_perf_jit.py
rg -n 'Total Lost|Event count' issues/shap_bench/perf-jit-2026-09-29/*/report.txt
git diff --stat
```

## 30. Local: sync final reusable runner

After the captures, raw-before-injection rendering was added to the reusable runner. That appended part was executed manually for the original capture (above), not rerun as part of all three recordings. No new recordings were made after this sync.

```bash
scp issues/shap_bench/record_perf_jit.sh user@profiling-host:/tmp/shap-perf-jit.o4UxQr/
```

## 31. Local: validate SVGs and final workspace status

```bash
shap/.venv/bin/python - <<'PY'
from pathlib import Path
from xml.etree import ElementTree
root = Path('issues/shap_bench/perf-jit-2026-09-29')
for path in root.rglob('*.svg'):
    tree = ElementTree.parse(path)
    assert tree.getroot().tag.endswith('svg')
    assert path.stat().st_size > 10000
    print(f'valid SVG: {path} ({path.stat().st_size} bytes)')
PY
bash -n issues/shap_bench/record_perf_jit.sh
git status --short
```

## Runner body used for the three successful recordings

The runner below is the final script with its subsequently added raw-rendering
suffix excluded. The first failed recording used the same recording command;
its report step was not reached. The successful runs used `-g none` for reports.

```bash
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
```

## Saved command traces

These are the original `set -x` traces, not reconstructed invocations.
Redirections do not appear in xtrace; they are visible in the runner above.

### original-symbols-command.log

```text
+ timeout 90 perf record -k 1 -F 499 -e cycles:u -m 64M --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack -o perf.data -- taskset -c 2 /tmp/shap-bench-venv/bin/python -u /tmp/shap-perf-jit.o4UxQr/perf_jit_driver.py original --features 13 --seconds 8 --control control --ack ack
```

### original-symbols-v2-command.log

```text
+ timeout 90 perf record -k 1 -F 499 -e cycles:u -m 64M --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack -o perf.data -- taskset -c 2 /tmp/shap-bench-venv/bin/python -u /tmp/shap-perf-jit.o4UxQr/perf_jit_driver.py original --features 13 --seconds 8 --control control --ack ack
+ perf inject --jit -i perf.data -o perf.jit.data
+ perf report -i perf.jit.data --stdio --no-children -g none --percent-limit 0
+ perf script -i perf.jit.data
+ /tmp/FlameGraph/stackcollapse-perf.pl --all
+ /tmp/FlameGraph/flamegraph.pl --title 'SHAP original | debug=0 | jitdump' --countname 'cycle-event weight' stacks.folded
```

### fusion-symbols-command.log

```text
+ timeout 90 perf record -k 1 -F 499 -e cycles:u -m 64M --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack -o perf.data -- taskset -c 2 /tmp/shap-bench-venv/bin/python -u /tmp/shap-perf-jit.o4UxQr/perf_jit_driver.py serial_fusion --features 13 --seconds 8 --control control --ack ack
+ perf inject --jit -i perf.data -o perf.jit.data
+ perf report -i perf.jit.data --stdio --no-children -g none --percent-limit 0
+ perf script -i perf.jit.data
+ /tmp/FlameGraph/stackcollapse-perf.pl --all
+ /tmp/FlameGraph/flamegraph.pl --title 'SHAP serial_fusion | debug=0 | jitdump' --countname 'cycle-event weight' stacks.folded
```

### original-source-command.log

```text
+ timeout 90 perf record -k 1 -F 499 -e cycles:u -m 64M --call-graph dwarf,16384 --delay=-1 --control=fifo:control,ack -o perf.data -- taskset -c 2 /tmp/shap-bench-venv/bin/python -u /tmp/shap-perf-jit.o4UxQr/perf_jit_driver.py original --features 13 --seconds 8 --control control --ack ack
+ perf inject --jit -i perf.data -o perf.jit.data
+ perf report -i perf.jit.data --stdio --no-children -g none --percent-limit 0
+ perf script -i perf.jit.data
+ /tmp/FlameGraph/stackcollapse-perf.pl --all
+ /tmp/FlameGraph/flamegraph.pl --title 'SHAP original | debug=1 | jitdump' --countname 'cycle-event weight' stacks.folded
```

---

## Helper-agent driver validation: full transcript

# Driver preparation and validation commands

These are the exact terminal commands run for driver preparation and validation.
All used this working directory:

```text
<numba-checkout>
```

No commands were rerun to produce this transcript. Driver edits, including the
NUL fix, used `apply_patch`, not shell commands. This transcript covers the
driver-preparation subtask, not the Linux perf recordings.

## 1. Original kernel smoke test

```sh
PYTHONPATH=. shap/.venv/bin/python -u issues/shap_bench/perf_jit_driver.py original --features 8 --seconds 0.1 --ungated
```

Exact combined output across initial execution and process polling:

```text
Python 3.13.12 | macOS-26.6.2-arm64-arm-64bit-Mach-O
NumPy 2.4.6 | Numba 0.67.0dev1+9.g63b756580b | llvmlite 0.49.0 | LLVM (22, 1, 0)
Numba: <numba-checkout>/numba/__init__.py
llvmlite: <numba-checkout>/shap/.venv/lib/python3.13/site-packages/llvmlite/__init__.py
profiling=0 debuginfo=0 has_perf_jit_events=unavailable
Original source SHA256: 2f9a86acc344e01748588698f356ed985af242d5ea6c20226acd5e56ce021eea
warm/check complete: pid=5153 mode=original features=8 masks=256
mode=original elapsed=0.101s iterations=29 checksum=7395 mean=3.495ms (profiling throughput, not a repeated-trial benchmark)
```

## 2. Existing serial-fusion smoke test

```sh
PYTHONPATH=. shap/.venv/bin/python -u issues/shap_bench/perf_jit_driver.py serial_fusion --features 8 --seconds 0.1 --ungated
```

Exact combined output:

```text
Python 3.13.12 | macOS-26.6.2-arm64-arm-64bit-Mach-O
NumPy 2.4.6 | Numba 0.67.0dev1+9.g63b756580b | llvmlite 0.49.0 | LLVM (22, 1, 0)
Numba: <numba-checkout>/numba/__init__.py
llvmlite: <numba-checkout>/shap/.venv/lib/python3.13/site-packages/llvmlite/__init__.py
profiling=0 debuginfo=0 has_perf_jit_events=unavailable
Original source SHA256: 2f9a86acc344e01748588698f356ed985af242d5ea6c20226acd5e56ce021eea
warm/check complete: pid=5310 mode=serial_fusion features=8 masks=256
mode=serial_fusion elapsed=0.100s iterations=301 checksum=76755 mean=0.333ms (profiling throughput, not a repeated-trial benchmark)
```

## 3. Initial FIFO acknowledgement and malformed-response tests

```sh
PYTHONPATH=.:issues/shap_bench shap/.venv/bin/python - <<'PY'
import os
from pathlib import Path
from tempfile import TemporaryDirectory
from threading import Thread
from perf_jit_driver import perf_events

for response in ('ack', 'bad-ack'):
    with TemporaryDirectory(prefix='shap-perf-control-') as directory:
        control, ack = [Path(directory) / name for name in ('control', 'ack')]
        os.mkfifo(control)
        os.mkfifo(ack)
        observed = []
        def controller():
            with open(control) as commands, open(ack, 'w', buffering=1) as replies:
                for command in commands:
                    observed.append(command.strip())
                    replies.write(response + '\n')
        worker = Thread(target=controller)
        worker.start()
        try:
            with perf_events(control, ack):
                observed.append('runtime')
        except RuntimeError as error:
            assert response == 'bad-ack'
            assert str(error) == "perf enable: expected ack, got 'bad-ack'"
        else:
            assert response == 'ack'
        worker.join(timeout=5)
        assert not worker.is_alive()
        assert observed == (['enable', 'runtime', 'disable'] if response == 'ack' else ['enable'])
        print(f'{response}: {observed}; PASS')
PY
```

Exact output:

```text
ack: ['enable', 'runtime', 'disable']; PASS
bad-ack: ['enable']; PASS
```

## 4. NUL-terminated acknowledgement regression test

After the real perf run exposed the NUL issue, the following change was made
with `apply_patch`:

```diff
-            response = replies.readline().strip()
+            response = replies.readline().strip("\x00\r\n")
```

Then this exact command was run:

```sh
PYTHONPATH=.:issues/shap_bench shap/.venv/bin/python - <<'PY'
import os
from pathlib import Path
from tempfile import TemporaryDirectory
from threading import Thread
from perf_jit_driver import perf_events

for response in (b'ack\n\0', b'bad-ack\n\0'):
    with TemporaryDirectory(prefix='shap-perf-control-') as directory:
        control, ack = [Path(directory) / name for name in ('control', 'ack')]
        os.mkfifo(control)
        os.mkfifo(ack)
        observed = []
        def controller():
            with open(control, 'rb') as commands, open(ack, 'wb', buffering=0) as replies:
                for command in commands:
                    observed.append(command.decode().strip())
                    replies.write(response)
        worker = Thread(target=controller)
        worker.start()
        try:
            with perf_events(control, ack):
                observed.append('runtime')
        except RuntimeError as error:
            assert response == b'bad-ack\n\0'
            assert str(error) == "perf enable: expected ack, got 'bad-ack'"
        else:
            assert response == b'ack\n\0'
        worker.join(timeout=5)
        assert not worker.is_alive()
        assert observed == (['enable', 'runtime', 'disable'] if response == b'ack\n\0' else ['enable'])
        print(f'{response!r}: {observed}; PASS')
PY
```

Exact output:

```text
b'ack\n\x00': ['enable', 'runtime', 'disable']; PASS
b'bad-ack\n\x00': ['enable']; PASS
```

## Read-only inspection commands

These ran before the validation commands above. Their source-file output is not
reproduced in this command audit; the commands are recorded exactly.

```sh
sed -n '1,260p' issues/shap_bench/bench_compiler_fusion.py
```

```sh
sed -n '1,240p' issues/shap_bench/perf_driver.py
```

```sh
rg -n 'ENABLE_PROFILING|DEBUGINFO_DEFAULT' numba/core/config.py; sed -n '1,120p' issues/shap_bench/original_numba_debug.py
```

```sh
git status --short
```

Retained status output:

```text
?? .playwright-mcp/
?? issues/
?? shap/
```

---

## Independent audit: full transcript

# Local profile audit commands

These are the eight local shell invocations used to audit the saved profiles,
in execution order. They were read-only; no Python snippets, remote commands,
or profiling runs were executed by this audit. This transcript records commands,
not their output. The commands have not been rerun to produce this document.

Every invocation used this working directory:

```text
<numba-checkout>
```

## 1. List saved artifacts

```sh
rg --files issues/shap_bench/perf-jit-2026-09-29
```

## 2. Read original report and reference-count assembly

```sh
sed -n '1,90p' issues/shap_bench/perf-jit-2026-09-29/original/report.txt
sed -n '1,140p' issues/shap_bench/perf-jit-2026-09-29/original/nrt-incref-asm.txt
sed -n '1,140p' issues/shap_bench/perf-jit-2026-09-29/original/nrt-decref-asm.txt
```

## 3. Inspect folded-stack examples and workload metadata

```sh
sed -n '1,8p' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded
sed -n '1,8p' issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
sed -n '1,70p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/report.txt
sed -n '1,90p' issues/shap_bench/perf-jit-2026-09-29/original/workload.log
```

## 4. Initial unresolved-frame count

This initial script stops scanning after encountering an unresolved ancestor,
so it would miss an unresolved leaf on the same stack. Invocation 6 corrects
that. These files had no such overlap, so the reported totals were unchanged.

```sh
awk '
function unresolved(frame) { return frame ~ /^\[(perf-[0-9]+\.map|unknown|anon)\](_\[[jk]\])?$/ || frame ~ /^\[\[stack\]\](_\[[jk]\])?$/ }
FNR == 1 { if (NR > 1) summarize(); total=leaf=ancestor=any=rows=0; name=FILENAME }
function summarize() { printf "%s\nrows=%d total=%.0f unresolved_leaf=%.0f (%.6f%%) unresolved_ancestor=%.0f (%.6f%%) any_unresolved=%.0f (%.6f%%)\n", name, rows, total, leaf, 100*leaf/total, ancestor, 100*ancestor/total, any, 100*any/total }
{ weight=$NF; line=$0; sub(/ [0-9]+$/, "", line); n=split(line,frames,";"); total+=weight; rows++; has=0; for(i=1;i<=n;i++) if(unresolved(frames[i])) {has=1; if(i==n) leaf+=weight; else {ancestor+=weight; break}}; if(has) any+=weight }
END { summarize() }
' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded issues/shap_bench/perf-jit-2026-09-29/serial-fusion/stacks.folded issues/shap_bench/perf-jit-2026-09-29/original-source/stacks.folded
```

## 5. Read recording and workload logs

```sh
sed -n '1,100p' issues/shap_bench/perf-jit-2026-09-29/original/record.log
sed -n '1,100p' issues/shap_bench/perf-jit-2026-09-29/original/inject.log
sed -n '1,60p' issues/shap_bench/perf-jit-2026-09-29/original-source/workload.log
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/workload.log
```

## 6. Corrected counts and placeholder inventory

This counts unresolved leaves and ancestors independently, including their
overlap, then lists the bracketed placeholder frames found in both files.

```sh
awk '
function unresolved(frame) { return frame ~ /^\[(perf-[0-9]+\.map|unknown|anon)\](_\[[jk]\])?$/ || frame ~ /^\[\[stack\]\](_\[[jk]\])?$/ }
function summarize() { printf "%s\nrows=%d total=%.0f leaf=%.0f (%.6f%%) ancestor=%.0f (%.6f%%) any=%.0f (%.6f%%) both=%.0f\n", name, rows,total,leaf,100*leaf/total,ancestor,100*ancestor/total,any,100*any/total,both }
FNR == 1 { if (NR > 1) summarize(); total=leaf=ancestor=any=both=rows=0; name=FILENAME }
{ weight=$NF; line=$0; sub(/ [0-9]+$/, "", line); n=split(line,frames,";"); total+=weight; rows++; l=unresolved(frames[n]); a=0; for(i=1;i<n;i++) if(unresolved(frames[i])) a=1; leaf+=weight*l; ancestor+=weight*a; if(l||a)any+=weight; if(l&&a)both+=weight }
END { summarize() }
' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
awk '{ line=$0; sub(/ [0-9]+$/, "", line); n=split(line,f,";"); for(i=1;i<=n;i++) if(f[i] ~ /^\[/) found[f[i]]=1} END {for(k in found)print k}' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
```

## 7. Inspect resolved stacks and source annotation

```sh
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
sed -n '1,50p' issues/shap_bench/perf-jit-2026-09-29/original-source/report.txt
sed -n '1,120p' issues/shap_bench/perf-jit-2026-09-29/original-source/annotation.txt
```

## 8. Check errors, calculate shares, and inspect fusion stacks

```sh
wc -c issues/shap_bench/perf-jit-2026-09-29/original/*log
awk 'BEGIN { printf "NRT self share %.9f%%\n",100*(14986776686+12263349025)/42859572411; printf "profile throughput ratio %.6fx\n",300.861/19.473 }'
sed -n '1,50p' issues/shap_bench/perf-jit-2026-09-29/original/raw-errors.log
sed -n '1,60p' issues/shap_bench/perf-jit-2026-09-29/original/annotate-errors.log
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/stacks.folded
```
