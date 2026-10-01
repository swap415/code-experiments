import numpy as np
from numba import config, jit


def make_kernel(operation):
    @jit
    def kernel(x, out):
        for i in range(x.size):
            out[i] = operation(x[i])
    return kernel


print('Library:', config.VECTOR_MATH_LIBRARY)
for name in ('tan', 'log1p', 'expm1'):
    kernel = make_kernel(getattr(np, name))
    for dtype in (np.float32, np.float64):
        x = np.full(64, -0.0, dtype=dtype)
        out = np.empty_like(x)
        kernel(x, out)
        print(name, dtype.__name__, 'input:', float(x[0]).hex(),
              'output:', float(out[0]).hex(),
              'negative outputs:', np.count_nonzero(np.signbit(out)))
