# Vector math benchmarks

Benchmarks for the `vector-library-wiring` branches of Numba and llvmlite.

- [Results](RESULTS.md): all 12 operations, split by machine and dtype, with
  timing, speedup, maximum ULP difference and emitted symbols/instructions.
- [Precision](PRECISION.md): differences from `none` on benchmark, wider-range
  and edge inputs. Compact comparisons, manifests, IR and assembly are under
  `precision/`; raw output arrays remain outside Git.
- Raw process records, LLVM IR, assembly and provenance: `results/macos/`
  and `results/linux/`.

## Local Mac setup

From the scratchpad repository root, set `LLVMLITE_CHECKOUT` and
`NUMBA_CHECKOUT` to matching branch checkouts:

```sh
cd numba/_veclib
conda activate numba-capstone
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
python summarize.py --machines macos
```

On Linux, using an environment with both branches:

```sh
NUMBA_OPT=3 python run_benchmarks.py --providers none libmvec --load-libmvec --output results/linux
```

`--load-libmvec` explicitly loads the runtime for branch snapshots without
Numba's generalized loader. Optional `--cpu N` pins Linux runs using `taskset`.
After collecting both machines' results in this directory, `python summarize.py`
regenerates the combined report without running benchmarks again.

## What is measured

`benchmark.py` writes JSON Lines containing metadata, timings, numerical checks,
emitted math symbols, runtime ownership from `dladdr`, and sqrt instructions.
LLVM IR and assembly go under the chosen output directory's `ir/` subdirectory.
Defaults: 12 operations, float32/float64, 4,096/262,144 elements, fastmath off/on.
Three warm-up calls and five calibration calls precede seven timed batches.
Compilation, allocation, symbol inspection and numerical checks are outside
the timed region. `summarize.py` writes only the 262,144-element, fastmath=False
tables to `RESULTS.md`, comparing each row's symbols with its `none` baseline.

`run_benchmarks.py` repeats the full suite in fresh processes with rotated
provider order. It sets the provider and disables the old SVML path; it also
clears `NUMBA_VECTOR_MATH_LIBRARY_PATH`. Use `benchmark.py` directly to test a
custom runtime path. Use a new output directory to preserve previous results.

## Why sqrt has no Accelerate call

LLVM's Accelerate table maps float32 sqrt to `vsqrtf`. In the saved M4 run,
the mapping and declaration are present, but the vector loop calls
`llvm.sqrt.v4f32`, which becomes `fsqrt.4s`. Both `none` and `accelerate`
use that hardware instruction. A declaration of `vsqrtf` is not a call to it.

The resolved library paths and symbol names are retained in the raw JSON.
Local usernames and hostnames in published records are placeholders; numeric
measurements and source hashes are unchanged.

The rerun uses the same branch commits on both machines; macOS includes local
loader/cache changes, while Linux loads libmvec explicitly in the harness.
Disk compilation caching is not used. Each host is compared against its own
`none` baseline.

## Precision runs

For a small example, `ulp_check/check_ulp.py` loops over all 12 functions in fp32/fp64
and prints maximum ULP differences from NumPy:

```sh
NUMBA_VECTOR_MATH_LIBRARY=none python ulp_check/check_ulp.py
NUMBA_VECTOR_MATH_LIBRARY=accelerate python ulp_check/check_ulp.py
```

Each invocation compares directly with NumPy; no saved baseline is needed.
Inputs are in [0.125, 1], with power exponents in [-2, 2]. NumPy has no `erf`,
so that row uses `math.erf` rounded to the tested dtype. Use the matching
llvmlite environment below.

The precision run uses the exact benchmark inputs, 65,536 wider-range samples,
and deterministic edge cases repeated in full SIMD groups. All runs use
fastmath=False. Each provider runs in a fresh process, then its saved output is
compared with `none` on byte-identical inputs. P99 and maxima count finite
representable steps; NaN/infinity and signed-zero differences are separate.
Exact worst inputs and both outputs are saved in decimal and hexadecimal in
each machine's `comparison.json`.

The recorded Mac precision run used an isolated llvmlite
`vector-library-wiring` checkout at commit `2352785c`. For a rerun:

```sh
export PYTHONPATH="$LLVMLITE_CHECKOUT:$NUMBA_CHECKOUT"
python precision.py --output precision/macos --providers none accelerate darwin_libsystem_m
```

Linux, with the existing `vector-library-wiring` environments:

```sh
python precision.py --output precision/linux --providers none libmvec --load-libmvec
```

Use a new output directory for another run; existing provider directories are
not overwritten. Regenerate the reports from the checked-in comparison
JSON with:

```sh
python summarize_precision.py
python summarize.py
```

`check_signed_zero.py` reproduces the observed macOS zero-sign differences:

```sh
NUMBA_VECTOR_MATH_LIBRARY=none python check_signed_zero.py
NUMBA_VECTOR_MATH_LIBRARY=accelerate python check_signed_zero.py
NUMBA_VECTOR_MATH_LIBRARY=darwin_libsystem_m python check_signed_zero.py
```

Prepared with Codex assistance. Review before sharing upstream and retain
attribution under Numba's AI tools policy.
