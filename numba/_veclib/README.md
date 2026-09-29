# Vector math benchmarks

Exported unchanged from `numba/investigations/veclib_meeting_20260930`.
Requires the `vector-library-wiring` branches of Numba and llvmlite.

## Local Mac setup

```sh
cd numba/_veclib  # from the experiments repository root
conda activate numba-capstone
export NUMBA_CHECKOUT=/path/to/numba
export LLVMLITE_CHECKOUT=/path/to/llvmlite
export PYTHONPATH="$LLVMLITE_CHECKOUT:$NUMBA_CHECKOUT"
export NUMBA_OPT=3
```

One provider, just sqrt and sine:

```sh
NUMBA_VECTOR_MATH_LIBRARY=accelerate python benchmark.py --operations sqrt sin --output results/accelerate.jsonl
NUMBA_VECTOR_MATH_LIBRARY=none python benchmark.py --operations sqrt sin --output results/none.jsonl
```

Full comparison, three fresh processes per provider:

```sh
python run_benchmarks.py --providers none accelerate darwin_libsystem_m --output results/macos
```

On Linux, using an environment with both branches:

```sh
NUMBA_OPT=3 python run_benchmarks.py --providers none libmvec --load-libmvec --output results/linux
```

`--load-libmvec` explicitly loads the runtime for branch snapshots without
Numba's generalized loader. Optional `--cpu N` pins Linux runs using `taskset`.

## What is measured

`benchmark.py` writes JSON Lines containing metadata, timings, numerical checks
and actual call symbols. LLVM IR and assembly go under `results/ir/`.
Defaults: 12 operations, float32/float64, 4,096/262,144 elements, fastmath off/on.
Three warm-up calls and five calibration calls precede seven timed batches.
Compilation, allocation and numerical checks are outside the timed region.

`run_benchmarks.py` repeats the full suite in fresh processes with rotated
provider order. It sets the provider and disables the old SVML path; it also
clears `NUMBA_VECTOR_MATH_LIBRARY_PATH`. Use `benchmark.py` directly to test a
custom runtime path. Use a new output directory to preserve previous results.

## Why sqrt has no Accelerate call

LLVM's Accelerate table maps float32 sqrt to `vsqrtf`. In the saved M4 run,
the mapping and declaration are present, but the vector loop calls
`llvm.sqrt.v4f32`, which becomes `fsqrt.4s`. Both `none` and `accelerate`
use that hardware instruction. A declaration of `vsqrtf` is not a call to it.

For 262,144 float32 elements, fastmath=False, 21 samples across three processes:

| Selection | Mean ± sample std (ms) | Vector loop |
|---|---|---|
| none | 0.0322 ± 0.0013 | `fsqrt.4s` |
| accelerate | 0.0316 ± 0.0017 | `fsqrt.4s` |

Full saved results and generated code remain in the original Numba checkout at
`$NUMBA_CHECKOUT/numba/investigations/veclib_meeting_20260930/`.

Prepared with Codex assistance. Review before sharing upstream and retain
attribution under Numba's AI tools policy.
