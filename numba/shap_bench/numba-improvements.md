# Historical custom-fusion experiment — discarded

The user requested removal of this custom rewrite. Numba's tracked source is
restored, and the custom regression-test module was removed. The removed code
and obsolete inlining probe are recoverable from `discarded-custom-fusion.patch`.

Everything below records the **previous experiment**, not the current compiler.
The benchmark scripts now exercise existing parfor fusion with sequential
lowering; see [the current experiment](existing-serial-fusion.md). The original
`compiler-fusion-run.txt` remains unchanged as a historical transcript.

## Ranked scope

1. **Fuse an array expression into a serial reduction.** For a single-use
   `(a ^ b).sum()`, produce and accumulate each element without allocating the
   intermediate array. Generalize by expression/consumer, not SHAP function name.
   This is the only performance change implemented in this experiment.
2. **Explain materialization.** Extend compiler diagnostics to identify an
   expression that allocates a temporary before a reduction, including why fusion
   was rejected. Existing LLVM dumps expose the allocation but not the intent.
3. **Revisit tiny helpers and reference counting after fusion.** Keep this
   separate from allocation removal. A controlled experiment below now isolates
   inlining the score helper; it does not isolate reference counting alone.
   Investigate llvmlite's refprune traversal cutoff before changing Numba's global
   inlining policy.
4. **Extend reduction coverage incrementally.** Multidimensional expressions,
   axis/dtype arguments, other reductions, and floating-point expressions need
   their own correctness and performance tests. In particular, avoid silently
   changing floating-point evaluation/reduction order.
5. **Improve JIT profiling metadata with llvmlite.** Export code-address/name
   mappings, then line information and unwind data for Linux perf. Missing JIT
   symbols impaired our earlier flamegraph; this is observability, not a runtime
   optimization, and needs a separate integration patch.

## Small first implementation

Scope: ordinary `njit`, single-use, same-block, one-dimensional plain NumPy
integer/boolean array expressions feeding argument-free `.sum()` or
`np.sum(expression)`. Existing scalar-expression compilation and broadcasting
logic are reused. The existing parallel pipeline is left alone.

The reduction runs at the producer's original position: moving the producer
past an input mutation would be incorrect. Expression elements are narrowed to
their original dtype before promotion into the typed sum accumulator. Shared
arrays, escaping methods, unsupported dtypes and reduction options stay on the
existing path.

## Debug log — 2026-09-28

- Known: the original SHAP `_mask_delta_score` materializes `(m1 ^ m2)` before
  summing; the previous hand-written loop removes this cost. LLVM vectorization
  alone was not the missing optimization.
- Hypothesis: a serial compiler rewrite can remove that allocation and improve
  the unchanged SHAP implementation without any SHAP-specific rule.
- Failure modes checked first: narrow-integer overflow, broadcast validation,
  empty arrays, strided inputs, multiple consumers, input mutation, and the
  existing parallel pipeline.
- Environment: built this checkout's extensions with
  `shap/.venv/bin/python setup.py build_ext --inplace`; no package installation
  or edits to the SHAP virtual environment. Python 3.13.12, NumPy 2.4.6,
  llvmlite 0.49.0; Numba source at `63b756580b` plus this patch.
- Implementation: typed-IR rewrite plus allocation-free reduction lowering;
  share the existing broadcast-shape calculation with ordinary ufunc allocation.
- Evaluation plan: warm two independent copies of the original repro, disable
  only the new rewrite for the baseline, assert identical output, and interleave
  repeated timings. Inspect helper LLVM for the allocation call. Run independent
  compiler tests beyond XOR before accepting the speedup.
- Correctness: nine new tests passed, including opaque-call input mutation and
  preservation of the parallel pipeline. The existing array-expression and
  ufunc suites passed: 4,305 tests in 78.507 seconds.
- Dead end: checking invalid broadcasts through the `no_rewrites` baseline
  tripped its existing argument-MemInfo leak. An isolated bad-broadcast call had
  `(alloc, free, mi_alloc, mi_free) = (2, 0, 2, 0)` there versus `(2, 2, 2, 2)`
  on the fused path. Valid inputs still compare against both NumPy and the
  baseline; invalid inputs compare against NumPy with leak checking enabled.
  No unrelated memory-management fix was included.

