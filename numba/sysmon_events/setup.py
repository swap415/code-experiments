"""Builds all step extensions. Each step is a separate module so failures
in later steps don't block running earlier ones."""
from setuptools import setup, Extension

STEPS = [
    "step1_enter_exit",
    "step2_fire_pystart",
    "step3_fire_pyreturn",
    "step4_full_cycle",
    "step5_callback_raises",
    "step6_exception_path",
    "step7_pyclear",
]

setup(
    name="sysmon_events_learning",
    ext_modules=[
        Extension(name, sources=[name + ".c"],
                  extra_compile_args=["-O0", "-g", "-Wall"])
        for name in STEPS
    ],
)
