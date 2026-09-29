"""Step 4 — happy path. Register both Start and Return; drive the cycle."""
import sys
import step4_full_cycle as ext


def some_func(): pass
CODELIKE = some_func.__code__


events = []
def on_start(code, offset):
    events.append(("PY_START", code is CODELIKE, offset))
def on_return(code, offset, retval):
    events.append(("PY_RETURN", code is CODELIKE, offset, retval))


print("Setup: register PY_START and PY_RETURN. Drive cycle(). Expect to see\n"
      "       both events in order, with the body returning 7.\n", flush=True)

tid = sys.monitoring.PROFILER_ID
sys.monitoring.use_tool_id(tid, "step4")
sys.monitoring.register_callback(tid, sys.monitoring.events.PY_START, on_start)
sys.monitoring.register_callback(tid, sys.monitoring.events.PY_RETURN, on_return)
sys.monitoring.set_events(tid,
    sys.monitoring.events.PY_START | sys.monitoring.events.PY_RETURN)

try:
    result = ext.cycle(CODELIKE)
finally:
    sys.monitoring.set_events(tid, sys.monitoring.events.NO_EVENTS)
    sys.monitoring.register_callback(tid, sys.monitoring.events.PY_START, None)
    sys.monitoring.register_callback(tid, sys.monitoring.events.PY_RETURN, None)
    sys.monitoring.free_tool_id(tid)

print(f"\n  cycle() returned: {result!r}", flush=True)
print(f"  events fired: {events}", flush=True)