## Historical results — discarded patch

This is a prototype, not an upstream-ready blanket optimization: large boolean
arrays regress in the test below, and a pre-existing exceptional-path reference
leak remains. No global LLVM pipeline or inlining-policy change was made.

```text
> PYTHONPATH=. shap/.venv/bin/python issues/shap_bench/bench_compiler_fusion.py

features=8, masks=256, n=10
baseline: mean=3.6616 ms, std=0.0625 ms, median=3.6682 ms
patched:  mean=1.7663 ms, std=0.0190 ms, median=1.7625 ms
median speedup: 2.08x

features=13, masks=8192, n=10
baseline: mean=159.4047 ms, std=0.9340 ms, median=159.4853 ms
patched:  mean=69.8438 ms, std=0.2655 ms, median=69.8225 ms
median speedup: 2.28x
```

The full transcript is in `compiler-fusion-run.txt`. The original source is
SHA256-checked; only the new rewrite is disabled/enabled, not all Numba rewrites.
The score helper's LLVM allocation-call count changes from one to zero. This is
a macOS/arm64 experiment, not a new Linux/C++ comparison.

Verification commands (4,761 tests run total, one skipped):

```sh
shap/.venv/bin/python -m unittest numba.tests.test_array_expr_sum -q
shap/.venv/bin/python -m unittest numba.tests.test_array_exprs numba.tests.test_ufuncs -q
shap/.venv/bin/python -m unittest numba.tests.test_array_reductions -q
```

### Generalization and remaining performance limits

```text
> PYTHONPATH=. shap/.venv/bin/python issues/shap_bench/probe_fusion_arrays.py

one million elements, warmed, n=20; medians in microseconds:
dtype     baseline    fused
bool        139.29    164.08
uint8        58.90     16.79
int64       610.19    138.33
```

This prevents interpreting the SHAP result as a universal speedup: the boolean
case is about 18% slower here. Large-boolean reduction code generation needs
further work before enabling a broad upstream optimization.

### Follow-up experiments and rejected approaches

- `probe_fusion_calls.py` changes only `_mask_delta_score` to
  `njit(inline='always')` in an independent copy of the fused repro. No source
  kernel or global compiler policy is changed. With 13 features, n=10:
  fused mean 69.5293 ms (std 0.4946), median 69.6192 ms; inline-score mean
  33.2284 ms (std 0.5165), median 33.0576 ms. Native NRT calls in the score-gain
  caller drop from eight to zero. Other effects of inlining, including shape
  propagation and removed function calls, are not independently attributed.
- An experimental zero-stride broadcast loop shortened the helper's LLVM from
  43 to 13 blocks, removed its native reference-count calls, and improved the
  full SHAP repro to 48.8418 ms median. **Rejected and reverted:** it discarded
  contiguous-layout information. For one million `uint8` elements, the median
  regressed from 56.88 to 171.19 microseconds. The final LLVM's nominally
  vectorized loop used scalar byte loads. Any future compact broadcast loop
  must preserve contiguous access rather than optimize only tiny rows.
- The original and retained fused boolean helpers both leak argument MemInfos
  on invalid broadcasting: 20 failing calls give 40 allocations and zero frees.
  This is pre-existing, but must not be hidden by the valid-input benchmark.
  The rejected compact-loop experiment balanced those counts at 40/40.
- Inspection of llvmlite's `ffi/custom_passes.cpp` found fanout refprune's depth
  limit of 15, checked before loop-backedge detection. A mirrored graph walk on
  the fused LLVM reaches this cutoff through the vector main/epilogue/scalar
  paths. This is a concrete lead for an independent refprune regression test,
  not proof that raising the limit is a safe fix. Disabling vectorization
  removed the retained references; delaying early vectorization alone did not.

Next: minimize the long-boolean codegen regression and the refprune graph
separately. Preserve the source-level fusion patch as an independent change;
avoid bundling global pass-order changes or blanket forced inlining with it.
