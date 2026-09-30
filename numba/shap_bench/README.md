# SHAP delta minimization profiling

Runtime profiles of SHAP-derived original-expression and optimized Numba kernels.
The original clustering kernels are adapted from SHAP; see the repository's
[third-party notices](../../THIRD_PARTY.md).

For the original-versus-standalone scalar-loop rewrite, see the
[differential profile](diff/README.md).

**New: [symbolized Linux recordings (2026-09-29)](perf-jit-2026-09-29/README.md)**.
On the same original capture, jitdump injection resolves leaf cycle weight from
81.29% unknown to 0%. The old profiles and explainer below are preserved.

For the current benchmark of existing Numba fusion with sequential lowering,
see [existing serial fusion](existing-serial-fusion.md). The custom compiler
rewrite was discarded; [its measurements](numba-improvements.md) are historical.
The older Linux profiles below are a separate experiment.

Open `explainer.html` for a guided, interactive reading of the existing
flamegraphs. It embeds both folded-stack datasets and works offline. Regenerate
it after editing the template or the input stacks:

```bash
python3 build_explainer.py
```

## Environment

- Intel Core i7-14700, one pinned core
- Linux 6.8.0-139-generic, x86-64
- Python 3.12.3
- Numba 0.67.0, llvmlite 0.49.0, NumPy 2.5.3
- perf 6.8.12

## Results

```text
Original:  495.055 ms/call (17 iterations)
Optimized:  15.445 ms/call (518 iterations)
Speedup:     32.05x
```

Both profiles sampled approximately 8 seconds at 499 Hz and lost zero
samples. Inclusive folded-stack weights:

```text
                         Original   Optimized
NRT allocation stacks       9.43%       0.00%
NRT deallocation stacks     6.42%       0.00%
```

LLVM independently shows a temporary-array write followed by a separate
reload/reduction. However, most JIT cycles in these perf captures are unresolved,
so this profile cannot attribute the remaining improvement to particular
instructions. These are profiled run means, not repeated-trial timing estimates.

The folded weights are sampled cycle-event periods, not literal sample counts.
The original SVG renderer labels them "samples" by default. `explainer.html`
corrects this label and keeps all stack weights unchanged.

The driver preserves the original XOR expression but forces helper inlining;
it is not a byte-for-byte upstream baseline. Both recordings enabled profiling
and debug information, which can affect generated code. No NRT allocation/free
frames were sampled in the optimized capture; its output array still allocates.

## Recording

Delayed recording aims to skip compilation: the driver warms twice, waits five
seconds, and perf starts four seconds after process launch. The resulting files
still contain a small amount of compiler-related and interpreter-shutdown
activity; the window is not gated precisely around warmed calls.

```bash
NUMBA_ENABLE_PROFILING=1 NUMBA_DEBUGINFO=1 \
perf record -q -o original-clean.data \
    -F 499 -m 64M --call-graph dwarf,4096 --delay=4000 -- \
    taskset -c 2 /tmp/shap-bench-venv/bin/python perf_driver.py original \
        --features 13 --seconds 8 --delay 5

NUMBA_ENABLE_PROFILING=1 NUMBA_DEBUGINFO=1 \
perf record -q -o optimized-clean.data \
    -F 499 -m 64M --call-graph dwarf,4096 --delay=4000 -- \
    taskset -c 2 /tmp/shap-bench-venv/bin/python perf_driver.py optimized \
        --features 13 --seconds 8 --delay 5
```

## Rendering

Using <https://github.com/brendangregg/FlameGraph>:

```bash
perf script -i original-clean.data \
    | stackcollapse-perf.pl --all > original.folded
flamegraph.pl \
    --title "SHAP delta_minimization_order: original Numba" \
    original.folded > original-flamegraph.svg

perf script -i optimized-clean.data \
    | stackcollapse-perf.pl --all > optimized.folded
flamegraph.pl \
    --title "SHAP delta_minimization_order: optimized Numba" \
    optimized.folded > optimized-flamegraph.svg
```

The raw perf captures remain on the profiling host at:

```text
/tmp/shap_bench_codex/original-clean.data
/tmp/shap_bench_codex/optimized-clean.data
```

## Explainer verification and interpretation log

- Rebuilt both views from all 94 folded stacks; verified exact cycle totals.
- Audited unresolved leaves: 83.22% of the original capture has no resolved leaf
  symbol. Replaced the earlier claim attributing all remaining improvement to
  temporary-array traffic with the evidence limits above.
- Browser-checked all five guide steps, allocation zoom, reset, symbol search,
  keyboard zoom, and profile switching. No JavaScript errors occurred.
- Checked all steps at 390px width with no horizontal document overflow;
  visually inspected the desktop overview and allocator detail.
- A follow-up measurement needs JIT symbolization and a precisely gated runtime
  window before assigning the unresolved cycles to kernel instructions.
