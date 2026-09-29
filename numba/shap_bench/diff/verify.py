"""Correctness checks on the two frozen boolean-mask implementations."""

from itertools import product
import json

import numpy as np
from compare import load_kernel


original, original_hash = load_kernel("original")
optimized, optimized_hash = load_kernel("optimized")
gains = set()
for bits in product((False, True), repeat=4):
    masks = np.array(bits, dtype=np.bool_).reshape(4, 1)
    order = np.arange(4)
    expected = original._reverse_window_score_gain(masks, order, 1, 2)
    assert optimized._reverse_window_score_gain(masks, order, 1, 2) == expected
    assert optimized._reverse_window_score_gain.py_func(masks, order, 1, 2) == expected
    gains.add(expected)
assert gains == {-2, 0, 2}

rng = np.random.default_rng(51)
cases = 0
for shape in ((0, 0), (1, 0), (3, 0), (4, 1), (5, 3), (16, 5), (256, 8)):
    for base in (np.zeros(shape, dtype=np.bool_), np.ones(shape, dtype=np.bool_),
                 rng.integers(0, 2, shape).astype(np.bool_)):
        for masks in (base, base[:, ::-1], base[::2], np.asfortranarray(base)):
            unchanged = masks.copy()
            for window, passes in ((0, 0), (2, 2), (3, 1), (9, 2),
                                   (100, 2), (-2, 1), (100, -1)):
                expected = original._delta_minimization_order(masks, window, passes)
                result = optimized._delta_minimization_order(masks, window, passes)
                np.testing.assert_array_equal(result, expected)
                np.testing.assert_array_equal(np.sort(result), np.arange(len(masks)))
                np.testing.assert_array_equal(masks, unchanged)
                cases += 1
print(json.dumps({"exact_order_and_input_checks": cases, "signed_gain_checks": 16,
                  "status": "PASS", "source_sha256": {
                      "original": original_hash, "optimized": optimized_hash}}, indent=2))
