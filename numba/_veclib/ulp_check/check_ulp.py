import math
import numpy as np
from numba import config, jit
from ulp import ulp_distance


def make_kernel(operation, binary):
    @jit
    def kernel(x, y):
        out = np.empty_like(x)
        for i in range(x.size):
            if binary:
                out[i] = operation(x[i], y[i])
            else:
                out[i] = operation(x[i])
        return out
    return kernel


print('Library:', config.VECTOR_MATH_LIBRARY)
print('100,000 inputs in [0.125, 1]; power exponents in [-2, 2]')
print(f'{"Function":<10} {"Dtype":<8} {"Max ULP":>7}  Reference')

for name in 'sin cos tan exp log log1p log2 expm1 tanh sqrt power erf'.split():
    operation = math.erf if name == 'erf' else getattr(np, name)
    kernel = make_kernel(operation, binary=name == 'power')
    for dtype in (np.float32, np.float64):
        x = np.linspace(0.125, 1, 100_000, dtype=dtype)
        y = np.linspace(-2, 2, x.size, dtype=dtype)
        actual = kernel(x, y)
        if name == 'erf':
            expected = np.array([math.erf(float(v)) for v in x], dtype=dtype)
        elif name == 'power':
            expected = np.power(x, y)
        else:
            expected = operation(x)
        maximum = ulp_distance(expected, actual).max()
        reference = 'math.erf' if name == 'erf' else 'NumPy'
        print(f'{name:<10} {dtype.__name__:<8} {maximum:>7}  {reference}')
