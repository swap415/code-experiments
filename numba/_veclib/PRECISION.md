# Vector math precision compared with none

ULP = representable floating-point steps from `none`, which is a comparison baseline, not an accuracy oracle. fastmath=False.

Max, P99 and Different use finite pairs; NaN/infinity disagreements and signed-zero differences are counted separately. [Input definitions](precision_inputs.py).

## macos: apple-m4

macOS-26.6.2-arm64-arm-64bit-Mach-O; LLVM 22.1.0.

### float32

#### Benchmark inputs

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 262,144 / 262,144 | 2 | 1 | 21.9795 | 0 | 0 |
| sin | `darwin_libsystem_m` | 262,144 / 262,144 | 2 | 1 | 21.9795 | 0 | 0 |
| cos | `accelerate` | 262,144 / 262,144 | 2 | 1 | 29.9076 | 0 | 0 |
| cos | `darwin_libsystem_m` | 262,144 / 262,144 | 2 | 1 | 29.9076 | 0 | 0 |
| tan | `accelerate` | 262,144 / 262,144 | 2 | 1 | 40.44 | 0 | 0 |
| tan | `darwin_libsystem_m` | 262,144 / 262,144 | 2 | 1 | 40.44 | 0 | 0 |
| exp | `accelerate` | 262,144 / 262,144 | 2 | 1 | 12.2723 | 0 | 0 |
| exp | `darwin_libsystem_m` | 262,144 / 262,144 | 2 | 1 | 12.2723 | 0 | 0 |
| log | `accelerate` | 262,144 / 262,144 | 1 | 1 | 7.7503 | 0 | 0 |
| log | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 262,144 / 262,144 | 2 | 1 | 35.1345 | 0 | 0 |
| log1p | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 262,144 / 262,144 | 3 | 1 | 25.523 | 0 | 0 |
| expm1 | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 262,144 / 262,144 | 3 | 1 | 18.8469 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 262,144 / 262,144 | 3 | 1 | 18.8469 | 0 | 0 |
| sqrt | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 262,144 / 262,144 | 1 | 1 | 30.4199 | 0 | 0 |
| erf | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |

#### Wider input ranges

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 65,536 / 65,536 | 2 | 1 | 31.9016 | 0 | 0 |
| sin | `darwin_libsystem_m` | 65,536 / 65,536 | 2 | 1 | 31.9016 | 0 | 0 |
| cos | `accelerate` | 65,536 / 65,536 | 2 | 1 | 28.7704 | 0 | 0 |
| cos | `darwin_libsystem_m` | 65,536 / 65,536 | 2 | 1 | 28.7704 | 0 | 0 |
| tan | `accelerate` | 65,536 / 65,536 | 3 | 2 | 47.1512 | 0 | 0 |
| tan | `darwin_libsystem_m` | 65,536 / 65,536 | 3 | 2 | 47.1512 | 0 | 0 |
| exp | `accelerate` | 65,287 / 65,536 | 1 | 1 | 13.796 | 0 | 0 |
| exp | `darwin_libsystem_m` | 65,287 / 65,536 | 1 | 1 | 13.796 | 0 | 0 |
| log | `accelerate` | 65,536 / 65,536 | 1 | 0 | 0.6378 | 0 | 0 |
| log | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 65,536 / 65,536 | 2 | 1 | 33.6472 | 0 | 0 |
| log1p | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 65,416 / 65,536 | 3 | 1 | 2.5315 | 0 | 0 |
| expm1 | `darwin_libsystem_m` | 65,416 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 65,536 / 65,536 | 3 | 1 | 23.0194 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 65,536 / 65,536 | 3 | 1 | 23.0194 | 0 | 0 |
| sqrt | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 65,536 / 65,536 | 1 | 1 | 30.6992 | 0 | 0 |
| erf | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |

#### Boundary and special inputs

Each distinct input is repeated 16 times; padding completes vector batches.

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 3,280 / 3,328 | 1 | 1 | 23.4146 | 0 | 0 |
| sin | `darwin_libsystem_m` | 3,280 / 3,328 | 1 | 1 | 23.4146 | 0 | 0 |
| cos | `accelerate` | 3,280 / 3,328 | 2 | 1 | 42.439 | 0 | 0 |
| cos | `darwin_libsystem_m` | 3,280 / 3,328 | 2 | 1 | 42.439 | 0 | 0 |
| tan | `accelerate` | 3,280 / 3,328 | 2 | 1 | 23.4146 | 0 | 16 |
| tan | `darwin_libsystem_m` | 3,280 / 3,328 | 2 | 1 | 23.4146 | 0 | 16 |
| exp | `accelerate` | 1,408 / 1,600 | 1 | 1 | 2.2727 | 0 | 0 |
| exp | `darwin_libsystem_m` | 1,408 / 1,600 | 1 | 1 | 2.2727 | 0 | 0 |
| log | `accelerate` | 880 / 1,408 | 1 | 1 | 1.8182 | 0 | 0 |
| log | `darwin_libsystem_m` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 1,200 / 1,408 | 1 | 1 | 13.3333 | 0 | 16 |
| log1p | `darwin_libsystem_m` | 1,200 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 1,408 / 1,600 | 1 | 1 | 15.9091 | 0 | 16 |
| expm1 | `darwin_libsystem_m` | 1,408 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 2,160 / 2,176 | 1 | 1 | 4.4444 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 2,160 / 2,176 | 1 | 1 | 4.4444 | 0 | 0 |
| sqrt | `accelerate` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 3,760 / 5,632 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 3,760 / 5,632 | 1 | 1 | 1.2766 | 0 | 0 |
| erf | `accelerate` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |

