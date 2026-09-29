import numpy as np
import numba

# @numba.njit
def f(x):
    return np.expand_dims(x, 0).sum()

# @numba.njit
def g(x):
    return f(x)

x = np.array([[1.0, 0.0], [3.0, 4.0]])
print(f(x))
print(g(x))