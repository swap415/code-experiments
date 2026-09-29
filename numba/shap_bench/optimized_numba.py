"""SHAP delta minimization for 2-D boolean masks, without scoring temporaries."""

import numpy as np
from numba import njit


@njit
def _reverse_window(order, start, length):
    for i in range(length // 2):
        tmp = order[start + i]
        order[start + i] = order[start + length - i - 1]
        order[start + length - i - 1] = tmp


@njit
def _reverse_window_score_gain(masks, order, start, length):
    left = order[start - 1]
    first = order[start]
    last = order[start + length - 1]
    right = order[start + length]
    gain = 0
    # Four Hamming distances in one pass, with no row views or XOR arrays.
    for j in range(masks.shape[1]):
        a = masks[left, j]
        b = masks[first, j]
        c = masks[last, j]
        d = masks[right, j]
        gain += int(a ^ b) + int(c ^ d) - int(a ^ c) - int(b ^ d)
    return gain


@njit
def _delta_minimization_order(all_masks, max_swap_size=100, num_passes=2):
    order = np.arange(len(all_masks))
    for _ in range(num_passes):
        for length in range(2, max_swap_size):
            for i in range(1, len(order) - length):
                if _reverse_window_score_gain(all_masks, order, i, length) > 0:
                    _reverse_window(order, i, length)
    return order


if __name__ == "__main__":
    rng = np.random.default_rng(0)
    masks = rng.integers(0, 2, (256, 8)).astype(np.bool_)
    order = _delta_minimization_order(masks)
    assert np.array_equal(np.sort(order), np.arange(len(masks)))