### float64

#### Benchmark inputs

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| sin | `darwin_libsystem_m` | 262,144 / 262,144 | 3 | 2 | 64.4108 | 0 | 0 |
| cos | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| cos | `darwin_libsystem_m` | 262,144 / 262,144 | 3 | 2 | 61.4601 | 0 | 0 |
| tan | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tan | `darwin_libsystem_m` | 262,144 / 262,144 | 3 | 2 | 43.8248 | 0 | 0 |
| exp | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| exp | `darwin_libsystem_m` | 262,144 / 262,144 | 1 | 1 | 25.9724 | 0 | 0 |
| log | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log1p | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 262,144 / 262,144 | 3 | 1 | 21.9841 | 0 | 0 |
| sqrt | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 262,144 / 262,144 | 1 | 1 | 25.7912 | 0 | 0 |
| erf | `accelerate` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |

#### Wider input ranges

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| sin | `darwin_libsystem_m` | 65,536 / 65,536 | 3 | 2 | 42.4042 | 0 | 0 |
| cos | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| cos | `darwin_libsystem_m` | 65,536 / 65,536 | 3 | 2 | 67.5919 | 0 | 0 |
| tan | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tan | `darwin_libsystem_m` | 65,536 / 65,536 | 4 | 2 | 35.5133 | 0 | 0 |
| exp | `accelerate` | 65,500 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| exp | `darwin_libsystem_m` | 65,500 / 65,536 | 1 | 1 | 25.313 | 0 | 0 |
| log | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log1p | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 65,517 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `darwin_libsystem_m` | 65,517 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 65,536 / 65,536 | 3 | 2 | 27.0676 | 0 | 0 |
| sqrt | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 65,536 / 65,536 | 1 | 1 | 25.8011 | 0 | 0 |
| erf | `accelerate` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |

#### Boundary and special inputs

Each distinct input is repeated 16 times; padding completes vector batches.

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `accelerate` | 3,280 / 3,328 | 0 | 0 | 0 | 0 | 0 |
| sin | `darwin_libsystem_m` | 3,280 / 3,328 | 1 | 1 | 19.5122 | 0 | 0 |
| cos | `accelerate` | 3,280 / 3,328 | 0 | 0 | 0 | 0 | 0 |
| cos | `darwin_libsystem_m` | 3,280 / 3,328 | 2 | 2 | 63.9024 | 0 | 0 |
| tan | `accelerate` | 3,280 / 3,328 | 0 | 0 | 0 | 0 | 0 |
| tan | `darwin_libsystem_m` | 3,280 / 3,328 | 2 | 2 | 16.5854 | 0 | 16 |
| exp | `accelerate` | 1,424 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| exp | `darwin_libsystem_m` | 1,424 / 1,600 | 1 | 1 | 8.9888 | 0 | 0 |
| log | `accelerate` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log | `darwin_libsystem_m` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log1p | `accelerate` | 1,200 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log1p | `darwin_libsystem_m` | 1,200 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `accelerate` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `darwin_libsystem_m` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `accelerate` | 1,424 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `darwin_libsystem_m` | 1,424 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| tanh | `accelerate` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
| tanh | `darwin_libsystem_m` | 2,160 / 2,176 | 1 | 1 | 8.8889 | 0 | 0 |
| sqrt | `accelerate` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `darwin_libsystem_m` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| power | `accelerate` | 3,760 / 5,632 | 0 | 0 | 0 | 0 | 0 |
| power | `darwin_libsystem_m` | 3,760 / 5,632 | 1 | 0 | 0.4255 | 0 | 0 |
| erf | `accelerate` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
| erf | `darwin_libsystem_m` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |

## linux: raptorlake

Linux-6.8.0-139-generic-x86_64-with-glibc2.39; LLVM 22.1.0.

### float32

#### Benchmark inputs

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 262,144 / 262,144 | 2 | 1 | 14.7751 | 0 | 0 |
| cos | `libmvec` | 262,144 / 262,144 | 2 | 1 | 29.134 | 0 | 0 |
| tan | `libmvec` | 262,144 / 262,144 | 3 | 1 | 39.3284 | 0 | 0 |
| exp | `libmvec` | 262,144 / 262,144 | 2 | 2 | 52.0405 | 0 | 0 |
| log | `libmvec` | 262,144 / 262,144 | 4 | 2 | 28.685 | 0 | 0 |
| log1p | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 262,144 / 262,144 | 1 | 1 | 5.2162 | 0 | 0 |
| erf | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |

