"""Measure existing serial fusion beyond tiny array reductions."""

import statistics
import time

import numpy as np

from bench_compiler_fusion import compile_serial_score, load_kernels


def main():
    for dtype in (np.bool_, np.uint8, np.int64):
        for size in (4096, 1_000_000):
            rng = np.random.default_rng(0)
            a, b = rng.integers(0, 2, (2, size)).astype(dtype)
            baseline = load_kernels()['_mask_delta_score']
            expected = (a ^ b).sum()
            fused = compile_serial_score(baseline, a, b)
            variants = {'baseline': baseline, 'serial_fusion': fused}
            for function in variants.values():
                for _ in range(2):
                    assert function(a, b) == expected
            # Batch short calls so each sample is at least roughly 0.5 ms.
            batch = 1
            while True:
                start = time.perf_counter_ns()
                for _ in range(batch):
                    result = fused(a, b)
                if time.perf_counter_ns() - start >= 500_000:
                    break
                batch *= 2
            times = {name: [] for name in variants}
            for repeat in range(20):
                for name in list(variants)[::(-1 if repeat % 2 else 1)]:
                    start = time.perf_counter_ns()
                    for _ in range(batch):
                        result = variants[name](a, b)
                    times[name].append((time.perf_counter_ns() - start) / 1e3 / batch)
                    assert result == expected
            print(f'{np.dtype(dtype)} size={size}, n=20, calls/sample={batch}')
            for name, samples in times.items():
                print(f'  {name}: mean={statistics.mean(samples):.2f} us, '
                      f'std={statistics.stdev(samples):.2f} us, '
                      f'median={statistics.median(samples):.2f} us')
                print(f'  {name} raw samples (us/call): {samples}')
            print('  median speedup: '
                  f'{statistics.median(times["baseline"]) / statistics.median(times["serial_fusion"]):.2f}x')


if __name__ == '__main__':
    main()
