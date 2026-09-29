# Third-party material

- The clustering kernels in `numba/shap_bench/original_numba_debug.py`, its
  `diff/` copy, and the optimized variants are adapted from
  [SHAP](https://github.com/shap/shap). SHAP is Copyright (c) 2018 Scott
  Lundberg and licensed under the [MIT license](third_party/SHAP-MIT.txt).
  The exact upstream SHAP revision was not recorded with the original local
  snapshots; `numba/shap_bench/diff/sources.sha256` identifies the two local
  kernel variants.
- The flamegraph SVGs under `numba/shap_bench/` were generated with
  [Brendan Gregg's FlameGraph](https://github.com/brendangregg/FlameGraph).
  Their embedded scripts derive from its
  [CDDL-licensed source](https://github.com/brendangregg/FlameGraph/blob/master/flamegraph.pl).
  The [CDDL 1.0 text](third_party/FlameGraph-CDDL-1.0.txt) is included here.
- `numba/shap_bench/discarded-custom-fusion.patch` includes a diff against
  [Numba](https://github.com/numba/numba) source. Numba's
  [BSD 2-Clause license](third_party/Numba-BSD-2-Clause.txt) is included here.

These notices apply to the identified third-party material. The repository
owner should choose a separate license for original work.
