# Vector math benchmark results

262,144 elements · fastmath=False · 21 samples per row. Speedup = mean time with `none` ÷ mean time with selection. [ULP differences](PRECISION.md) compare outputs with `none` on identical inputs.

## macos: apple-m4

macOS-26.6.2-arm64-arm-64bit-Mach-O; LLVM 22.1.0, Python 3.13.15, NumPy 2.5.2.

### float32

| Operation | Selection | Time ± std (ms) | Speedup | Max ULP | Emitted math symbol / instruction | Different from none? |
|---|---|---:|---:|---:|---|---|
| sin | `none` | 1.0150 ± 0.0379 | 1.00× (baseline) | 0 | `sinf` | false |
| sin | `accelerate` | 0.1269 ± 0.0022 | 8.00× | 2 | `vsinf` | true |
| sin | `darwin_libsystem_m` | 0.1270 ± 0.0037 | 7.99× | 2 | `_simd_sin_f4` | true |
| cos | `none` | 1.1054 ± 0.0277 | 1.00× (baseline) | 0 | `cosf` | false |
| cos | `accelerate` | 0.1332 ± 0.0032 | 8.30× | 2 | `vcosf` | true |
| cos | `darwin_libsystem_m` | 0.1298 ± 0.0016 | 8.52× | 2 | `_simd_cos_f4` | true |
| tan | `none` | 0.7947 ± 0.0205 | 1.00× (baseline) | 0 | `tanf` | false |
| tan | `accelerate` | 0.1658 ± 0.0083 | 4.79× | 2 | `vtanf` | true |
| tan | `darwin_libsystem_m` | 0.1614 ± 0.0039 | 4.93× | 2 | `_simd_tan_f4` | true |
| exp | `none` | 0.3631 ± 0.0061 | 1.00× (baseline) | 0 | `expf` | false |
| exp | `accelerate` | 0.1500 ± 0.0047 | 2.42× | 2 | `vexpf` | true |
| exp | `darwin_libsystem_m` | 0.1477 ± 0.0024 | 2.46× | 2 | `_simd_exp_f4` | true |
| log | `none` | 0.4318 ± 0.0090 | 1.00× (baseline) | 0 | `logf` | false |
| log | `accelerate` | 0.2055 ± 0.0177 | 2.10× | 1 | `vlogf` | true |
| log | `darwin_libsystem_m` | 0.4285 ± 0.0069 | 1.01× | 0 | `logf` | false |
| log1p | `none` | 0.5493 ± 0.0215 | 1.00× (baseline) | 0 | `log1pf` | false |
| log1p | `accelerate` | 0.2339 ± 0.0092 | 2.35× | 2 | `vlog1pf` | true |
| log1p | `darwin_libsystem_m` | 0.5388 ± 0.0123 | 1.02× | 0 | `log1pf` | false |
| log2 | `none` | 0.3297 ± 0.0040 | 1.00× (baseline) | 0 | `log2f` | false |
| log2 | `accelerate` | 0.3336 ± 0.0068 | 0.99× | 0 | `log2f` | false |
| log2 | `darwin_libsystem_m` | 0.3421 ± 0.0171 | 0.96× | 0 | `log2f` | false |
| expm1 | `none` | 1.3400 ± 0.2017 | 1.00× (baseline) | 0 | `expm1f` | false |
| expm1 | `accelerate` | 0.1694 ± 0.0028 | 7.91× | 3 | `vexpm1f` | true |
| expm1 | `darwin_libsystem_m` | 1.2828 ± 0.1091 | 1.04× | 0 | `expm1f` | false |
| tanh | `none` | 1.1510 ± 0.0886 | 1.00× (baseline) | 0 | `tanhf` | false |
| tanh | `accelerate` | 0.1886 ± 0.0056 | 6.10× | 3 | `vtanhf` | true |
| tanh | `darwin_libsystem_m` | 0.1837 ± 0.0025 | 6.26× | 3 | `_simd_tanh_f4` | true |
| sqrt | `none` | 0.0332 ± 0.0014 | 1.00× (baseline) | 0 | `fsqrt.4s` | false |
| sqrt | `accelerate` | 0.0323 ± 0.0009 | 1.03× | 0 | `fsqrt.4s` | false |
| sqrt | `darwin_libsystem_m` | 0.0324 ± 0.0012 | 1.02× | 0 | `fsqrt.4s` | false |
| power | `none` | 0.6613 ± 0.0219 | 1.00× (baseline) | 0 | `powf` | false |
| power | `accelerate` | 0.6471 ± 0.0139 | 1.02× | 0 | `powf` | false |
| power | `darwin_libsystem_m` | 0.3934 ± 0.0107 | 1.68× | 1 | `_simd_pow_f4` | true |
| erf | `none` | 0.5687 ± 0.0101 | 1.00× (baseline) | 0 | `erff` | false |
| erf | `accelerate` | 0.5741 ± 0.0182 | 0.99× | 0 | `erff` | false |
| erf | `darwin_libsystem_m` | 0.5765 ± 0.0132 | 0.99× | 0 | `_simd_erf_f4` | true |

