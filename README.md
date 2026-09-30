# Scratchpad

Small investigations grouped by upstream project. Each directory keeps the
question, code, run instructions, and enough evidence to understand the result.
These are snapshots of experiments, not a package or a shared test suite.

| Experiment | Question | Requirements |
| --- | --- | --- |
| [Numba #10605](numba/10605/README.md) | Does an inserted unit axis change an array reduction under JIT? | Numba, NumPy |
| [Vector math](numba/_veclib/README.md) | Which vector math provider is called, and how fast is it? | Experimental Numba and llvmlite branches |
| [Monitoring events](numba/sysmon_events/README.md) | How does CPython's monitoring C API dispatch events? | CPython 3.13+, C compiler |
| [SHAP profiling](numba/shap_bench/README.md) | Where does the delta-minimization kernel spend time? | Numba, NumPy, Linux perf for new captures |

## Adding an experiment

Use one directory per question. Give it a README with an upstream link, exact
environment and revisions, a command that can be rerun, the expected result,
and what remains uncertain. Keep source and compact evidence in Git. Record
benchmark warm-up, repetitions, and variability when comparing performance.
Keep raw profiles, caches, binaries, and local environments outside Git.

There is no root dependency lock: the experiments need different Python,
Numba, llvmlite, compiler, and operating-system versions. Use the instructions
in each directory. [Import notes](IMPORT.md) explain what was left out of this
copy. [Third-party notices](THIRD_PARTY.md) cover derived code and visualizations.
Original material is currently unlicensed; third-party terms are listed separately.
