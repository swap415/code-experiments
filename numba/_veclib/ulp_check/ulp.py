"""Representable-step differences between outputs of the same dtype."""

import numpy as np


def _arrays(reference, actual):
    reference, actual = np.asarray(reference), np.asarray(actual)
    if reference.dtype not in (np.dtype("float32"), np.dtype("float64")):
        raise TypeError("expected float32 or float64 arrays")
    if reference.dtype != actual.dtype or reference.shape != actual.shape:
        raise ValueError("arrays must have the same dtype and shape")
    return reference, actual


def ulp_distance(reference, actual):
    """Count finite representable steps, treating both signed zeros as zero."""
    reference, actual = _arrays(reference, actual)
    if not (np.isfinite(reference).all() and np.isfinite(actual).all()):
        raise ValueError("ULP distance requires finite values")
    uint = np.uint32 if reference.dtype.itemsize == 4 else np.uint64
    sign = uint(1 << (reference.dtype.itemsize * 8 - 1))

    def ordered(values):
        bits = values.view(uint)
        magnitude = bits & (sign - uint(1))
        return np.where(bits & sign, sign - magnitude, sign + magnitude)

    left, right = ordered(reference), ordered(actual)
    return np.maximum(left, right) - np.minimum(left, right)


def compare(reference, actual):
    """Compare finite values separately from NaN, infinity, and zero signs.

    p99 is the higher order statistic, preserving integer ULP distances.
    Absolute differences outside float64 range are reported as overflow.
    """
    reference, actual = _arrays(reference, actual)
    reference, actual = reference.ravel(), actual.ravel()
    finite = np.isfinite(reference) & np.isfinite(actual)
    distance = ulp_distance(reference[finite], actual[finite])
    count = len(distance)
    changed = int(np.count_nonzero(distance))
    p99_index = int(np.ceil(0.99 * (count - 1))) if count else 0
    nan_mismatch = np.isnan(reference) ^ np.isnan(actual)
    infinity_mismatch = (
        (np.isinf(reference) | np.isinf(actual))
        & ~np.isnan(reference) & ~np.isnan(actual) & (reference != actual)
    )
    zero_signs = (
        (reference == 0) & (actual == 0)
        & (np.signbit(reference) != np.signbit(actual))
    )
    with np.errstate(over="ignore"):
        absolute = np.abs(reference[finite].astype(np.float64)
                          - actual[finite].astype(np.float64))
    max_absolute = float(absolute.max(initial=0))
    worst = np.argsort(~distance, kind="stable")[:min(5, changed)]
    histogram = {str(n): int(np.count_nonzero(distance == n))
                 for n in range(5)}
    histogram[">4"] = int(np.count_nonzero(distance > 4))
    return {
        "finite_pairs": count,
        "finite_changed": changed,
        "changed_percent": 100 * changed / count if count else 0.0,
        "p99_ulp": int(np.partition(distance, p99_index)[p99_index])
        if count else None,
        "max_ulp": int(distance.max()) if count else None,
        "max_abs_error": max_absolute
        if count and np.isfinite(max_absolute) else None,
        "max_abs_error_overflow": not np.isfinite(max_absolute),
        "histogram": histogram,
        "nan_mismatch": int(np.count_nonzero(nan_mismatch)),
        "infinity_mismatch": int(np.count_nonzero(infinity_mismatch)),
        "special_mismatch": int(np.count_nonzero(
            nan_mismatch | infinity_mismatch)),
        "signed_zero_differences": int(np.count_nonzero(zero_signs)),
        "worst_indices": np.flatnonzero(finite)[worst].tolist(),
    }
