# Vector math benchmark results — all configurations

Times are **milliseconds per whole-array call**, mean ± sample standard deviation. Each row combines **21 samples from three fresh processes**. **Speedup = `none` time ÷ selected-library time** for the same machine, operation, dtype, array size and fastmath setting; **greater than 1 is faster, less than 1 is slower**.

The symbol column shows vector calls or square-root instructions found in assembly; otherwise it shows emitted scalar math symbols. Scalar remainder calls are omitted when a vector call is shown. The JSON retains all inspected math calls and their resolved library paths.

Measured 2026-09-30 (UTC).

## macos: apple-m4

macOS-26.6.2-arm64-arm-64bit-Mach-O; LLVM 22.1.0, Python 3.13.15, NumPy 2.5.2.

### 4,096 elements · fastmath=False

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0085 ± 0.0002 | 1.00× (baseline) | `sinf` |
| sin | `accelerate` | 0.0022 ± 0.0001 | 3.91× | `vsinf` |
| sin | `darwin_libsystem_m` | 0.0022 ± 0.0001 | 3.90× | `_simd_sin_f4` |
| cos | `none` | 0.0096 ± 0.0002 | 1.00× (baseline) | `cosf` |
| cos | `accelerate` | 0.0023 ± 0.0001 | 4.19× | `vcosf` |
| cos | `darwin_libsystem_m` | 0.0022 ± 0.0000 | 4.35× | `_simd_cos_f4` |
| tan | `none` | 0.0096 ± 0.0003 | 1.00× (baseline) | `tanf` |
| tan | `accelerate` | 0.0027 ± 0.0001 | 3.57× | `vtanf` |
| tan | `darwin_libsystem_m` | 0.0027 ± 0.0001 | 3.57× | `_simd_tan_f4` |
| exp | `none` | 0.0058 ± 0.0001 | 1.00× (baseline) | `expf` |
| exp | `accelerate` | 0.0025 ± 0.0001 | 2.30× | `vexpf` |
| exp | `darwin_libsystem_m` | 0.0025 ± 0.0000 | 2.35× | `_simd_exp_f4` |
| log | `none` | 0.0069 ± 0.0001 | 1.00× (baseline) | `logf` |
| log | `accelerate` | 0.0033 ± 0.0001 | 2.08× | `vlogf` |
| log | `darwin_libsystem_m` | 0.0069 ± 0.0002 | 1.00× | `logf` |
| log1p | `none` | 0.0085 ± 0.0002 | 1.00× (baseline) | `log1pf` |
| log1p | `accelerate` | 0.0039 ± 0.0002 | 2.20× | `vlog1pf` |
| log1p | `darwin_libsystem_m` | 0.0085 ± 0.0002 | 1.00× | `log1pf` |
| log2 | `none` | 0.0053 ± 0.0001 | 1.00× (baseline) | `log2f` |
| log2 | `accelerate` | 0.0054 ± 0.0001 | 0.99× | `log2f` |
| log2 | `darwin_libsystem_m` | 0.0054 ± 0.0001 | 0.98× | `log2f` |
| expm1 | `none` | 0.0106 ± 0.0002 | 1.00× (baseline) | `expm1f` |
| expm1 | `accelerate` | 0.0029 ± 0.0001 | 3.71× | `vexpm1f` |
| expm1 | `darwin_libsystem_m` | 0.0106 ± 0.0002 | 1.00× | `expm1f` |
| tanh | `none` | 0.0093 ± 0.0003 | 1.00× (baseline) | `tanhf` |
| tanh | `accelerate` | 0.0031 ± 0.0001 | 2.99× | `vtanhf` |
| tanh | `darwin_libsystem_m` | 0.0030 ± 0.0001 | 3.07× | `_simd_tanh_f4` |
| sqrt | `none` | 0.0007 ± 0.0000 | 1.00× (baseline) | `fsqrt.4s` |
| sqrt | `accelerate` | 0.0007 ± 0.0000 | 1.03× | `fsqrt.4s` |
| sqrt | `darwin_libsystem_m` | 0.0007 ± 0.0000 | 1.02× | `fsqrt.4s` |
| power | `none` | 0.0103 ± 0.0003 | 1.00× (baseline) | `powf` |
| power | `accelerate` | 0.0101 ± 0.0002 | 1.01× | `powf` |
| power | `darwin_libsystem_m` | 0.0062 ± 0.0001 | 1.64× | `_simd_pow_f4` |
| erf | `none` | 0.0080 ± 0.0002 | 1.00× (baseline) | `erff` |
| erf | `accelerate` | 0.0083 ± 0.0004 | 0.96× | `erff` |
| erf | `darwin_libsystem_m` | 0.0068 ± 0.0001 | 1.17× | `_simd_erf_f4` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0109 ± 0.0004 | 1.00× (baseline) | `sin` |
| sin | `accelerate` | 0.0110 ± 0.0005 | 0.98× | `sin` |
| sin | `darwin_libsystem_m` | 0.0060 ± 0.0003 | 1.82× | `_simd_sin_d2` |
| cos | `none` | 0.0106 ± 0.0004 | 1.00× (baseline) | `cos` |
| cos | `accelerate` | 0.0108 ± 0.0008 | 0.98× | `cos` |
| cos | `darwin_libsystem_m` | 0.0062 ± 0.0001 | 1.71× | `_simd_cos_d2` |
| tan | `none` | 0.0102 ± 0.0001 | 1.00× (baseline) | `tan` |
| tan | `accelerate` | 0.0107 ± 0.0006 | 0.96× | `tan` |
| tan | `darwin_libsystem_m` | 0.0060 ± 0.0001 | 1.71× | `_simd_tan_d2` |
| exp | `none` | 0.0098 ± 0.0002 | 1.00× (baseline) | `exp` |
| exp | `accelerate` | 0.0100 ± 0.0004 | 0.98× | `exp` |
| exp | `darwin_libsystem_m` | 0.0061 ± 0.0001 | 1.62× | `_simd_exp_d2` |
| log | `none` | 0.0092 ± 0.0003 | 1.00× (baseline) | `log` |
| log | `accelerate` | 0.0092 ± 0.0002 | 1.00× | `log` |
| log | `darwin_libsystem_m` | 0.0092 ± 0.0001 | 1.00× | `log` |
| log1p | `none` | 0.0133 ± 0.0011 | 1.00× (baseline) | `log1p` |
| log1p | `accelerate` | 0.0130 ± 0.0005 | 1.02× | `log1p` |
| log1p | `darwin_libsystem_m` | 0.0130 ± 0.0004 | 1.02× | `log1p` |
| log2 | `none` | 0.0075 ± 0.0003 | 1.00× (baseline) | `log2` |
| log2 | `accelerate` | 0.0074 ± 0.0001 | 1.02× | `log2` |
| log2 | `darwin_libsystem_m` | 0.0074 ± 0.0002 | 1.01× | `log2` |
| expm1 | `none` | 0.0106 ± 0.0003 | 1.00× (baseline) | `expm1` |
| expm1 | `accelerate` | 0.0107 ± 0.0003 | 0.99× | `expm1` |
| expm1 | `darwin_libsystem_m` | 0.0108 ± 0.0002 | 0.99× | `expm1` |
| tanh | `none` | 0.0134 ± 0.0018 | 1.00× (baseline) | `tanh` |
| tanh | `accelerate` | 0.0128 ± 0.0005 | 1.05× | `tanh` |
| tanh | `darwin_libsystem_m` | 0.0080 ± 0.0001 | 1.69× | `_simd_tanh_d2` |
| sqrt | `none` | 0.0012 ± 0.0001 | 1.00× (baseline) | `fsqrt.2d` |
| sqrt | `accelerate` | 0.0012 ± 0.0000 | 1.02× | `fsqrt.2d` |
| sqrt | `darwin_libsystem_m` | 0.0012 ± 0.0000 | 1.03× | `fsqrt.2d` |
| power | `none` | 0.0225 ± 0.0029 | 1.00× (baseline) | `pow` |
| power | `accelerate` | 0.0212 ± 0.0007 | 1.06× | `pow` |
| power | `darwin_libsystem_m` | 0.0165 ± 0.0004 | 1.36× | `_simd_pow_d2` |
| erf | `none` | 0.0328 ± 0.0010 | 1.00× (baseline) | `erf` |
| erf | `accelerate` | 0.0325 ± 0.0006 | 1.01× | `erf` |
| erf | `darwin_libsystem_m` | 0.0363 ± 0.0081 | 0.90× | `_simd_erf_d2` |

