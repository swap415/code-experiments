import sys
import step3_fire_pyreturn as ext

def f(): pass
CODE = f.__code__

sys.monitoring.use_tool_id(2, "step3")
sys.monitoring.set_events(2, sys.monitoring.events.PY_RETURN)
sys.monitoring.register_callback(2, sys.monitoring.events.PY_RETURN,
                                 lambda c, o, r: print(f"  saw retval={r}"))

ext.fire(CODE, [1, 2, 3])

sys.monitoring.set_events(2, sys.monitoring.events.NO_EVENTS)
sys.monitoring.free_tool_id(2)
