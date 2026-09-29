import numpy as np
from numba import njit


@njit
def _mask_delta_score(m1, m2):
    return (m1 ^ m2).sum()


@njit
def _reverse_window(order, start, length):
    for i in range(length // 2):
        tmp = order[start + i]
        order[start + i] = order[start + length - i - 1]
        order[start + length - i - 1] = tmp


@njit
def _reverse_window_score_gain(masks, order, start, length):
    forward_score = _mask_delta_score(masks[order[start - 1]], masks[order[start]]) + _mask_delta_score(
        masks[order[start + length - 1]], masks[order[start + length]]
    )
    reverse_score = _mask_delta_score(masks[order[start - 1]], masks[order[start + length - 1]]) + _mask_delta_score(
        masks[order[start]], masks[order[start + length]]
    )
    return forward_score - reverse_score


@njit
def _delta_minimization_order(all_masks, max_swap_size=100, num_passes=2):
    order = np.arange(len(all_masks))
    for _ in range(num_passes):
        for length in range(2, max_swap_size):
            for i in range(1, len(order) - length):
                if _reverse_window_score_gain(all_masks, order, i, length) > 0:
                    _reverse_window(order, i, length)
    return order


rng = np.random.default_rng(0)
masks = rng.integers(0, 2, (256, 8)).astype(np.bool_)
order = _delta_minimization_order(masks)
assert np.array_equal(np.sort(order), np.arange(len(masks)))