### 4,096 elements · fastmath=True

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0086 ± 0.0002 | 1.00× (baseline) | `sinf` |
| sin | `accelerate` | 0.0022 ± 0.0001 | 3.87× | `vsinf` |
| sin | `darwin_libsystem_m` | 0.0022 ± 0.0001 | 3.92× | `_simd_sin_f4` |
| cos | `none` | 0.0098 ± 0.0004 | 1.00× (baseline) | `cosf` |
| cos | `accelerate` | 0.0023 ± 0.0000 | 4.30× | `vcosf` |
| cos | `darwin_libsystem_m` | 0.0022 ± 0.0001 | 4.37× | `_simd_cos_f4` |
| tan | `none` | 0.0096 ± 0.0003 | 1.00× (baseline) | `tanf` |
| tan | `accelerate` | 0.0027 ± 0.0001 | 3.55× | `vtanf` |
| tan | `darwin_libsystem_m` | 0.0027 ± 0.0000 | 3.61× | `_simd_tan_f4` |
| exp | `none` | 0.0059 ± 0.0001 | 1.00× (baseline) | `expf` |
| exp | `accelerate` | 0.0026 ± 0.0001 | 2.27× | `vexpf` |
| exp | `darwin_libsystem_m` | 0.0025 ± 0.0000 | 2.36× | `_simd_exp_f4` |
| log | `none` | 0.0070 ± 0.0003 | 1.00× (baseline) | `logf` |
| log | `accelerate` | 0.0034 ± 0.0001 | 2.09× | `vlogf` |
| log | `darwin_libsystem_m` | 0.0069 ± 0.0002 | 1.01× | `logf` |
| log1p | `none` | 0.0084 ± 0.0001 | 1.00× (baseline) | `log1pf` |
| log1p | `accelerate` | 0.0039 ± 0.0002 | 2.18× | `vlog1pf` |
| log1p | `darwin_libsystem_m` | 0.0085 ± 0.0002 | 0.99× | `log1pf` |
| log2 | `none` | 0.0054 ± 0.0003 | 1.00× (baseline) | `log2f` |
| log2 | `accelerate` | 0.0054 ± 0.0001 | 1.01× | `log2f` |
| log2 | `darwin_libsystem_m` | 0.0054 ± 0.0001 | 1.00× | `log2f` |
| expm1 | `none` | 0.0107 ± 0.0002 | 1.00× (baseline) | `expm1f` |
| expm1 | `accelerate` | 0.0029 ± 0.0001 | 3.70× | `vexpm1f` |
| expm1 | `darwin_libsystem_m` | 0.0108 ± 0.0003 | 0.99× | `expm1f` |
| tanh | `none` | 0.0097 ± 0.0008 | 1.00× (baseline) | `tanhf` |
| tanh | `accelerate` | 0.0031 ± 0.0001 | 3.13× | `vtanhf` |
| tanh | `darwin_libsystem_m` | 0.0030 ± 0.0001 | 3.23× | `_simd_tanh_f4` |
| sqrt | `none` | 0.0007 ± 0.0000 | 1.00× (baseline) | `fsqrt.4s` |
| sqrt | `accelerate` | 0.0007 ± 0.0000 | 0.99× | `fsqrt.4s` |
| sqrt | `darwin_libsystem_m` | 0.0007 ± 0.0000 | 1.02× | `fsqrt.4s` |
| power | `none` | 0.0101 ± 0.0001 | 1.00× (baseline) | `powf` |
| power | `accelerate` | 0.0104 ± 0.0006 | 0.97× | `powf` |
| power | `darwin_libsystem_m` | 0.0063 ± 0.0002 | 1.61× | `_simd_pow_f4` |
| erf | `none` | 0.0080 ± 0.0003 | 1.00× (baseline) | `erff` |
| erf | `accelerate` | 0.0082 ± 0.0002 | 0.98× | `erff` |
| erf | `darwin_libsystem_m` | 0.0068 ± 0.0002 | 1.19× | `_simd_erf_f4` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0111 ± 0.0002 | 1.00× (baseline) | `sin` |
| sin | `accelerate` | 0.0110 ± 0.0004 | 1.01× | `sin` |
| sin | `darwin_libsystem_m` | 0.0059 ± 0.0001 | 1.88× | `_simd_sin_d2` |
| cos | `none` | 0.0111 ± 0.0019 | 1.00× (baseline) | `cos` |
| cos | `accelerate` | 0.0105 ± 0.0002 | 1.05× | `cos` |
| cos | `darwin_libsystem_m` | 0.0063 ± 0.0001 | 1.76× | `_simd_cos_d2` |
| tan | `none` | 0.0102 ± 0.0002 | 1.00× (baseline) | `tan` |
| tan | `accelerate` | 0.0103 ± 0.0002 | 1.00× | `tan` |
| tan | `darwin_libsystem_m` | 0.0061 ± 0.0002 | 1.67× | `_simd_tan_d2` |
| exp | `none` | 0.0101 ± 0.0004 | 1.00× (baseline) | `exp` |
| exp | `accelerate` | 0.0101 ± 0.0003 | 1.00× | `exp` |
| exp | `darwin_libsystem_m` | 0.0061 ± 0.0001 | 1.65× | `_simd_exp_d2` |
| log | `none` | 0.0095 ± 0.0005 | 1.00× (baseline) | `log` |
| log | `accelerate` | 0.0094 ± 0.0003 | 1.01× | `log` |
| log | `darwin_libsystem_m` | 0.0093 ± 0.0003 | 1.03× | `log` |
| log1p | `none` | 0.0127 ± 0.0002 | 1.00× (baseline) | `log1p` |
| log1p | `accelerate` | 0.0130 ± 0.0005 | 0.98× | `log1p` |
| log1p | `darwin_libsystem_m` | 0.0131 ± 0.0005 | 0.97× | `log1p` |
| log2 | `none` | 0.0077 ± 0.0012 | 1.00× (baseline) | `log2` |
| log2 | `accelerate` | 0.0075 ± 0.0002 | 1.02× | `log2` |
| log2 | `darwin_libsystem_m` | 0.0074 ± 0.0001 | 1.04× | `log2` |
| expm1 | `none` | 0.0108 ± 0.0003 | 1.00× (baseline) | `expm1` |
| expm1 | `accelerate` | 0.0108 ± 0.0003 | 1.00× | `expm1` |
| expm1 | `darwin_libsystem_m` | 0.0109 ± 0.0007 | 0.98× | `expm1` |
| tanh | `none` | 0.0131 ± 0.0005 | 1.00× (baseline) | `tanh` |
| tanh | `accelerate` | 0.0129 ± 0.0002 | 1.02× | `tanh` |
| tanh | `darwin_libsystem_m` | 0.0079 ± 0.0001 | 1.65× | `_simd_tanh_d2` |
| sqrt | `none` | 0.0012 ± 0.0001 | 1.00× (baseline) | `fsqrt.2d` |
| sqrt | `accelerate` | 0.0012 ± 0.0000 | 1.00× | `fsqrt.2d` |
| sqrt | `darwin_libsystem_m` | 0.0012 ± 0.0001 | 1.02× | `fsqrt.2d` |
| power | `none` | 0.0213 ± 0.0010 | 1.00× (baseline) | `pow` |
| power | `accelerate` | 0.0212 ± 0.0007 | 1.00× | `pow` |
| power | `darwin_libsystem_m` | 0.0165 ± 0.0004 | 1.29× | `_simd_pow_d2` |
| erf | `none` | 0.0324 ± 0.0008 | 1.00× (baseline) | `erf` |
| erf | `accelerate` | 0.0329 ± 0.0010 | 0.99× | `erf` |
| erf | `darwin_libsystem_m` | 0.0324 ± 0.0012 | 1.00× | `_simd_erf_d2` |

