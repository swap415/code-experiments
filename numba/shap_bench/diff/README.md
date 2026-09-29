# Differential SHAP profile

This compares the original clustering kernel with a standalone scalar-loop
rewrite on two-dimensional boolean masks. It is separate from the earlier
existing-serial-fusion experiment. Start with [the comparison](comparison.txt)
and the [before-width differential flamegraph](diff-before.svg).
The [original full-bundle notes](FULL-BUNDLE-NOTES.txt) and
[checksum manifest](FULL-BUNDLE-SHA256SUMS) document the raw archive that
remains outside Git.

`original_numba_debug.py` and `optimized_numba.py` are the two source variants.
`verify.py` checks output equivalence, `compare.py` records timing and perf
inputs, and `analyze.py` reads the saved compact results to produce
`comparison.txt`. `run.sh` and `report.sh` document the Linux perf workflow;
they require a matching Numba/llvmlite environment and Brendan Gregg's
FlameGraph tools. They refuse to overwrite existing run directories.

On the recorded Linux i7-14700 run, the 8,192 × 13 case measured
299.8271 ± 0.0514 ms before and 17.8259 ± 0.0185 ms after, with ten
alternating warmed trials per variant and a 16.822× median speedup. The
verification record covers 588 equality cases and 16 gain cases. The perf
profiles use separate eight-second runs; their folded widths represent
sampled cycle weights, not the repeated timing trials. Counter data has one
run per variant, so it does not establish variability.

The checked-in reports, JSON, CSV, folded stacks, assembly, LLVM dumps, and
SVGs are one recorded run. Raw perf captures and JIT ELF images are kept out
of Git. Re-run measurements in fresh directories and compare the environment
metadata before attributing differences to code changes.
