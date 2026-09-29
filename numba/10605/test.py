"""
Minimal repro for numba/numba#10605.

`np.expand_dims(x, 0).sum()` inside @njit returns 1.0 instead of 8.0.

Root cause: numba/np/arrayobj.py:6061 stores 0 as the stride for the
inserted unit axis. With NUMBA_OPT >= 1 the optimizer uses that
stride-0 fact to collapse the outer loop in array.sum's nditer path.

Workarounds that mask the bug: NUMBA_OPT=0, .ravel().sum(), inline
nditer loop, or any manual indexed loop.
"""
import numpy as np
import numba


@numba.njit
def f(x):
    return np.expand_dims(x, 0).sum()


if __name__ == "__main__":
    x = np.array([[1.0, 0.0], [3.0, 4.0]])
    expected = x.sum()  # 8.0
    got = f(x)
    assert got == expected, f"expected {expected}, got {got}"
