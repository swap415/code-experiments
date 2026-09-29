import sys
import step1_enter_exit as ext

print("no events:")
ext.demo()

sys.monitoring.use_tool_id(2, "step1")
sys.monitoring.set_events(2, sys.monitoring.events.PY_START)
sys.monitoring.register_callback(2, sys.monitoring.events.PY_START, lambda c, o: None)

print("PY_START registered:")
ext.demo()

sys.monitoring.set_events(2, sys.monitoring.events.NO_EVENTS)
sys.monitoring.free_tool_id(2)