### 262,144 elements · fastmath=False

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.0150 ± 0.0379 | 1.00× (baseline) | `sinf` |
| sin | `accelerate` | 0.1269 ± 0.0022 | 8.00× | `vsinf` |
| sin | `darwin_libsystem_m` | 0.1270 ± 0.0037 | 7.99× | `_simd_sin_f4` |
| cos | `none` | 1.1054 ± 0.0277 | 1.00× (baseline) | `cosf` |
| cos | `accelerate` | 0.1332 ± 0.0032 | 8.30× | `vcosf` |
| cos | `darwin_libsystem_m` | 0.1298 ± 0.0016 | 8.52× | `_simd_cos_f4` |
| tan | `none` | 0.7947 ± 0.0205 | 1.00× (baseline) | `tanf` |
| tan | `accelerate` | 0.1658 ± 0.0083 | 4.79× | `vtanf` |
| tan | `darwin_libsystem_m` | 0.1614 ± 0.0039 | 4.93× | `_simd_tan_f4` |
| exp | `none` | 0.3631 ± 0.0061 | 1.00× (baseline) | `expf` |
| exp | `accelerate` | 0.1500 ± 0.0047 | 2.42× | `vexpf` |
| exp | `darwin_libsystem_m` | 0.1477 ± 0.0024 | 2.46× | `_simd_exp_f4` |
| log | `none` | 0.4318 ± 0.0090 | 1.00× (baseline) | `logf` |
| log | `accelerate` | 0.2055 ± 0.0177 | 2.10× | `vlogf` |
| log | `darwin_libsystem_m` | 0.4285 ± 0.0069 | 1.01× | `logf` |
| log1p | `none` | 0.5493 ± 0.0215 | 1.00× (baseline) | `log1pf` |
| log1p | `accelerate` | 0.2339 ± 0.0092 | 2.35× | `vlog1pf` |
| log1p | `darwin_libsystem_m` | 0.5388 ± 0.0123 | 1.02× | `log1pf` |
| log2 | `none` | 0.3297 ± 0.0040 | 1.00× (baseline) | `log2f` |
| log2 | `accelerate` | 0.3336 ± 0.0068 | 0.99× | `log2f` |
| log2 | `darwin_libsystem_m` | 0.3421 ± 0.0171 | 0.96× | `log2f` |
| expm1 | `none` | 1.3400 ± 0.2017 | 1.00× (baseline) | `expm1f` |
| expm1 | `accelerate` | 0.1694 ± 0.0028 | 7.91× | `vexpm1f` |
| expm1 | `darwin_libsystem_m` | 1.2828 ± 0.1091 | 1.04× | `expm1f` |
| tanh | `none` | 1.1510 ± 0.0886 | 1.00× (baseline) | `tanhf` |
| tanh | `accelerate` | 0.1886 ± 0.0056 | 6.10× | `vtanhf` |
| tanh | `darwin_libsystem_m` | 0.1837 ± 0.0025 | 6.26× | `_simd_tanh_f4` |
| sqrt | `none` | 0.0332 ± 0.0014 | 1.00× (baseline) | `fsqrt.4s` |
| sqrt | `accelerate` | 0.0323 ± 0.0009 | 1.03× | `fsqrt.4s` |
| sqrt | `darwin_libsystem_m` | 0.0324 ± 0.0012 | 1.02× | `fsqrt.4s` |
| power | `none` | 0.6613 ± 0.0219 | 1.00× (baseline) | `powf` |
| power | `accelerate` | 0.6471 ± 0.0139 | 1.02× | `powf` |
| power | `darwin_libsystem_m` | 0.3934 ± 0.0107 | 1.68× | `_simd_pow_f4` |
| erf | `none` | 0.5687 ± 0.0101 | 1.00× (baseline) | `erff` |
| erf | `accelerate` | 0.5741 ± 0.0182 | 0.99× | `erff` |
| erf | `darwin_libsystem_m` | 0.5765 ± 0.0132 | 0.99× | `_simd_erf_f4` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.2599 ± 0.0313 | 1.00× (baseline) | `sin` |
| sin | `accelerate` | 1.2893 ± 0.0344 | 0.98× | `sin` |
| sin | `darwin_libsystem_m` | 0.3643 ± 0.0053 | 3.46× | `_simd_sin_d2` |
| cos | `none` | 1.2291 ± 0.0306 | 1.00× (baseline) | `cos` |
| cos | `accelerate` | 1.2437 ± 0.0266 | 0.99× | `cos` |
| cos | `darwin_libsystem_m` | 0.3880 ± 0.0077 | 3.17× | `_simd_cos_d2` |
| tan | `none` | 0.9199 ± 0.0188 | 1.00× (baseline) | `tan` |
| tan | `accelerate` | 0.9424 ± 0.0332 | 0.98× | `tan` |
| tan | `darwin_libsystem_m` | 0.3749 ± 0.0070 | 2.45× | `_simd_tan_d2` |
| exp | `none` | 1.2317 ± 0.0248 | 1.00× (baseline) | `exp` |
| exp | `accelerate` | 1.2318 ± 0.0322 | 1.00× | `exp` |
| exp | `darwin_libsystem_m` | 0.3773 ± 0.0041 | 3.26× | `_simd_exp_d2` |
| log | `none` | 0.6371 ± 0.0128 | 1.00× (baseline) | `log` |
| log | `accelerate` | 0.6483 ± 0.0204 | 0.98× | `log` |
| log | `darwin_libsystem_m` | 0.6475 ± 0.0202 | 0.98× | `log` |
| log1p | `none` | 0.9604 ± 0.0438 | 1.00× (baseline) | `log1p` |
| log1p | `accelerate` | 0.9587 ± 0.0204 | 1.00× | `log1p` |
| log1p | `darwin_libsystem_m` | 0.9451 ± 0.0204 | 1.02× | `log1p` |
| log2 | `none` | 0.5917 ± 0.0199 | 1.00× (baseline) | `log2` |
| log2 | `accelerate` | 0.5860 ± 0.0123 | 1.01× | `log2` |
| log2 | `darwin_libsystem_m` | 0.6137 ± 0.0359 | 0.96× | `log2` |
| expm1 | `none` | 1.1957 ± 0.0244 | 1.00× (baseline) | `expm1` |
| expm1 | `accelerate` | 1.2097 ± 0.0294 | 0.99× | `expm1` |
| expm1 | `darwin_libsystem_m` | 1.1948 ± 0.0237 | 1.00× | `expm1` |
| tanh | `none` | 0.8734 ± 0.0613 | 1.00× (baseline) | `tanh` |
| tanh | `accelerate` | 0.8360 ± 0.0178 | 1.04× | `tanh` |
| tanh | `darwin_libsystem_m` | 0.5057 ± 0.0079 | 1.73× | `_simd_tanh_d2` |
| sqrt | `none` | 0.0659 ± 0.0025 | 1.00× (baseline) | `fsqrt.2d` |
| sqrt | `accelerate` | 0.0650 ± 0.0026 | 1.01× | `fsqrt.2d` |
| sqrt | `darwin_libsystem_m` | 0.0649 ± 0.0028 | 1.01× | `fsqrt.2d` |
| power | `none` | 2.2003 ± 0.1305 | 1.00× (baseline) | `pow` |
| power | `accelerate` | 2.1644 ± 0.0722 | 1.02× | `pow` |
| power | `darwin_libsystem_m` | 1.0447 ± 0.0256 | 2.11× | `_simd_pow_d2` |
| erf | `none` | 2.1308 ± 0.0623 | 1.00× (baseline) | `erf` |
| erf | `accelerate` | 2.1643 ± 0.1101 | 0.98× | `erf` |
| erf | `darwin_libsystem_m` | 2.1086 ± 0.0454 | 1.01× | `_simd_erf_d2` |

