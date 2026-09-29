"""Measure one provider in a fresh process; write one JSON record per case."""

import argparse
import ctypes.util
import json
import math
import os
from pathlib import Path
import platform
import re
import statistics
import time

parser = argparse.ArgumentParser()
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--round', type=int, default=0)
parser.add_argument('--samples', type=int, default=7)
parser.add_argument('--target-ms', type=float, default=5)
parser.add_argument('--sizes', type=int, nargs='+', default=[4096, 262144])
parser.add_argument('--operations', nargs='+', default=[
    'sin', 'cos', 'tan', 'exp', 'log', 'log1p', 'log2', 'expm1', 'tanh',
    'sqrt', 'power', 'erf'])
parser.add_argument('--load-runtime', help='Runtime discovery name for older snapshots')
args = parser.parse_args()

import numpy as np
import numba
import llvmlite
from llvmlite import binding as llvm

provider = numba.config.VECTOR_MATH_LIBRARY
if args.load_runtime:
    runtime = ctypes.util.find_library(args.load_runtime)
    if runtime is None:
        raise RuntimeError(f'Runtime not found: {args.load_runtime}')
    llvm.load_library_permanently(runtime)


def make_kernel(operation, fastmath, binary):
    if binary:
        @numba.jit(fastmath=fastmath)
        def kernel(x, y, out):
            for i in range(x.size):
                out[i] = operation(x[i], y[i])
    else:
        @numba.jit(fastmath=fastmath)
        def kernel(x, y, out):
            for i in range(x.size):
                out[i] = operation(x[i])
    return kernel


def inputs(name, dtype, size):
    ranges = {'tan': (-1, 1), 'exp': (-4, 4), 'log': (0.125, 8), 'log2': (0.125, 8),
              'log1p': (-0.75, 4), 'sqrt': (0.125, 8), 'power': (0.125, 4)}
    low, high = ranges.get(name, (-2, 2))
    rng = np.random.default_rng(20260930)
    x = rng.uniform(low, high, size).astype(dtype)
    y = rng.uniform(-2, 2, size).astype(dtype)
    return x, y, np.empty_like(x), [low, high]


def measure(kernel, x, y, out):
    for _ in range(3):
        kernel(x, y, out)
    start = time.perf_counter_ns()
    for _ in range(5):
        kernel(x, y, out)
    per_call = (time.perf_counter_ns() - start) / 5
    iterations = max(1, min(32768, math.ceil(args.target_ms * 1e6 / per_call)))
    samples = []
    for _ in range(args.samples):
        start = time.perf_counter_ns()
        for _ in range(iterations):
            kernel(x, y, out)
        samples.append((time.perf_counter_ns() - start) / iterations / 1e6)
    return samples, iterations


def inspect(kernel, root):
    signature = kernel.signatures[-1]
    ir = kernel.inspect_llvm(signature)
    asm = kernel.inspect_asm(signature)
    callees = set()
    for line in ir.splitlines():
        if 'call ' in line:
            match = re.search(r'@([^\s(]+)\(', line)
            if match and root in match[1]:
                callees.add(match[1])
    vector = sorted(s for s in callees if not s.startswith('llvm.') and
                    (s.startswith(('_ZGV', '_simd_', '__svml', 'Sleef')) or
                     s.startswith('v')))
    return sorted(callees), vector, ir, asm


args.output.parent.mkdir(parents=True, exist_ok=True)
artifact_dir = args.output.parent / 'ir' / str(provider)
if args.round == 0:
    artifact_dir.mkdir(parents=True, exist_ok=True)
metadata = {
    'kind': 'metadata', 'provider': provider, 'round': args.round,
    'platform': platform.platform(), 'python': platform.python_version(),
    'cpu': str(llvm.get_host_cpu_name()), 'triple': llvm.get_process_triple(),
    'cpu_features': llvm.get_host_cpu_features().flatten(),
    'affinity': sorted(os.sched_getaffinity(0)) if hasattr(os, 'sched_getaffinity') else None,
    'numba': numba.__version__, 'numba_file': numba.__file__,
    'llvmlite': llvmlite.__version__, 'llvmlite_file': llvmlite.__file__,
    'llvm': llvm.llvm_version_info, 'numpy': np.__version__,
    'opt': str(numba.config.OPT), 'loop_vectorize': numba.config.LOOP_VECTORIZE,
    'slp_vectorize': numba.config.SLP_VECTORIZE,
    'runtime_loaded_by_harness': args.load_runtime,
    'samples_per_case': args.samples, 'target_sample_ms': args.target_ms,
    'libraries': {name: ctypes.util.find_library(name) for name in
                  ('Accelerate', 'System', 'mvec', 'sleefgnuabi', 'svml', 'amath', 'alm')},
}
with args.output.open('w') as stream:
    stream.write(json.dumps(metadata) + '\n')
    stream.flush()
    for name in args.operations:
        operation = math.erf if name == 'erf' else getattr(np, name)
        for fastmath in (False, True):
            kernel = make_kernel(operation, fastmath, name == 'power')
            for dtype in (np.float32, np.float64):
                for size in args.sizes:
                    row = {'kind': 'result', 'provider': provider, 'round': args.round,
                           'operation': name, 'dtype': np.dtype(dtype).name,
                           'size': size, 'fastmath': fastmath}
                    try:
                        x, y, out, domain = inputs(name, dtype, size)
                        kernel(x, y, out)
                        root = 'pow' if name == 'power' else name
                        calls, vector, ir, asm = inspect(kernel, root)
                        if args.round == 0 and size == args.sizes[0]:
                            stem = f'{name}_{np.dtype(dtype).name}_fastmath{int(fastmath)}'
                            (artifact_dir / f'{stem}.ll').write_text(ir)
                            (artifact_dir / f'{stem}.s').write_text(asm)
                        if name == 'erf':
                            reference = np.array([math.erf(float(v)) for v in x], dtype=dtype)
                        elif name == 'power':
                            reference = operation(x.astype(np.float64), y.astype(np.float64)).astype(dtype)
                        else:
                            reference = operation(x.astype(np.float64)).astype(dtype)
                        np.testing.assert_allclose(out, reference,
                            rtol=5e-6 if dtype == np.float32 else 2e-13,
                            atol=np.finfo(dtype).eps * 8)
                        error = np.abs(out.astype(np.float64) - reference.astype(np.float64))
                        ulps = error / np.abs(np.spacing(reference).astype(np.float64))
                        samples, iterations = measure(kernel, x, y, out)
                        row.update(status='ok', input_range=domain, calls=calls,
                            vector_calls=vector, vector_symbol_in_asm=all(s in asm for s in vector),
                            samples_ms=samples, iterations_per_sample=iterations,
                            mean_ms=statistics.mean(samples), std_ms=statistics.stdev(samples),
                            max_abs_error=float(error.max()), max_ulp_vs_reference=float(ulps.max()),
                            output_checksum=float(out.sum(dtype=np.float64)))
                    except Exception as exc:
                        row.update(status='error', error=f'{type(exc).__name__}: {exc}')
                    stream.write(json.dumps(row) + '\n')
                    stream.flush()
        print(f'{provider} round {args.round + 1}: {name} done', flush=True)