### float64

| Operation | Selection | Time ± std (ms) | Speedup | Max ULP | Emitted math symbol / instruction | Different from none? |
|---|---|---:|---:|---:|---|---|
| sin | `none` | 1.2599 ± 0.0313 | 1.00× (baseline) | 0 | `sin` | false |
| sin | `accelerate` | 1.2893 ± 0.0344 | 0.98× | 0 | `sin` | false |
| sin | `darwin_libsystem_m` | 0.3643 ± 0.0053 | 3.46× | 3 | `_simd_sin_d2` | true |
| cos | `none` | 1.2291 ± 0.0306 | 1.00× (baseline) | 0 | `cos` | false |
| cos | `accelerate` | 1.2437 ± 0.0266 | 0.99× | 0 | `cos` | false |
| cos | `darwin_libsystem_m` | 0.3880 ± 0.0077 | 3.17× | 3 | `_simd_cos_d2` | true |
| tan | `none` | 0.9199 ± 0.0188 | 1.00× (baseline) | 0 | `tan` | false |
| tan | `accelerate` | 0.9424 ± 0.0332 | 0.98× | 0 | `tan` | false |
| tan | `darwin_libsystem_m` | 0.3749 ± 0.0070 | 2.45× | 3 | `_simd_tan_d2` | true |
| exp | `none` | 1.2317 ± 0.0248 | 1.00× (baseline) | 0 | `exp` | false |
| exp | `accelerate` | 1.2318 ± 0.0322 | 1.00× | 0 | `exp` | false |
| exp | `darwin_libsystem_m` | 0.3773 ± 0.0041 | 3.26× | 1 | `_simd_exp_d2` | true |
| log | `none` | 0.6371 ± 0.0128 | 1.00× (baseline) | 0 | `log` | false |
| log | `accelerate` | 0.6483 ± 0.0204 | 0.98× | 0 | `log` | false |
| log | `darwin_libsystem_m` | 0.6475 ± 0.0202 | 0.98× | 0 | `log` | false |
| log1p | `none` | 0.9604 ± 0.0438 | 1.00× (baseline) | 0 | `log1p` | false |
| log1p | `accelerate` | 0.9587 ± 0.0204 | 1.00× | 0 | `log1p` | false |
| log1p | `darwin_libsystem_m` | 0.9451 ± 0.0204 | 1.02× | 0 | `log1p` | false |
| log2 | `none` | 0.5917 ± 0.0199 | 1.00× (baseline) | 0 | `log2` | false |
| log2 | `accelerate` | 0.5860 ± 0.0123 | 1.01× | 0 | `log2` | false |
| log2 | `darwin_libsystem_m` | 0.6137 ± 0.0359 | 0.96× | 0 | `log2` | false |
| expm1 | `none` | 1.1957 ± 0.0244 | 1.00× (baseline) | 0 | `expm1` | false |
| expm1 | `accelerate` | 1.2097 ± 0.0294 | 0.99× | 0 | `expm1` | false |
| expm1 | `darwin_libsystem_m` | 1.1948 ± 0.0237 | 1.00× | 0 | `expm1` | false |
| tanh | `none` | 0.8734 ± 0.0613 | 1.00× (baseline) | 0 | `tanh` | false |
| tanh | `accelerate` | 0.8360 ± 0.0178 | 1.04× | 0 | `tanh` | false |
| tanh | `darwin_libsystem_m` | 0.5057 ± 0.0079 | 1.73× | 3 | `_simd_tanh_d2` | true |
| sqrt | `none` | 0.0659 ± 0.0025 | 1.00× (baseline) | 0 | `fsqrt.2d` | false |
| sqrt | `accelerate` | 0.0650 ± 0.0026 | 1.01× | 0 | `fsqrt.2d` | false |
| sqrt | `darwin_libsystem_m` | 0.0649 ± 0.0028 | 1.01× | 0 | `fsqrt.2d` | false |
| power | `none` | 2.2003 ± 0.1305 | 1.00× (baseline) | 0 | `pow` | false |
| power | `accelerate` | 2.1644 ± 0.0722 | 1.02× | 0 | `pow` | false |
| power | `darwin_libsystem_m` | 1.0447 ± 0.0256 | 2.11× | 1 | `_simd_pow_d2` | true |
| erf | `none` | 2.1308 ± 0.0623 | 1.00× (baseline) | 0 | `erf` | false |
| erf | `accelerate` | 2.1643 ± 0.1101 | 0.98× | 0 | `erf` | false |
| erf | `darwin_libsystem_m` | 2.1086 ± 0.0454 | 1.01× | 0 | `_simd_erf_d2` | true |