### 262,144 elements · fastmath=True

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.0088 ± 0.0270 | 1.00× (baseline) | `sinf` |
| sin | `accelerate` | 0.1284 ± 0.0028 | 7.86× | `vsinf` |
| sin | `darwin_libsystem_m` | 0.1294 ± 0.0047 | 7.80× | `_simd_sin_f4` |
| cos | `none` | 1.1389 ± 0.0536 | 1.00× (baseline) | `cosf` |
| cos | `accelerate` | 0.1333 ± 0.0025 | 8.54× | `vcosf` |
| cos | `darwin_libsystem_m` | 0.1330 ± 0.0046 | 8.56× | `_simd_cos_f4` |
| tan | `none` | 0.7986 ± 0.0205 | 1.00× (baseline) | `tanf` |
| tan | `accelerate` | 0.1623 ± 0.0040 | 4.92× | `vtanf` |
| tan | `darwin_libsystem_m` | 0.1607 ± 0.0030 | 4.97× | `_simd_tan_f4` |
| exp | `none` | 0.3699 ± 0.0108 | 1.00× (baseline) | `expf` |
| exp | `accelerate` | 0.1536 ± 0.0054 | 2.41× | `vexpf` |
| exp | `darwin_libsystem_m` | 0.1486 ± 0.0020 | 2.49× | `_simd_exp_f4` |
| log | `none` | 0.4460 ± 0.0225 | 1.00× (baseline) | `logf` |
| log | `accelerate` | 0.2057 ± 0.0060 | 2.17× | `vlogf` |
| log | `darwin_libsystem_m` | 0.4369 ± 0.0187 | 1.02× | `logf` |
| log1p | `none` | 0.5256 ± 0.0118 | 1.00× (baseline) | `log1pf` |
| log1p | `accelerate` | 0.2367 ± 0.0106 | 2.22× | `vlog1pf` |
| log1p | `darwin_libsystem_m` | 0.5334 ± 0.0126 | 0.99× | `log1pf` |
| log2 | `none` | 0.3391 ± 0.0130 | 1.00× (baseline) | `log2f` |
| log2 | `accelerate` | 0.3378 ± 0.0075 | 1.00× | `log2f` |
| log2 | `darwin_libsystem_m` | 0.3363 ± 0.0084 | 1.01× | `log2f` |
| expm1 | `none` | 1.2500 ± 0.0348 | 1.00× (baseline) | `expm1f` |
| expm1 | `accelerate` | 0.1714 ± 0.0035 | 7.29× | `vexpm1f` |
| expm1 | `darwin_libsystem_m` | 1.2430 ± 0.0203 | 1.01× | `expm1f` |
| tanh | `none` | 1.1558 ± 0.0538 | 1.00× (baseline) | `tanhf` |
| tanh | `accelerate` | 0.1889 ± 0.0103 | 6.12× | `vtanhf` |
| tanh | `darwin_libsystem_m` | 0.1817 ± 0.0025 | 6.36× | `_simd_tanh_f4` |
| sqrt | `none` | 0.0333 ± 0.0013 | 1.00× (baseline) | `fsqrt.4s` |
| sqrt | `accelerate` | 0.0333 ± 0.0010 | 1.00× | `fsqrt.4s` |
| sqrt | `darwin_libsystem_m` | 0.0331 ± 0.0013 | 1.00× | `fsqrt.4s` |
| power | `none` | 0.6485 ± 0.0133 | 1.00× (baseline) | `powf` |
| power | `accelerate` | 0.6584 ± 0.0302 | 0.98× | `powf` |
| power | `darwin_libsystem_m` | 0.3898 ± 0.0075 | 1.66× | `_simd_pow_f4` |
| erf | `none` | 0.5702 ± 0.0217 | 1.00× (baseline) | `erff` |
| erf | `accelerate` | 0.5766 ± 0.0142 | 0.99× | `erff` |
| erf | `darwin_libsystem_m` | 0.5764 ± 0.0156 | 0.99× | `_simd_erf_f4` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.2477 ± 0.0286 | 1.00× (baseline) | `sin` |
| sin | `accelerate` | 1.2870 ± 0.0432 | 0.97× | `sin` |
| sin | `darwin_libsystem_m` | 0.3614 ± 0.0063 | 3.45× | `_simd_sin_d2` |
| cos | `none` | 1.2477 ± 0.0277 | 1.00× (baseline) | `cos` |
| cos | `accelerate` | 1.2370 ± 0.0373 | 1.01× | `cos` |
| cos | `darwin_libsystem_m` | 0.3898 ± 0.0092 | 3.20× | `_simd_cos_d2` |
| tan | `none` | 0.9194 ± 0.0176 | 1.00× (baseline) | `tan` |
| tan | `accelerate` | 0.9246 ± 0.0129 | 0.99× | `tan` |
| tan | `darwin_libsystem_m` | 0.3754 ± 0.0069 | 2.45× | `_simd_tan_d2` |
| exp | `none` | 1.2321 ± 0.0319 | 1.00× (baseline) | `exp` |
| exp | `accelerate` | 1.2770 ± 0.0544 | 0.96× | `exp` |
| exp | `darwin_libsystem_m` | 0.3807 ± 0.0046 | 3.24× | `_simd_exp_d2` |
| log | `none` | 0.6404 ± 0.0211 | 1.00× (baseline) | `log` |
| log | `accelerate` | 0.6522 ± 0.0239 | 0.98× | `log` |
| log | `darwin_libsystem_m` | 0.6486 ± 0.0192 | 0.99× | `log` |
| log1p | `none` | 0.9375 ± 0.0107 | 1.00× (baseline) | `log1p` |
| log1p | `accelerate` | 0.9591 ± 0.0223 | 0.98× | `log1p` |
| log1p | `darwin_libsystem_m` | 0.9631 ± 0.0269 | 0.97× | `log1p` |
| log2 | `none` | 0.5865 ± 0.0106 | 1.00× (baseline) | `log2` |
| log2 | `accelerate` | 0.5852 ± 0.0109 | 1.00× | `log2` |
| log2 | `darwin_libsystem_m` | 0.5830 ± 0.0185 | 1.01× | `log2` |
| expm1 | `none` | 1.1999 ± 0.0307 | 1.00× (baseline) | `expm1` |
| expm1 | `accelerate` | 1.2084 ± 0.0387 | 0.99× | `expm1` |
| expm1 | `darwin_libsystem_m` | 1.2115 ± 0.0216 | 0.99× | `expm1` |
| tanh | `none` | 0.8427 ± 0.0192 | 1.00× (baseline) | `tanh` |
| tanh | `accelerate` | 0.8386 ± 0.0259 | 1.00× | `tanh` |
| tanh | `darwin_libsystem_m` | 0.5026 ± 0.0097 | 1.68× | `_simd_tanh_d2` |
| sqrt | `none` | 0.0667 ± 0.0024 | 1.00× (baseline) | `fsqrt.2d` |
| sqrt | `accelerate` | 0.0653 ± 0.0015 | 1.02× | `fsqrt.2d` |
| sqrt | `darwin_libsystem_m` | 0.0661 ± 0.0027 | 1.01× | `fsqrt.2d` |
| power | `none` | 2.1378 ± 0.1016 | 1.00× (baseline) | `pow` |
| power | `accelerate` | 2.1696 ± 0.0633 | 0.99× | `pow` |
| power | `darwin_libsystem_m` | 1.0467 ± 0.0320 | 2.04× | `_simd_pow_d2` |
| erf | `none` | 2.1167 ± 0.0493 | 1.00× (baseline) | `erf` |
| erf | `accelerate` | 2.1313 ± 0.0637 | 0.99× | `erf` |
| erf | `darwin_libsystem_m` | 2.1323 ± 0.0637 | 0.99× | `_simd_erf_d2` |