#### Wider input ranges

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 65,536 / 65,536 | 2 | 1 | 12.9013 | 0 | 0 |
| cos | `libmvec` | 65,536 / 65,536 | 2 | 1 | 13.9435 | 0 | 0 |
| tan | `libmvec` | 65,536 / 65,536 | 3 | 2 | 25.7874 | 0 | 0 |
| exp | `libmvec` | 65,287 / 65,536 | 2 | 2 | 46.5024 | 0 | 0 |
| log | `libmvec` | 65,536 / 65,536 | 4 | 1 | 4.4647 | 0 | 0 |
| log1p | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 65,416 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 65,536 / 65,536 | 1 | 1 | 5.246 | 0 | 0 |
| erf | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |

#### Boundary and special inputs

Each distinct input is repeated 16 times; padding completes vector batches.

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 3,280 / 3,328 | 1 | 1 | 6.8293 | 0 | 0 |
| cos | `libmvec` | 3,280 / 3,328 | 1 | 1 | 7.8049 | 0 | 0 |
| tan | `libmvec` | 3,280 / 3,328 | 1 | 1 | 10.7317 | 0 | 0 |
| exp | `libmvec` | 1,408 / 1,600 | 2 | 2 | 20.4545 | 0 | 0 |
| log | `libmvec` | 880 / 1,408 | 1 | 1 | 3.6364 | 0 | 0 |
| log1p | `libmvec` | 1,200 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 1,408 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 3,760 / 5,632 | 1 | 1 | 2.1277 | 0 | 0 |
| erf | `libmvec` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |

### float64

#### Benchmark inputs

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 262,144 / 262,144 | 3 | 2 | 64.2632 | 0 | 0 |
| cos | `libmvec` | 262,144 / 262,144 | 3 | 2 | 62.3875 | 0 | 0 |
| tan | `libmvec` | 262,144 / 262,144 | 2 | 1 | 38.3564 | 0 | 0 |
| exp | `libmvec` | 262,144 / 262,144 | 3 | 2 | 43.3693 | 0 | 0 |
| log | `libmvec` | 262,144 / 262,144 | 1 | 1 | 24.2657 | 0 | 0 |
| log1p | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 262,144 / 262,144 | 1 | 1 | 25.7557 | 0 | 0 |
| erf | `libmvec` | 262,144 / 262,144 | 0 | 0 | 0 | 0 | 0 |

#### Wider input ranges

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 65,536 / 65,536 | 3 | 2 | 31.7856 | 0 | 0 |
| cos | `libmvec` | 65,536 / 65,536 | 3 | 2 | 32.8781 | 0 | 0 |
| tan | `libmvec` | 65,536 / 65,536 | 3 | 2 | 31.34 | 0 | 0 |
| exp | `libmvec` | 65,500 / 65,536 | 3 | 2 | 42.313 | 0 | 0 |
| log | `libmvec` | 65,536 / 65,536 | 1 | 1 | 21.109 | 0 | 0 |
| log1p | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 65,517 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 65,536 / 65,536 | 1 | 1 | 25.7233 | 0 | 0 |
| erf | `libmvec` | 65,536 / 65,536 | 0 | 0 | 0 | 0 | 0 |

#### Boundary and special inputs

Each distinct input is repeated 16 times; padding completes vector batches.

| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | Different (%) | Special mismatches | ±0 differences |
|---|---|---:|---:|---:|---:|---:|---:|
| sin | `libmvec` | 3,280 / 3,328 | 2 | 2 | 16.5854 | 0 | 0 |
| cos | `libmvec` | 3,280 / 3,328 | 1 | 1 | 15.122 | 0 | 0 |
| tan | `libmvec` | 3,280 / 3,328 | 1 | 1 | 16.5854 | 0 | 0 |
| exp | `libmvec` | 1,424 / 1,600 | 1 | 1 | 13.4831 | 0 | 0 |
| log | `libmvec` | 880 / 1,408 | 1 | 1 | 5.4545 | 0 | 0 |
| log1p | `libmvec` | 1,200 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| log2 | `libmvec` | 880 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| expm1 | `libmvec` | 1,424 / 1,600 | 0 | 0 | 0 | 0 | 0 |
| tanh | `libmvec` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
| sqrt | `libmvec` | 912 / 1,408 | 0 | 0 | 0 | 0 | 0 |
| power | `libmvec` | 3,760 / 5,632 | 1 | 0 | 0.8511 | 0 | 0 |
| erf | `libmvec` | 2,160 / 2,176 | 0 | 0 | 0 | 0 | 0 |