## linux: raptorlake

Linux-6.8.0-139-generic-x86_64-with-glibc2.39; LLVM 22.1.0, Python 3.12.3, NumPy 2.4.2.

### float32

| Operation | Selection | Time ± std (ms) | Speedup | Max ULP | Emitted math symbol / instruction | Different from none? |
|---|---|---:|---:|---:|---|---|
| sin | `none` | 1.1057 ± 0.0070 | 1.00× (baseline) | 0 | `sinf` | false |
| sin | `libmvec` | 0.0786 ± 0.0034 | 14.07× | 2 | `_ZGVbN4v_sinf`, `_ZGVdN8v_sinf` | true |
| cos | `none` | 1.1086 ± 0.0071 | 1.00× (baseline) | 0 | `cosf` | false |
| cos | `libmvec` | 0.0815 ± 0.0010 | 13.61× | 2 | `_ZGVbN4v_cosf`, `_ZGVdN8v_cosf` | true |
| tan | `none` | 1.8745 ± 0.0081 | 1.00× (baseline) | 0 | `tanf` | false |
| tan | `libmvec` | 0.0884 ± 0.0030 | 21.20× | 3 | `_ZGVbN4v_tanf`, `_ZGVdN8v_tanf` | true |
| exp | `none` | 0.5587 ± 0.0083 | 1.00× (baseline) | 0 | `expf` | false |
| exp | `libmvec` | 0.0762 ± 0.0014 | 7.33× | 2 | `_ZGVbN4v_expf`, `_ZGVdN8v_expf` | true |
| log | `none` | 0.5599 ± 0.0054 | 1.00× (baseline) | 0 | `logf` | false |
| log | `libmvec` | 0.0806 ± 0.0011 | 6.95× | 4 | `_ZGVbN4v_logf`, `_ZGVdN8v_logf` | true |
| log1p | `none` | 2.0800 ± 0.0318 | 1.00× (baseline) | 0 | `log1pf` | false |
| log1p | `libmvec` | 2.0663 ± 0.0158 | 1.01× | 0 | `log1pf` | false |
| log2 | `none` | 0.3814 ± 0.0087 | 1.00× (baseline) | 0 | `log2f` | false |
| log2 | `libmvec` | 0.3798 ± 0.0096 | 1.00× | 0 | `log2f` | false |
| expm1 | `none` | 2.2276 ± 0.0092 | 1.00× (baseline) | 0 | `expm1f` | false |
| expm1 | `libmvec` | 2.2256 ± 0.0093 | 1.00× | 0 | `expm1f` | false |
| tanh | `none` | 3.1824 ± 0.0187 | 1.00× (baseline) | 0 | `tanhf` | false |
| tanh | `libmvec` | 3.2165 ± 0.0362 | 0.99× | 0 | `tanhf` | false |
| sqrt | `none` | 0.0375 ± 0.0000 | 1.00× (baseline) | 0 | `vsqrtps` | false |
| sqrt | `libmvec` | 0.0375 ± 0.0000 | 1.00× | 0 | `vsqrtps` | false |
| power | `none` | 0.8623 ± 0.0019 | 1.00× (baseline) | 0 | `powf` | false |
| power | `libmvec` | 0.3864 ± 0.0040 | 2.23× | 1 | `_ZGVbN4vv_powf`, `_ZGVdN8vv_powf` | true |
| erf | `none` | 2.3362 ± 0.0159 | 1.00× (baseline) | 0 | `erff` | false |
| erf | `libmvec` | 2.3240 ± 0.0094 | 1.01× | 0 | `erff` | false |