## linux: raptorlake

Linux-6.8.0-139-generic-x86_64-with-glibc2.39; LLVM 22.1.0, Python 3.12.3, NumPy 2.4.2.

### 4,096 elements · fastmath=False

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0114 ± 0.0005 | 1.00× (baseline) | `sinf` |
| sin | `libmvec` | 0.0014 ± 0.0000 | 8.21× | `_ZGVbN4v_sinf`, `_ZGVdN8v_sinf` |
| cos | `none` | 0.0107 ± 0.0003 | 1.00× (baseline) | `cosf` |
| cos | `libmvec` | 0.0014 ± 0.0000 | 7.53× | `_ZGVbN4v_cosf`, `_ZGVdN8v_cosf` |
| tan | `none` | 0.0193 ± 0.0001 | 1.00× (baseline) | `tanf` |
| tan | `libmvec` | 0.0015 ± 0.0000 | 12.66× | `_ZGVbN4v_tanf`, `_ZGVdN8v_tanf` |
| exp | `none` | 0.0088 ± 0.0002 | 1.00× (baseline) | `expf` |
| exp | `libmvec` | 0.0013 ± 0.0000 | 6.60× | `_ZGVbN4v_expf`, `_ZGVdN8v_expf` |
| log | `none` | 0.0088 ± 0.0002 | 1.00× (baseline) | `logf` |
| log | `libmvec` | 0.0014 ± 0.0000 | 6.17× | `_ZGVbN4v_logf`, `_ZGVdN8v_logf` |
| log1p | `none` | 0.0221 ± 0.0005 | 1.00× (baseline) | `log1pf` |
| log1p | `libmvec` | 0.0207 ± 0.0007 | 1.07× | `log1pf` |
| log2 | `none` | 0.0060 ± 0.0000 | 1.00× (baseline) | `log2f` |
| log2 | `libmvec` | 0.0060 ± 0.0000 | 1.00× | `log2f` |
| expm1 | `none` | 0.0244 ± 0.0009 | 1.00× (baseline) | `expm1f` |
| expm1 | `libmvec` | 0.0249 ± 0.0007 | 0.98× | `expm1f` |
| tanh | `none` | 0.0348 ± 0.0009 | 1.00× (baseline) | `tanhf` |
| tanh | `libmvec` | 0.0345 ± 0.0012 | 1.01× | `tanhf` |
| sqrt | `none` | 0.0007 ± 0.0000 | 1.00× (baseline) | `vsqrtps` |
| sqrt | `libmvec` | 0.0007 ± 0.0000 | 1.00× | `vsqrtps` |
| power | `none` | 0.0136 ± 0.0000 | 1.00× (baseline) | `powf` |
| power | `libmvec` | 0.0062 ± 0.0001 | 2.18× | `_ZGVbN4vv_powf`, `_ZGVdN8vv_powf` |
| erf | `none` | 0.0249 ± 0.0004 | 1.00× (baseline) | `erff` |
| erf | `libmvec` | 0.0250 ± 0.0004 | 1.00× | `erff` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0170 ± 0.0004 | 1.00× (baseline) | `sin` |
| sin | `libmvec` | 0.0030 ± 0.0001 | 5.62× | `_ZGVdN4v_sin` |
| cos | `none` | 0.0149 ± 0.0006 | 1.00× (baseline) | `cos` |
| cos | `libmvec` | 0.0031 ± 0.0000 | 4.78× | `_ZGVdN4v_cos` |
| tan | `none` | 0.0152 ± 0.0003 | 1.00× (baseline) | `tan` |
| tan | `libmvec` | 0.0031 ± 0.0000 | 4.82× | `_ZGVdN4v_tan` |
| exp | `none` | 0.0141 ± 0.0001 | 1.00× (baseline) | `exp` |
| exp | `libmvec` | 0.0027 ± 0.0001 | 5.18× | `_ZGVdN4v_exp` |
| log | `none` | 0.0137 ± 0.0000 | 1.00× (baseline) | `log` |
| log | `libmvec` | 0.0037 ± 0.0001 | 3.73× | `_ZGVdN4v_log` |
| log1p | `none` | 0.0263 ± 0.0006 | 1.00× (baseline) | `log1p` |
| log1p | `libmvec` | 0.0249 ± 0.0009 | 1.05× | `log1p` |
| log2 | `none` | 0.0093 ± 0.0000 | 1.00× (baseline) | `log2` |
| log2 | `libmvec` | 0.0093 ± 0.0000 | 1.00× | `log2` |
| expm1 | `none` | 0.0234 ± 0.0008 | 1.00× (baseline) | `expm1` |
| expm1 | `libmvec` | 0.0234 ± 0.0008 | 1.00× | `expm1` |
| tanh | `none` | 0.0399 ± 0.0002 | 1.00× (baseline) | `tanh` |
| tanh | `libmvec` | 0.0398 ± 0.0005 | 1.00× | `tanh` |
| sqrt | `none` | 0.0025 ± 0.0000 | 1.00× (baseline) | `vsqrtpd` |
| sqrt | `libmvec` | 0.0025 ± 0.0000 | 1.00× | `vsqrtpd` |
| power | `none` | 0.0304 ± 0.0000 | 1.00× (baseline) | `pow` |
| power | `libmvec` | 0.0117 ± 0.0001 | 2.60× | `_ZGVdN4vv_pow` |
| erf | `none` | 0.0248 ± 0.0007 | 1.00× (baseline) | `erf` |
| erf | `libmvec` | 0.0255 ± 0.0008 | 0.97× | `erf` |

