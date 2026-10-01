"""Deterministic inputs for comparing vector libraries with Numba's baseline."""

import math

import numpy as np


OPERATIONS = ('sin', 'cos', 'tan', 'exp', 'log', 'log1p', 'log2',
              'expm1', 'tanh', 'sqrt', 'power', 'erf')
SEED = 20260930


def _finite(rng, dtype, size, signed=False):
    uint = np.uint32 if dtype == np.float32 else np.uint64
    maximum = np.array(np.finfo(dtype).max, dtype=dtype).view(uint).item()
    bits = rng.integers(1, maximum + 1, size, dtype=uint)
    if signed:
        signs = rng.integers(0, 2, size, dtype=uint)
        bits |= signs << uint(np.dtype(dtype).itemsize * 8 - 1)
    return bits.view(dtype)


def _benchmark(name, dtype):
    ranges = {'tan': (-1, 1), 'exp': (-4, 4), 'log': (0.125, 8),
              'log2': (0.125, 8), 'log1p': (-0.75, 4),
              'sqrt': (0.125, 8), 'power': (0.125, 4)}
    low, high = ranges.get(name, (-2, 2))
    rng = np.random.default_rng(SEED)
    x = rng.uniform(low, high, 262144).astype(dtype)
    y = rng.uniform(-2, 2, x.size).astype(dtype)
    return x, y, f'Original benchmark inputs; uniform [{low}, {high}], seed {SEED}.'


def _wide(name, dtype):
    rng = np.random.default_rng(SEED)
    size = 65536
    half = size // 2
    info = np.finfo(dtype)
    lower = math.log(float(info.smallest_subnormal)) - math.log(2)
    upper = math.log(float(info.max)) + math.log(2)

    def uniform(low, high, count=size):
        return rng.uniform(low, high, count).astype(dtype)

    if name in ('sin', 'cos', 'tan'):
        x = np.concatenate((uniform(-1000, 1000, half),
                            _finite(rng, dtype, half, signed=True)))
        domain = 'Half uniform [-1000, 1000], half signed finite bit patterns'
    elif name in ('log', 'log2', 'sqrt'):
        x = _finite(rng, dtype, size)
        domain = 'Positive finite bit patterns across the representable range'
    elif name == 'log1p':
        third = size // 3
        x = np.concatenate((uniform(-2**-10, 2**-10, third),
                            uniform(-1, 8, third),
                            _finite(rng, dtype, size - 2 * third)))
        domain = 'Thirds: uniform [-2^-10, 2^-10], uniform [-1, 8], positive finite bits'
    elif name == 'exp':
        x = uniform(lower, upper)
        domain = 'Uniform [log(minsub) - log(2), log(max) + log(2)]'
    elif name == 'expm1':
        x = np.concatenate((uniform(lower, upper, half),
                            uniform(-2**-10, 2**-10, half)))
        domain = 'Half exp range, half uniform [-2^-10, 2^-10]'
    elif name in ('tanh', 'erf'):
        x = np.concatenate((uniform(-16, 16, half),
                            uniform(-2**-10, 2**-10, half)))
        domain = 'Half uniform [-16, 16], half uniform [-2^-10, 2^-10]'
    else:
        x = np.exp2(rng.uniform(-8, 8, size)).astype(dtype)
        domain = 'Positive bases log-uniform [2^-8, 2^8]; exponents uniform [-8, 8]'
    y = uniform(-8, 8) if name == 'power' else uniform(-2, 2)
    return x, y, f'{domain}; seed {SEED}.'


def _neighbors(values, dtype):
    found = {}
    for value in values:
        value = dtype(value)
        found[value.tobytes()] = value
        if np.isfinite(value):
            for direction in (-np.inf, np.inf):
                neighbor = value
                for _ in range(4):
                    neighbor = np.nextafter(neighbor, dtype(direction))
                    found[neighbor.tobytes()] = neighbor
    return list(found.values())


def _edges(name, dtype):
    info = np.finfo(dtype)
    common = [0.0, -0.0, 1, -1, info.smallest_subnormal,
              -info.smallest_subnormal, info.tiny, -info.tiny,
              info.max, -info.max, np.inf, -np.inf, np.nan]
    if name == 'power':
        bases = common + [-2, -0.5, 0.5, 2]
        exponents = [-np.inf, -3, -2, -1, -0.5, -0.0, 0.0,
                     0.5, 1, 2, 3, np.inf, np.nan]
        pairs = [(dtype(x), dtype(y)) for x in bases for y in exponents]
        pairs += [(x, dtype(y)) for x in _neighbors([-1, 1], dtype)
                  for y in (-3, -2, -0.5, 0.5, 2, 3)]
        pairs += [(dtype(x), y) for x in (-2, 2)
                  for y in _neighbors([-1, 1], dtype)]
    else:
        seeds = list(common)
        if name in ('sin', 'cos', 'tan'):
            seeds += [sign * k * math.pi / 2
                      for k in (1, 2, 3, 4, 16, 256, 2**20, 2**40)
                      for sign in (-1, 1)]
        elif name in ('exp', 'expm1'):
            seeds += [math.log(float(info.max)), math.log(float(info.tiny)),
                      math.log(float(info.smallest_subnormal)),
                      math.log(float(info.smallest_subnormal)) - math.log(2)]
        elif name in ('log', 'log2', 'log1p', 'sqrt'):
            seeds += [0.5, 2, 4]
        elif name in ('tanh', 'erf'):
            seeds += [-16, -8, -4, -2, 2, 4, 8, 16]
        pairs = [(x, dtype(0)) for x in _neighbors(seeds, dtype)]
    unique = {(x.tobytes(), y.tobytes()): (x, y) for x, y in pairs}
    pairs = list(unique.values())
    count = len(pairs)
    pairs += pairs[:(-count) % 4]
    x, y = np.array(pairs, dtype=dtype).T
    description = (f'{count} unique input pairs, including invalid domains and '
                   'nonfinite values; each repeated 16 times, padded to a multiple of 64.')
    return np.repeat(x, 16), np.repeat(y, 16), description


def profiles(name, dtype):
    if name not in OPERATIONS:
        raise ValueError(f'Unknown operation: {name}')
    dtype = np.dtype(dtype).type
    if dtype not in (np.float32, np.float64):
        raise ValueError(f'Unsupported dtype: {dtype}')
    for profile, make in (('benchmark', _benchmark), ('wide', _wide),
                          ('edges', _edges)):
        with np.errstate(over='ignore', under='ignore', invalid='ignore'):
            x, y, description = make(name, dtype)
        yield profile, x, y, description
