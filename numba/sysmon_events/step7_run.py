"""Step 7 — the Py_CLEAR review fix, side by side.

Run A: cycle_correct() — what the patch does.
Run B: cycle_buggy()    — what the patch's first version did wrong.
"""
import sys
import gc
import step7_pyclear as ext


def some_func(): pass
CODELIKE = some_func.__code__


def banner(s):
    print("\n" + "=" * 70 + f"\n {s}\n" + "=" * 70, flush=True)


def cb_bad(code, offset, retval):
    # Only raise for the codelike we pass to the C function. Otherwise this
    # callback would fire for every Python frame's return and break the harness.
    if code is CODELIKE:
        raise RuntimeError("py_return callback raises")


def setup():
    tid = sys.monitoring.PROFILER_ID
    sys.monitoring.use_tool_id(tid, "step7")
    sys.monitoring.register_callback(tid, sys.monitoring.events.PY_RETURN, cb_bad)
    sys.monitoring.set_events(tid, sys.monitoring.events.PY_RETURN)
    return tid


def teardown(tid):
    sys.monitoring.set_events(tid, sys.monitoring.events.NO_EVENTS)
    sys.monitoring.register_callback(tid, sys.monitoring.events.PY_RETURN, None)
    sys.monitoring.free_tool_id(tid)


# ─── A: the correct version ──────────────────────────────────────────
banner("Run A — cycle_correct (with Py_CLEAR)")
print("Expect:\n"
      "  - Trace shows pyresult flips from a non-NULL pointer to 0x0.\n"
      "  - cycle_correct() raises RuntimeError back into Python.\n"
      "  - No leaked list (the strong ref was released).\n", flush=True)

tid = setup()
caught = None
try:
    ext.cycle_correct(CODELIKE)
except RuntimeError as e:
    caught = e
teardown(tid)
print(f"\n  caught: {type(caught).__name__}: {caught}", flush=True)


# ─── B: the buggy version ────────────────────────────────────────────
banner("Run B — cycle_buggy (without Py_CLEAR)")
print("Expect:\n"
      "  - Trace shows pyresult NEVER cleared.\n"
      "  - cycle_buggy() returns a non-NULL list AND PyErr is set.\n"
      "  - Python's interpreter sees the contract violation. Behaviour at\n"
      "    that point is undefined; in practice you may see the original\n"
      "    list returned, or the exception, depending on cpython internals.\n",
      flush=True)

tid = setup()
caught = None
result = None
try:
    result = ext.cycle_buggy(CODELIKE)
except BaseException as e:
    caught = e
teardown(tid)

print(f"\n  caught:  {type(caught).__name__ if caught else None}: {caught}",
      flush=True)
print(f"  result:  {result!r}", flush=True)
print("\n*** KEY OBSERVATION ***", flush=True)
print("CPython itself catches this violation. Look at the exception:\n"
      "  `SystemError: <built-in function cycle_buggy> returned a result\n"
      "  with an exception set`\n"
      "That is CPython's runtime check enforcing the C-API contract — a\n"
      "non-NULL return MUST come with a clear error indicator. The buggy\n"
      "path violates this; CPython turns it into SystemError instead of\n"
      "letting the bug propagate silently.\n\n"
      "The patch's `Py_CLEAR(pyresult); goto exit_scope;` ensures we always\n"
      "return NULL when there's an exception in flight — the only correct\n"
      "answer. The list strong-ref is released and the caller sees the\n"
      "callback's RuntimeError as it should.", flush=True)