### 4,096 elements · fastmath=True

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0111 ± 0.0004 | 1.00× (baseline) | `sinf` |
| sin | `libmvec` | 0.0014 ± 0.0000 | 8.03× | `_ZGVbN4v_sinf`, `_ZGVdN8v_sinf` |
| cos | `none` | 0.0109 ± 0.0002 | 1.00× (baseline) | `cosf` |
| cos | `libmvec` | 0.0014 ± 0.0000 | 7.83× | `_ZGVbN4v_cosf`, `_ZGVdN8v_cosf` |
| tan | `none` | 0.0195 ± 0.0002 | 1.00× (baseline) | `tanf` |
| tan | `libmvec` | 0.0015 ± 0.0000 | 12.76× | `_ZGVbN4v_tanf`, `_ZGVdN8v_tanf` |
| exp | `none` | 0.0088 ± 0.0001 | 1.00× (baseline) | `expf` |
| exp | `libmvec` | 0.0013 ± 0.0000 | 6.55× | `_ZGVbN4v_expf`, `_ZGVdN8v_expf` |
| log | `none` | 0.0088 ± 0.0002 | 1.00× (baseline) | `logf` |
| log | `libmvec` | 0.0014 ± 0.0000 | 6.27× | `_ZGVbN4v_logf`, `_ZGVdN8v_logf` |
| log1p | `none` | 0.0221 ± 0.0005 | 1.00× (baseline) | `log1pf` |
| log1p | `libmvec` | 0.0227 ± 0.0004 | 0.97× | `log1pf` |
| log2 | `none` | 0.0060 ± 0.0000 | 1.00× (baseline) | `log2f` |
| log2 | `libmvec` | 0.0060 ± 0.0000 | 1.00× | `log2f` |
| expm1 | `none` | 0.0242 ± 0.0007 | 1.00× (baseline) | `expm1f` |
| expm1 | `libmvec` | 0.0242 ± 0.0008 | 1.00× | `expm1f` |
| tanh | `none` | 0.0349 ± 0.0005 | 1.00× (baseline) | `tanhf` |
| tanh | `libmvec` | 0.0352 ± 0.0008 | 0.99× | `tanhf` |
| sqrt | `none` | 0.0007 ± 0.0000 | 1.00× (baseline) | `vsqrtps` |
| sqrt | `libmvec` | 0.0007 ± 0.0000 | 1.00× | `vsqrtps` |
| power | `none` | 0.0136 ± 0.0000 | 1.00× (baseline) | `powf` |
| power | `libmvec` | 0.0062 ± 0.0001 | 2.19× | `_ZGVbN4vv_powf`, `_ZGVdN8vv_powf` |
| erf | `none` | 0.0245 ± 0.0007 | 1.00× (baseline) | `erff` |
| erf | `libmvec` | 0.0250 ± 0.0004 | 0.98× | `erff` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 0.0169 ± 0.0004 | 1.00× (baseline) | `sin` |
| sin | `libmvec` | 0.0030 ± 0.0000 | 5.67× | `_ZGVdN4v_sin` |
| cos | `none` | 0.0150 ± 0.0006 | 1.00× (baseline) | `cos` |
| cos | `libmvec` | 0.0031 ± 0.0001 | 4.78× | `_ZGVdN4v_cos` |
| tan | `none` | 0.0150 ± 0.0002 | 1.00× (baseline) | `tan` |
| tan | `libmvec` | 0.0031 ± 0.0000 | 4.84× | `_ZGVdN4v_tan` |
| exp | `none` | 0.0140 ± 0.0001 | 1.00× (baseline) | `exp` |
| exp | `libmvec` | 0.0027 ± 0.0001 | 5.11× | `_ZGVdN4v_exp` |
| log | `none` | 0.0138 ± 0.0000 | 1.00× (baseline) | `log` |
| log | `libmvec` | 0.0037 ± 0.0000 | 3.74× | `_ZGVdN4v_log` |
| log1p | `none` | 0.0255 ± 0.0010 | 1.00× (baseline) | `log1p` |
| log1p | `libmvec` | 0.0257 ± 0.0006 | 0.99× | `log1p` |
| log2 | `none` | 0.0093 ± 0.0000 | 1.00× (baseline) | `log2` |
| log2 | `libmvec` | 0.0093 ± 0.0000 | 1.00× | `log2` |
| expm1 | `none` | 0.0232 ± 0.0006 | 1.00× (baseline) | `expm1` |
| expm1 | `libmvec` | 0.0239 ± 0.0003 | 0.97× | `expm1` |
| tanh | `none` | 0.0396 ± 0.0005 | 1.00× (baseline) | `tanh` |
| tanh | `libmvec` | 0.0400 ± 0.0002 | 0.99× | `tanh` |
| sqrt | `none` | 0.0025 ± 0.0000 | 1.00× (baseline) | `vsqrtpd` |
| sqrt | `libmvec` | 0.0025 ± 0.0000 | 1.00× | `vsqrtpd` |
| power | `none` | 0.0306 ± 0.0001 | 1.00× (baseline) | `pow` |
| power | `libmvec` | 0.0117 ± 0.0001 | 2.61× | `_ZGVdN4vv_pow` |
| erf | `none` | 0.0244 ± 0.0003 | 1.00× (baseline) | `erf` |
| erf | `libmvec` | 0.0249 ± 0.0008 | 0.98× | `erf` |

