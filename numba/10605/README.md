# Numba issue 10605: inserted axis and reduction

[Upstream issue](https://github.com/numba/numba/issues/10605).
`test.py` is an assertion-based reproducer: for the sample array,
`np.expand_dims(x, 0).sum()` should return 8.0. Affected Numba builds return
1.0 under `@njit` with optimization enabled.

From this directory, in an environment with Numba and NumPy installed:

```sh
python test.py
```

The assertion is expected to fail on an affected build. `repro.py` is the
earlier exploratory script with JIT decorators commented out. The suspected
cause is a zero stride for the inserted unit axis interacting with the
optimized reduction loop; that explanation still needs an upstream fix test.
