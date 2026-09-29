# Existing Numba fusion, sequential execution

## Scope and debug log — 2026-09-28

- Removed the custom `arrayexpr_sum` rewrite/lowering and its test module.
  `git diff` is empty for tracked Numba source. The removed code is archived in
  `discarded-custom-fusion.patch`; unrelated SHAP and profiling work is retained.
- Known: existing parfor machinery can fuse a producer and reduction, and has
  an internal sequential-lowering path. Prior diagnostic compilation removed
  the score helper's temporary allocation and emitted no threading calls.
- Hypothesis: reuse that machinery for the original score helper and recover
  the runtime benefit without a new compiler transform or worker-thread costs.
- Minimal change in the harness: redecorate only `_mask_delta_score` with
  `njit(parallel=True)` and compile its specialization with the internal
  `parfor.sequential_parfor_lowering` switch enabled in `try/finally`. Restore
  the switch immediately. All function bodies and caller decorators remain
  unchanged; the original source is SHA256-checked.
- This process-global switch is suitable only for this single-threaded
  experiment, not a production configuration or concurrent compilation.
- Correctness audit: 120 baseline comparisons passed for XOR/add reductions,
  bool/int8/int32/uint8/uint64, empty/small arrays, negative/nonunit strides,
  and integer overflow. Two consumers of an intermediate remained correct.
- Known limit: array singleton broadcasting `(13,) + (1,)` fails an existing
  parfor size assertion, while ordinary `njit` supports it. Invalid-shape errors
  also differ (`AssertionError` versus `ValueError`). Benchmark equal-shaped
  arrays; do not present this as transparent replacement of ordinary `njit`.
- Evaluation: warm both versions, compare complete SHAP output orders, rotate
  timing order for ten repeated full-kernel trials, inspect LLVM for allocation
  and thread-runtime calls, and check million-element reductions separately.
  The optional C++ comparison uses the installed current SHAP extension,
  explicitly not a reconstruction of the historical PR build.

## Rerun

From the Numba checkout, using its already-built extensions:

```sh
PYTHONPATH=. MPLCONFIGDIR=/tmp/shap-bench-matplotlib shap/.venv/bin/python -u issues/shap_bench/bench_compiler_fusion.py --cpp
PYTHONPATH=. shap/.venv/bin/python -u issues/shap_bench/probe_fusion_arrays.py
```

No compiler-source patch is required. Compilation is outside the timed region.
The large-array probe batches short calls and saves every per-trial sample in
its output.

## Results

macOS 26.6.2, arm64; Python 3.13.12, NumPy 2.4.6, Numba source
`0.67.0dev1+9.g63b756580b` (no tracked changes), llvmlite 0.49.0 / LLVM 22.1.0.
The C++ extension is installed SHAP `0.52.1.dev39`, not the historical PR build.

Full SHAP delta-minimization kernel, n=10; mean +/- sample standard deviation:

| Features / masks | Original Numba (ms) | Existing serial fusion (ms) | Current SHAP C++ (ms) |
| --- | ---: | ---: | ---: |
| 8 / 256 | 3.6195 +/- 0.0504 | 0.3444 +/- 0.0088 | 0.5119 +/- 0.0322 |
| 13 / 8192 | 157.9542 +/- 0.6259 | 22.9537 +/- 0.1234 | 30.8740 +/- 0.4656 |

Median-based speedup over original Numba: **10.65x** at eight features and
**6.88x** at thirteen. At thirteen features, existing fusion is **1.35x faster
than current C++** (22.9515 vs 30.9764 ms median).

Every timed output order matches the original, including C++. LLVM inspection
finds one allocation call in the original score helper and zero with existing
fusion. No threading-runtime symbols appear in the score helper or its callers.
Existing fusion diagnostics report `{0: [1]}`: producer and reduction fused.

Full command/output, versions, and raw trials:
[serial-fusion-run.txt](serial-fusion-run.txt).
SHAP's import emitted font-cache permission warnings before timing; compilation,
imports, and cache initialization are outside the measured calls.

## Larger reductions: not a universal win

One million elements in a **single score reduction**, n=20, batched warmed calls;
medians in microseconds per call:

| Input dtype | Original | Existing serial fusion | Speedup |
| --- | ---: | ---: | ---: |
| bool | 129.05 | 156.29 | 0.83x |
| uint8 | 53.59 | 16.83 | 3.18x |
| int64 | 519.41 | 134.10 | 3.87x |

Large boolean reductions remain about **21% slower**, unlike SHAP's many tiny
13-element row comparisons. This limitation already exists in the reused
fusion path; it was not specific to the discarded handwritten rewrite.
The 4,096-element boolean case also regresses (0.71 to 0.81 microseconds median).

See [serial-fusion-arrays-run.txt](serial-fusion-arrays-run.txt) for means,
standard deviations, batch sizes, and raw trials. All results are checked
against NumPy. Do not compare sub-microsecond numbers directly against the
historical unbatched probe; this run batches Python-to-compiled calls.

## Outcome

The existing fusion machinery achieves the SHAP speedup without a new Numba
compiler transform, forced helper inlining, or worker threads. The only active
changes are experiment scripts and documentation. The next upstream discussion
can focus on making existing serial fusion a safe per-compilation option,
including eligibility/fallback for broadcasting and a profitability policy,
rather than adding another fusion implementation.