### 262,144 elements · fastmath=False

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.1057 ± 0.0070 | 1.00× (baseline) | `sinf` |
| sin | `libmvec` | 0.0786 ± 0.0034 | 14.07× | `_ZGVbN4v_sinf`, `_ZGVdN8v_sinf` |
| cos | `none` | 1.1086 ± 0.0071 | 1.00× (baseline) | `cosf` |
| cos | `libmvec` | 0.0815 ± 0.0010 | 13.61× | `_ZGVbN4v_cosf`, `_ZGVdN8v_cosf` |
| tan | `none` | 1.8745 ± 0.0081 | 1.00× (baseline) | `tanf` |
| tan | `libmvec` | 0.0884 ± 0.0030 | 21.20× | `_ZGVbN4v_tanf`, `_ZGVdN8v_tanf` |
| exp | `none` | 0.5587 ± 0.0083 | 1.00× (baseline) | `expf` |
| exp | `libmvec` | 0.0762 ± 0.0014 | 7.33× | `_ZGVbN4v_expf`, `_ZGVdN8v_expf` |
| log | `none` | 0.5599 ± 0.0054 | 1.00× (baseline) | `logf` |
| log | `libmvec` | 0.0806 ± 0.0011 | 6.95× | `_ZGVbN4v_logf`, `_ZGVdN8v_logf` |
| log1p | `none` | 2.0800 ± 0.0318 | 1.00× (baseline) | `log1pf` |
| log1p | `libmvec` | 2.0663 ± 0.0158 | 1.01× | `log1pf` |
| log2 | `none` | 0.3814 ± 0.0087 | 1.00× (baseline) | `log2f` |
| log2 | `libmvec` | 0.3798 ± 0.0096 | 1.00× | `log2f` |
| expm1 | `none` | 2.2276 ± 0.0092 | 1.00× (baseline) | `expm1f` |
| expm1 | `libmvec` | 2.2256 ± 0.0093 | 1.00× | `expm1f` |
| tanh | `none` | 3.1824 ± 0.0187 | 1.00× (baseline) | `tanhf` |
| tanh | `libmvec` | 3.2165 ± 0.0362 | 0.99× | `tanhf` |
| sqrt | `none` | 0.0375 ± 0.0000 | 1.00× (baseline) | `vsqrtps` |
| sqrt | `libmvec` | 0.0375 ± 0.0000 | 1.00× | `vsqrtps` |
| power | `none` | 0.8623 ± 0.0019 | 1.00× (baseline) | `powf` |
| power | `libmvec` | 0.3864 ± 0.0040 | 2.23× | `_ZGVbN4vv_powf`, `_ZGVdN8vv_powf` |
| erf | `none` | 2.3362 ± 0.0159 | 1.00× (baseline) | `erff` |
| erf | `libmvec` | 2.3240 ± 0.0094 | 1.01× | `erff` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.6516 ± 0.0153 | 1.00× (baseline) | `sin` |
| sin | `libmvec` | 0.1803 ± 0.0039 | 9.16× | `_ZGVdN4v_sin` |
| cos | `none` | 1.9893 ± 0.0115 | 1.00× (baseline) | `cos` |
| cos | `libmvec` | 0.1873 ± 0.0042 | 10.62× | `_ZGVdN4v_cos` |
| tan | `none` | 1.6234 ± 0.0129 | 1.00× (baseline) | `tan` |
| tan | `libmvec` | 0.1869 ± 0.0046 | 8.69× | `_ZGVdN4v_tan` |
| exp | `none` | 0.9190 ± 0.0292 | 1.00× (baseline) | `exp` |
| exp | `libmvec` | 0.1623 ± 0.0036 | 5.66× | `_ZGVdN4v_exp` |
| log | `none` | 0.8532 ± 0.0135 | 1.00× (baseline) | `log` |
| log | `libmvec` | 0.2236 ± 0.0017 | 3.82× | `_ZGVdN4v_log` |
| log1p | `none` | 2.2937 ± 0.0162 | 1.00× (baseline) | `log1p` |
| log1p | `libmvec` | 2.2838 ± 0.0042 | 1.00× | `log1p` |
| log2 | `none` | 0.5853 ± 0.0003 | 1.00× (baseline) | `log2` |
| log2 | `libmvec` | 0.5852 ± 0.0002 | 1.00× | `log2` |
| expm1 | `none` | 2.2162 ± 0.0075 | 1.00× (baseline) | `expm1` |
| expm1 | `libmvec` | 2.2212 ± 0.0104 | 1.00× | `expm1` |
| tanh | `none` | 3.2272 ± 0.0116 | 1.00× (baseline) | `tanh` |
| tanh | `libmvec` | 3.2278 ± 0.0099 | 1.00× | `tanh` |
| sqrt | `none` | 0.1493 ± 0.0000 | 1.00× (baseline) | `vsqrtpd` |
| sqrt | `libmvec` | 0.1497 ± 0.0005 | 1.00× | `vsqrtpd` |
| power | `none` | 1.9485 ± 0.0163 | 1.00× (baseline) | `pow` |
| power | `libmvec` | 0.7397 ± 0.0058 | 2.63× | `_ZGVdN4vv_pow` |
| erf | `none` | 2.4558 ± 0.0165 | 1.00× (baseline) | `erf` |
| erf | `libmvec` | 2.4622 ± 0.0175 | 1.00× | `erf` |

### 262,144 elements · fastmath=True

#### float32

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.1051 ± 0.0104 | 1.00× (baseline) | `sinf` |
| sin | `libmvec` | 0.0782 ± 0.0022 | 14.12× | `_ZGVbN4v_sinf`, `_ZGVdN8v_sinf` |
| cos | `none` | 1.1017 ± 0.0094 | 1.00× (baseline) | `cosf` |
| cos | `libmvec` | 0.0814 ± 0.0024 | 13.53× | `_ZGVbN4v_cosf`, `_ZGVdN8v_cosf` |
| tan | `none` | 1.8879 ± 0.0089 | 1.00× (baseline) | `tanf` |
| tan | `libmvec` | 0.0869 ± 0.0020 | 21.73× | `_ZGVbN4v_tanf`, `_ZGVdN8v_tanf` |
| exp | `none` | 0.5616 ± 0.0031 | 1.00× (baseline) | `expf` |
| exp | `libmvec` | 0.0767 ± 0.0012 | 7.32× | `_ZGVbN4v_expf`, `_ZGVdN8v_expf` |
| log | `none` | 0.5614 ± 0.0028 | 1.00× (baseline) | `logf` |
| log | `libmvec` | 0.0804 ± 0.0011 | 6.98× | `_ZGVbN4v_logf`, `_ZGVdN8v_logf` |
| log1p | `none` | 2.0915 ± 0.0230 | 1.00× (baseline) | `log1pf` |
| log1p | `libmvec` | 2.0608 ± 0.0110 | 1.01× | `log1pf` |
| log2 | `none` | 0.3730 ± 0.0002 | 1.00× (baseline) | `log2f` |
| log2 | `libmvec` | 0.3731 ± 0.0003 | 1.00× | `log2f` |
| expm1 | `none` | 2.2208 ± 0.0072 | 1.00× (baseline) | `expm1f` |
| expm1 | `libmvec` | 2.2354 ± 0.0122 | 0.99× | `expm1f` |
| tanh | `none` | 3.1847 ± 0.0278 | 1.00× (baseline) | `tanhf` |
| tanh | `libmvec` | 3.1867 ± 0.0416 | 1.00× | `tanhf` |
| sqrt | `none` | 0.0375 ± 0.0000 | 1.00× (baseline) | `vsqrtps` |
| sqrt | `libmvec` | 0.0375 ± 0.0000 | 1.00× | `vsqrtps` |
| power | `none` | 0.8594 ± 0.0020 | 1.00× (baseline) | `powf` |
| power | `libmvec` | 0.3877 ± 0.0032 | 2.22× | `_ZGVbN4vv_powf`, `_ZGVdN8vv_powf` |
| erf | `none` | 2.3319 ± 0.0123 | 1.00× (baseline) | `erff` |
| erf | `libmvec` | 2.3421 ± 0.0240 | 1.00× | `erff` |

