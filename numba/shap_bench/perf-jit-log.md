# Symbolized Linux perf recordings

## 2026-09-29: setup and hypothesis

- Previous profiles lacked JIT address-to-symbol mappings. The new llvmlite
  perf listener should write jitdump records that `perf inject --jit` can use.
- Preserve old profiles. Use a new remote directory:
  `/tmp/shap-perf-jit.o4UxQr` on `user@profiling-host`.
- Existing LLVM 22.1.0 at `/tmp/llvm22-perf-demo/install` has
  `LLVM_USE_PERF=ON` and `libLLVMPerfJITEvents.a`; reuse it read-only.
- Built llvmlite PR #7, commit `aecbe8f79dd56bb2752b0f55b02791b285ef8e97`,
  in the new directory. No system packages or existing environments replaced.
- Build command from the cloned llvmlite checkout:
  `CMAKE_ARGS=-DLLVM_DIR=/tmp/llvm22-perf-demo/install/lib/cmake/llvm CMAKE_BUILD_PARALLEL_LEVEL=4 /tmp/shap-bench-venv/bin/python ffi/build.py`.
- Capability probe reports LLVM `(22, 1, 0)` and
  `has_perf_jit_events=True`. Actual dump generation still needs validation.
- Initial test invocation used nonexistent `TestJIT`; corrected to `TestMCJit`.
  The shallow clone also initially reported version `unknown`; fetch full
  history/tags to recover the version description.
- Next: test jitdump creation, record original and existing serial fusion with
  `NUMBA_DEBUGINFO=0`, inject mappings, measure unresolved leaf cycle share.
  Use a separate `NUMBA_DEBUGINFO=1` recording for source diagnostics.
- Recording uses perf control/ack FIFOs after warm-up and before validation,
  not a fixed startup delay. Kernels are the hash-verified SHAP original and
  the existing sequential parfor-fusion experiment, with no forced inlining.

## Capability and first end-to-end check

- Both PR tests passed: `TestMCJit.test_perf_jit_event_capability` and
  `TestMCJit.test_perf_jitdump_contains_debug_info` (2 tests, 0.061 s).
- Version after fetching tags: llvmlite `0.49.0dev0-98-gaecbe8f7`.
- The first recording exposed a perf 6.8 FIFO detail: acknowledgement messages
  end in `ack\n\0`; the next line therefore starts with a NUL. Driver rejected
  `\x00ack` after disabling events. Accept surrounding NUL/CR/LF, retain strict
  `ack` validation; fake FIFO tests verify both valid and malformed responses.
- Kept that diagnostic recording in `original-symbols`. Injection succeeded:
  `NRT_incref`, `NRT_decref`, `_mask_delta_score`, and its caller now resolve.
  Do not use this failed-driver run as the final result. Make fresh recordings.

## Fresh recordings and verification

- Completed `original-symbols-v2`, `fusion-symbols`, and `original-source`.
  All driver output checks passed; all three perf reports show zero lost samples.
- Original debug=0: 4,057 samples, 27 calls, 300.861 ms/call under profiling.
  Serial fusion debug=0: 3,998 samples, 411 calls, 19.473 ms/call.
  Original debug=1: 4,238 samples, 17 calls, 499.392 ms/call.
  These are single profiled-run means, not stable timing comparisons.
- Same original capture before/after injection: total event weight remains
  42,859,572,411; unresolved leaves drop from 81.2944% to 0.0000%.
  Unresolved ancestors remain on 5.7225%; unmarked truncation also occurs.
- Original leaves: `NRT_decref` 34.9672%, `NRT_incref` 28.6129%,
  `_mask_delta_score` 12.5826%. Generated NRT assembly contains atomic locked
  increments/decrements; cycle samples skid mostly to following instructions.
- Fusion leaves: `_reverse_window_score_gain` 91.8147%; no NRT refcount leaves
  sampled. Do not infer zero allocation or complete caller stacks from this.
- Debug-info annotation maps the original helper to source lines, but generated
  array-expression source is unavailable and line mappings can be approximate.
- Copied SVGs, folded stacks, reports, annotations, and logs to
  `perf-jit-2026-09-29/`. Raw data and jitdump/ELFs remain together on Linux.
- Next work, if needed: improve unwind information separately from symbolization;
  investigate surviving refcount operations with compiler IR and controlled
  timing. No compiler optimization changes were made in this profiling task.
