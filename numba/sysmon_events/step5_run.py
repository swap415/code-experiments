"""Step 5 — register a callback that raises. Observe Fire returning -1."""
import sys
import step5_callback_raises as ext


def some_func(): pass
CODELIKE = some_func.__code__


print("Setup: register a PY_START callback that raises ValueError. Call fire().\n"
      "Expect: BEFORE fire shows PyErr=NULL; AFTER shows PyErr=non-NULL of type\n"
      "        ValueError; fire() raises ValueError into our except clause.\n",
      flush=True)


def cb(code, offset):
    raise ValueError("from python callback")

tid = sys.monitoring.PROFILER_ID
sys.monitoring.use_tool_id(tid, "step5")
sys.monitoring.register_callback(tid, sys.monitoring.events.PY_START, cb)
sys.monitoring.set_events(tid, sys.monitoring.events.PY_START)

caught = None
try:
    ext.fire(CODELIKE)
except ValueError as e:
    caught = e

# Reset BEFORE printing — otherwise the print machinery's exception handling
# would re-trigger the callback storm (PEP 669 RAISE-on-propagation).
sys.monitoring.set_events(tid, sys.monitoring.events.NO_EVENTS)
sys.monitoring.register_callback(tid, sys.monitoring.events.PY_START, None)
sys.monitoring.free_tool_id(tid)

print(f"\n  caught: {type(caught).__name__}: {caught}", flush=True)
print("\nKey takeaway: rc=-1 from Fire*Event means PyErr is set.\n"
      "The dispatcher's `goto exit_scope; return pyresult` pattern preserves\n"
      "that PyErr (does not clear it) — caller sees the right exception.",
      flush=True)