#### float64

| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction |
|---|---|---:|---:|---|
| sin | `none` | 1.6495 ± 0.0084 | 1.00× (baseline) | `sin` |
| sin | `libmvec` | 0.1804 ± 0.0040 | 9.14× | `_ZGVdN4v_sin` |
| cos | `none` | 1.9755 ± 0.0130 | 1.00× (baseline) | `cos` |
| cos | `libmvec` | 0.1877 ± 0.0037 | 10.53× | `_ZGVdN4v_cos` |
| tan | `none` | 1.6179 ± 0.0094 | 1.00× (baseline) | `tan` |
| tan | `libmvec` | 0.1890 ± 0.0051 | 8.56× | `_ZGVdN4v_tan` |
| exp | `none` | 0.9272 ± 0.0284 | 1.00× (baseline) | `exp` |
| exp | `libmvec` | 0.1637 ± 0.0038 | 5.67× | `_ZGVdN4v_exp` |
| log | `none` | 0.8527 ± 0.0115 | 1.00× (baseline) | `log` |
| log | `libmvec` | 0.2231 ± 0.0014 | 3.82× | `_ZGVdN4v_log` |
| log1p | `none` | 2.2814 ± 0.0210 | 1.00× (baseline) | `log1p` |
| log1p | `libmvec` | 2.2801 ± 0.0092 | 1.00× | `log1p` |
| log2 | `none` | 0.5854 ± 0.0005 | 1.00× (baseline) | `log2` |
| log2 | `libmvec` | 0.5853 ± 0.0003 | 1.00× | `log2` |
| expm1 | `none` | 2.2214 ± 0.0092 | 1.00× (baseline) | `expm1` |
| expm1 | `libmvec` | 2.2209 ± 0.0125 | 1.00× | `expm1` |
| tanh | `none` | 3.2307 ± 0.0127 | 1.00× (baseline) | `tanh` |
| tanh | `libmvec` | 3.2282 ± 0.0100 | 1.00× | `tanh` |
| sqrt | `none` | 0.1493 ± 0.0001 | 1.00× (baseline) | `vsqrtpd` |
| sqrt | `libmvec` | 0.1497 ± 0.0005 | 1.00× | `vsqrtpd` |
| power | `none` | 1.9374 ± 0.0012 | 1.00× (baseline) | `pow` |
| power | `libmvec` | 0.7394 ± 0.0056 | 2.62× | `_ZGVdN4vv_pow` |
| erf | `none` | 2.4606 ± 0.0155 | 1.00× (baseline) | `erf` |
| erf | `libmvec` | 2.4512 ± 0.0124 | 1.00× | `erf` |

## Reading the results

- `none` is ordinary Numba compilation, including hardware vector instructions. It does not mean scalar execution.
- Small timing differences with the same emitted implementation should not be attributed to the selected library.
- Inputs are ordinary finite values. Every case passed its numerical comparison before timing; this does not characterize exceptional values or guarantee accuracy for other inputs.
- Compilation, loading, allocation and reference calculations are outside timing. Linux is pinned to one CPU; macOS uses normal OS scheduling. Compare libraries within each machine, not the two CPUs against each other.

Validated 480 configurations × 3 process rounds × 7 samples. No missing, duplicate or failed cases.

## Runtime symbol ownership

`dladdr` identifies the image containing the address returned by `llvm.address_of_symbol`. A Numba wrapper may itself call the system math library; the table identifies the immediate entry point, not its callees.

| Machine | Emitted symbol | Resolved symbol | Library image |
|---|---|---|---|
| linux | `_ZGVbN4v_cosf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVbN4v_expf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVbN4v_logf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVbN4v_sinf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVbN4v_tanf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVbN4vv_powf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4v_cos` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4v_exp` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4v_log` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4v_sin` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4v_tan` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN4vv_pow` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8v_cosf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8v_expf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8v_logf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8v_sinf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8v_tanf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `_ZGVdN8vv_powf` | `name unavailable` | `/lib/x86_64-linux-gnu/libmvec.so.1` |
| linux | `cos` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `cosf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `erf` | `erf` | `/home/USER/venvs/t1/bin/python` |
| linux | `erff` | `erff32` | `/lib/x86_64-linux-gnu/libm.so.6` |
| linux | `exp` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `expf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `expm1` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `expm1f` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `log` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `log1p` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `log1pf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `log2` | `name unavailable` | `/lib/x86_64-linux-gnu/libm.so.6` |
| linux | `log2f` | `name unavailable` | `/lib/x86_64-linux-gnu/libm.so.6` |
| linux | `logf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `pow` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `powf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `sin` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `sinf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `tan` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `tanf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `tanh` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| linux | `tanhf` | `name unavailable` | `/home/USER/tmp/veclib-meeting-20260930/numba/numba/_helperlib.cpython-312-x86_64-linux-gnu.so` |
| macos | `_simd_cos_d2` | `__cos_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_cos_f4` | `__cos_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_erf_d2` | `_simd_erf_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_erf_f4` | `_simd_erf_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_exp_d2` | `_simd_exp_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_exp_f4` | `_simd_exp_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_pow_d2` | `_simd_pow_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_pow_f4` | `_simd_pow_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_sin_d2` | `__sin_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_sin_f4` | `__sin_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_tan_d2` | `_simd_tan_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_tan_f4` | `_simd_tan_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_tanh_d2` | `_simd_tanh_d2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `_simd_tanh_f4` | `_simd_tanh_f4` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `cos` | `numba_cos` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `cosf` | `numba_cosf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `erf` | `erf` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `erff` | `erff` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `exp` | `numba_exp` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `expf` | `numba_expf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `expm1` | `numba_expm1` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `expm1f` | `numba_expm1f` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `log` | `numba_log` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `log1p` | `numba_log1p` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `log1pf` | `numba_log1pf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `log2` | `log2` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `log2f` | `log2f` | `/usr/lib/system/libsystem_m.dylib` |
| macos | `logf` | `numba_logf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `pow` | `numba_pow` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `powf` | `numba_powf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `sin` | `numba_sin` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `sinf` | `numba_sinf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `tan` | `numba_tan` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `tanf` | `numba_tanf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `tanh` | `numba_tanh` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `tanhf` | `numba_tanhf` | `/Users/USER/dev/numba/numba/_helperlib.cpython-313-darwin.so` |
| macos | `vcosf` | `vcosf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vexpf` | `vexpf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vexpm1f` | `vexpm1f` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vlog1pf` | `vlog1pf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vlogf` | `vlogf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vsinf` | `vsinf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vtanf` | `vtanf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
| macos | `vtanhf` | `vtanhf` | `/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib` |
