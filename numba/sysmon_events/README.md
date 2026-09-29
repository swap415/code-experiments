# Learning the `PyMonitoring_*` C API

A progressive series of minimal C extensions, each demonstrating one
concept of CPython's public sys.monitoring API. The goal: by step 7 you
can read the dispatcher patch on `fix/sys-monitoring_3.14.4` and
understand every line — why each call exists, what each return value
means, what happens to refs and exceptions.

Each step is the smallest possible C program that exercises one piece
of the API. Read the `.c` file's header comment, build it, run the
matching `.py` driver, and watch the trace.

## Setup

```bash
cd numba/sysmon_events/  # from the experiments repository root
python setup.py build_ext --inplace
```

Requires Python 3.13+.

## Running

Run a single step:

```bash
python step1_run.py     # then step2_run.py, etc.
```

Run all seven in sequence:

```bash
python run_all.py
```

## The sequence

| # | File | Teaches |
|---|------|---------|
| 1 | `step1_enter_exit.c` | `PyMonitoring_EnterScope` / `ExitScope` — what they actually do |
| 2 | `step2_fire_pystart.c` | `PyMonitoring_FirePyStartEvent` — inline short-circuit vs real dispatch |
| 3 | `step3_fire_pyreturn.c` | `FirePyReturnEvent` — how the retval reaches the callback |
| 4 | `step4_full_cycle.c` | The Start → body → Return cycle — what the dispatcher's success path does |
| 5 | `step5_callback_raises.c` | What `-1` from `Fire*Event` actually means; PyErr state |
| 6 | `step6_exception_path.c` | `FireRaiseEvent` — the hidden `exception_event_setup`/`teardown` dance |
| 7 | `step7_pyclear.c` | The Py_CLEAR(pyresult) review fix, with a side-by-side leak version |

After step 7 the dispatcher's `call_cfunc` body should read like prose.

## How to use this

For each step:

1. Read the `.c` file's top-of-file comment block. It explains the goal
   and points at the relevant CPython source lines.
2. Skim the C body — every meaningful call has an inline comment naming
   what it does and what its return contract is.
3. Run the `.py` driver. The trace prints come from `fprintf(stderr, …)`
   inside the C extension, interleaved with the Python harness's
   commentary.
4. Compare what you saw to what the header comment predicted. If
   surprising — read the CPython source it pointed at.

## CPython source references

Anchored to v3.14.0:

- `Include/cpython/monitoring.h` — public types and inline wrappers
- `Python/instrumentation.c` — definitions of `_PyMonitoring_Fire*Event`,
  `capi_call_instrumentation`, `exception_event_setup`/`teardown`,
  `call_one_instrument`

Worth opening these alongside the steps. The docs are vague; the source
is the contract.
