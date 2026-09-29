"""Step 6 — exercise FireRaiseEvent with a well-behaved callback (Run A)
and with a raising callback (Run B). See identity preserved vs replaced."""
import sys
import step6_exception_path as ext


def some_func(): pass
CODELIKE = some_func.__code__


def banner(s):
    print("\n" + "=" * 70 + f"\n {s}\n" + "=" * 70, flush=True)


# ─── Run A: well-behaved callback ────────────────────────────────────
banner("Run A — RAISE callback returns cleanly")
print("Expect: PyErr identity is the SAME pointer before and after Fire.\n",
      flush=True)


def cb_ok(code, offset, exc):
    # Don't print here — print() can fire RAISE on its own internal exceptions.
    pass


tid = sys.monitoring.PROFILER_ID
sys.monitoring.use_tool_id(tid, "step6")
sys.monitoring.register_callback(tid, sys.monitoring.events.RAISE, cb_ok)
sys.monitoring.set_events(tid, sys.monitoring.events.RAISE)

caught = None
try:
    ext.demo(CODELIKE)
except ValueError as e:
    caught = e

sys.monitoring.set_events(tid, sys.monitoring.events.NO_EVENTS)
sys.monitoring.register_callback(tid, sys.monitoring.events.RAISE, None)
print(f"\n  caught: {type(caught).__name__}: {caught}", flush=True)


# ─── Run B: callback that raises ─────────────────────────────────────
banner("Run B — RAISE callback ITSELF raises KeyError")
print("Expect: PyErr identity DIFFERS before and after Fire — original\n"
      "        ValueError was Py_XDECREF'd, KeyError replaced it.\n",
      flush=True)


def cb_bad(code, offset, exc):
    raise KeyError("from raise callback")


sys.monitoring.register_callback(tid, sys.monitoring.events.RAISE, cb_bad)
sys.monitoring.set_events(tid, sys.monitoring.events.RAISE)

caught = None
try:
    ext.demo(CODELIKE)
except BaseException as e:
    caught = e

sys.monitoring.set_events(tid, sys.monitoring.events.NO_EVENTS)
sys.monitoring.register_callback(tid, sys.monitoring.events.RAISE, None)
sys.monitoring.free_tool_id(tid)

print(f"\n  caught: {type(caught).__name__}: {caught!r}", flush=True)
print("\nKey takeaway: the public API silently saves and restores the\n"
      "exception across a SUCCESSFUL callback. On callback failure the\n"
      "saved exception is freed and the new one (callback's) takes over.",
      flush=True)
