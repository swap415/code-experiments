# Driver preparation and validation commands

Machine identifiers and home paths are redacted in this repository copy.

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
