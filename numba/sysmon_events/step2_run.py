import sys
import step2_fire_pystart as ext

def f(): pass
CODE = f.__code__

print("no callback:")
ext.fire(CODE)

sys.monitoring.use_tool_id(2, "step2")
sys.monitoring.set_events(2, sys.monitoring.events.PY_START)
sys.monitoring.register_callback(2, sys.monitoring.events.PY_START,
                                 lambda c, o: print("  callback fired"))

print("with callback:")
ext.fire(CODE)

sys.monitoring.set_events(2, sys.monitoring.events.NO_EVENTS)
sys.monitoring.free_tool_id(2)