### float64

| Operation | Selection | Time ± std (ms) | Speedup | Max ULP | Emitted math symbol / instruction | Different from none? |
|---|---|---:|---:|---:|---|---|
| sin | `none` | 1.6516 ± 0.0153 | 1.00× (baseline) | 0 | `sin` | false |
| sin | `libmvec` | 0.1803 ± 0.0039 | 9.16× | 3 | `_ZGVdN4v_sin` | true |
| cos | `none` | 1.9893 ± 0.0115 | 1.00× (baseline) | 0 | `cos` | false |
| cos | `libmvec` | 0.1873 ± 0.0042 | 10.62× | 3 | `_ZGVdN4v_cos` | true |
| tan | `none` | 1.6234 ± 0.0129 | 1.00× (baseline) | 0 | `tan` | false |
| tan | `libmvec` | 0.1869 ± 0.0046 | 8.69× | 2 | `_ZGVdN4v_tan` | true |
| exp | `none` | 0.9190 ± 0.0292 | 1.00× (baseline) | 0 | `exp` | false |
| exp | `libmvec` | 0.1623 ± 0.0036 | 5.66× | 3 | `_ZGVdN4v_exp` | true |
| log | `none` | 0.8532 ± 0.0135 | 1.00× (baseline) | 0 | `log` | false |
| log | `libmvec` | 0.2236 ± 0.0017 | 3.82× | 1 | `_ZGVdN4v_log` | true |
| log1p | `none` | 2.2937 ± 0.0162 | 1.00× (baseline) | 0 | `log1p` | false |
| log1p | `libmvec` | 2.2838 ± 0.0042 | 1.00× | 0 | `log1p` | false |
| log2 | `none` | 0.5853 ± 0.0003 | 1.00× (baseline) | 0 | `log2` | false |
| log2 | `libmvec` | 0.5852 ± 0.0002 | 1.00× | 0 | `log2` | false |
| expm1 | `none` | 2.2162 ± 0.0075 | 1.00× (baseline) | 0 | `expm1` | false |
| expm1 | `libmvec` | 2.2212 ± 0.0104 | 1.00× | 0 | `expm1` | false |
| tanh | `none` | 3.2272 ± 0.0116 | 1.00× (baseline) | 0 | `tanh` | false |
| tanh | `libmvec` | 3.2278 ± 0.0099 | 1.00× | 0 | `tanh` | false |
| sqrt | `none` | 0.1493 ± 0.0000 | 1.00× (baseline) | 0 | `vsqrtpd` | false |
| sqrt | `libmvec` | 0.1497 ± 0.0005 | 1.00× | 0 | `vsqrtpd` | false |
| power | `none` | 1.9485 ± 0.0163 | 1.00× (baseline) | 0 | `pow` | false |
| power | `libmvec` | 0.7397 ± 0.0058 | 2.63× | 1 | `_ZGVdN4vv_pow` | true |
| erf | `none` | 2.4558 ± 0.0165 | 1.00× (baseline) | 0 | `erf` | false |
| erf | `libmvec` | 2.4622 ± 0.0175 | 1.00× | 0 | `erf` | false |
