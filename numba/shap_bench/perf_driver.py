import argparse
import time

import numpy as np
from numba import njit


@njit
def _mask_delta_score_original(m1, m2):
    return (m1 ^ m2).sum()


@njit(inline="always")
def _mask_delta_score_optimized(m1, m2):
    score = 0
    for i in range(len(m1)):
        score += m1[i] ^ m2[i]
    return score


@njit(inline="always")
def _reverse_window(order, start, length):
    for i in range(length // 2):
        j = start + length - i - 1
        order[start + i], order[j] = order[j], order[start + i]


@njit(inline="always")
def _score_gain_original(masks, order, start, length):
    forward = _mask_delta_score_original(masks[order[start - 1]], masks[order[start]])
    forward += _mask_delta_score_original(masks[order[start + length - 1]], masks[order[start + length]])
    reverse = _mask_delta_score_original(masks[order[start - 1]], masks[order[start + length - 1]])
    reverse += _mask_delta_score_original(masks[order[start]], masks[order[start + length]])
    return forward - reverse


@njit(inline="always")
def _score_gain_optimized(masks, order, start, length):
    forward = _mask_delta_score_optimized(masks[order[start - 1]], masks[order[start]])
    forward += _mask_delta_score_optimized(masks[order[start + length - 1]], masks[order[start + length]])
    reverse = _mask_delta_score_optimized(masks[order[start - 1]], masks[order[start + length - 1]])
    reverse += _mask_delta_score_optimized(masks[order[start]], masks[order[start + length]])
    return forward - reverse


@njit
def delta_original(masks, max_swap_size=100, num_passes=2):
    order = np.arange(len(masks))
    for _ in range(num_passes):
        for length in range(2, max_swap_size):
            for i in range(1, len(order) - length):
                if _score_gain_original(masks, order, i, length) > 0:
                    _reverse_window(order, i, length)
    return order


@njit
def delta_optimized(masks, max_swap_size=100, num_passes=2):
    order = np.arange(len(masks))
    for _ in range(num_passes):
        for length in range(2, min(max_swap_size, len(masks))):
            for i in range(1, len(order) - length):
                if _score_gain_optimized(masks, order, i, length) > 0:
                    _reverse_window(order, i, length)
    return order


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("mode", choices=("original", "optimized"))
    parser.add_argument("--features", type=int, default=13)
    parser.add_argument("--seconds", type=float, default=12)
    parser.add_argument("--delay", type=float, default=5)
    args = parser.parse_args()

    rng = np.random.default_rng(0)
    masks = rng.integers(0, 2, (2**args.features, args.features)).astype(np.bool_)
    function = delta_original if args.mode == "original" else delta_optimized

    expected = function(masks)
    np.testing.assert_array_equal(function(masks), expected)
    print(f"warmed mode={args.mode} masks={len(masks)}", flush=True)
    time.sleep(args.delay)

    started = time.perf_counter()
    iterations = 0
    checksum = 0
    while time.perf_counter() - started < args.seconds:
        result = function(masks)
        checksum += int(result[0]) + int(result[-1])
        iterations += 1

    elapsed = time.perf_counter() - started
    print(
        f"mode={args.mode} elapsed={elapsed:.3f}s iterations={iterations} "
        f"mean={elapsed / iterations * 1000:.3f}ms checksum={checksum}",
        flush=True,
    )


if __name__ == "__main__":
    main()
