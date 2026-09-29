"""Run all seven steps in order, with section headers."""
import subprocess
import sys
import pathlib

HERE = pathlib.Path(__file__).parent

steps = [
    ("step1_run.py", "EnterScope / ExitScope basics"),
    ("step2_run.py", "FirePyStartEvent — short-circuit vs dispatch"),
    ("step3_run.py", "FirePyReturnEvent — retval is borrowed"),
    ("step4_run.py", "Full Start → body → Return cycle"),
    ("step5_run.py", "Fire returns -1 — what's on tstate"),
    ("step6_run.py", "FireRaiseEvent — the hidden save/restore"),
    ("step7_run.py", "Py_CLEAR(pyresult) — the patch's review fix"),
]

for fname, title in steps:
    print()
    print("#" * 78)
    print(f"# {fname} — {title}")
    print("#" * 78)
    sys.stdout.flush()
    subprocess.run([sys.executable, "-u", str(HERE / fname)], check=False)
