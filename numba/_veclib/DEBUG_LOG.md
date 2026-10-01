# Benchmark rerun log

## Plan — 29 September 2026

Known: the previous run included sqrt, and both selections generated hardware
vector sqrt on the M4. The earlier table did not clearly show which code ran.

Hypothesis: recording actual assembly symbols, dladdr runtime ownership, and
sqrt instructions will distinguish library calls from ordinary compilation.
Library declarations alone are insufficient evidence.

Minimal check: run sqrt/sin under none and Accelerate at 4,096 elements before
the full suite. Expect fsqrt.4s for sqrt and an Accelerate libvMisc.dylib owner
for vsinf. Investigate mismatches before starting the full runs.

Full runs: reuse the established environments and benchmark inputs. Three
fresh processes per provider, rotated order; seven warmed samples per case.
Mac providers: none, accelerate, darwin_libsystem_m. Linux: none, libmvec,
pinned to CPU 2. Save new results under results/macos and results/linux.
Retain previous investigation results. No timed kernel or input changes.

Report: show timing, baseline-relative speedup, emitted symbol/instruction and
whether it comes from the selected library. Preserve all samples, numerical
checks and actual symbol owners in JSON and generated IR/assembly files.

## Pilot and measurement

- Mac pilot: all eight sqrt/sin cases passed. sqrt emits fsqrt.4s/fsqrt.2d;
  vsinf resolves into Accelerate's libvMisc.dylib. Scalar sinf resolves to
  numba_sinf in Numba's _helperlib, which forwards to system math.
- Linux pilot: all eight cases passed. sqrt emits vsqrtps/vsqrtpd; _ZGV sine
  symbols resolve into libmvec.so.1. Scalar sin/sinf resolve to _helperlib.
- Mac full run: 864 successful cases, 6,048 timing samples; no failed cases.
  Source commits, tracked-change fingerprints and benchmark script hashes are
  in results/macos/provenance.json. Started 2026-09-30 06:49 UTC.
- Independent inspection of call detection found the unused vsqrtf declaration
  correctly excluded and backend-generated scalar sinf correctly included.
- Linux full run: 576 successful cases across six processes, CPU affinity [2],
  wall time 41.14 seconds. New results fetched into results/linux; original
  remote results and source trees preserved. Both hosts used identical scripts.

## Report and final checks

- RESULTS.md includes all operations at 262,144 elements with fastmath=False,
  separated by machine and dtype. full-results.md includes both sizes and
  fastmath settings. Raw samples and resolved symbol owners are retained.
- Scalar log2 already belongs to libsystem_m with none on macOS. The report
  marks scalar/vector explicitly so ownership does not imply replacement.
- Eight temporary report fixture/pilot tests passed. Full aggregation validates
  480 configurations, three rounds each and seven samples per round; no missing,
  duplicate or failed cases. All external math symbol owners are resolved.
- Independent audit recomputed every mean, standard deviation and speedup;
  verified 10,080 samples, assembly evidence and matching harness hashes on both
  hosts. git diff --check passed. No additional timings needed for report edits.

## Table simplification

- Added Different from none?: true exactly when displayed symbols/instructions
  differ from the matching baseline. Hardware sqrt remains false.
- Removed the closing explanatory section. summarize.py now generates only
  RESULTS.md for the existing large-array, fastmath=False tables.
- Verified all 120 rows against the previous report: timings, speedups and
  symbols unchanged; 34 true and 86 false. No benchmark rerun.

## Precision comparison — 30 September 2026

- Previous ULP values used NumPy as reference. New runs compare saved provider
  outputs directly with saved none outputs on identical, hashed input arrays.
- ULP distance counts representable steps, with signed zeros merged for the
  finite metric. NaN, infinity and signed-zero disagreements are counted
  separately. Boundary tests cover both precisions and opposite maxfinite.
- Inputs: the exact previous benchmark arrays; 65,536 broad-domain samples;
  deterministic edge values repeated in full SIMD groups. All runs fastmath=False.
- Initial Mac pilot failed before compilation: create_pass_builder() got an
  unexpected keyword argument 'vector_library'. The user's llvmlite checkout
  is now veclib_pto (71bb13fb), while Numba expects vector-library-wiring.
- Left that checkout unchanged. Built an isolated `vector-library-wiring`
  clone at `2352785c` with LLVM 22.1.0, Release, LTO off.
- Isolated build and Mac edge pilot passed. Full collection completed:
  144 Mac comparisons and 72 Linux comparisons, 23,765,760 output pairs.
- Recomputed all 216 comparison rows from saved arrays and verified input
  hashes. Every benchmark-profile output checksum matches the earlier timed
  run. Maximum observed finite distance is 4 ULP; every case's P99 is at most 2.
- Edge tests found -0 to +0 changes: Accelerate fp32 tan/log1p/expm1, Darwin
  fp32/fp64 tan. check_signed_zero.py reproduced all five in fresh processes
  with 64 identical negative-zero inputs. No NaN/infinity-class mismatches.
- PRECISION.md contains all three input profiles. RESULTS.md adds the maximum
  ULP difference for the matching benchmark inputs; timing and symbol-change
  columns retain their previous values. No performance timings were rerun.

## Simple NumPy comparison

- check_ulp.py now loops over all 12 functions and fp32/fp64, comparing directly
  with same-dtype NumPy outputs. erf uses math.erf, labelled explicitly.
- Prints only function, dtype, maximum ULP and reference. Tested all 24 cases
  with none, accelerate and darwin_libsystem_m; all three runs completed.
