"""Compare vector-library outputs with none in separate Python processes."""

import argparse
import ctypes.util
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

import numpy as np

from precision_inputs import OPERATIONS, profiles
from ulp import compare


def kernel_for(operation, binary):
    from numba import jit
    if binary:
        @jit
        def kernel(x, y, out):
            for i in range(x.size):
                out[i] = operation(x[i], y[i])
    else:
        @jit
        def kernel(x, y, out):
            for i in range(x.size):
                out[i] = operation(x[i])
    return kernel


def inspect(kernel, operation):
    root = 'pow' if operation == 'power' else operation
    signature = kernel.signatures[-1]
    ir, asm = kernel.inspect_llvm(signature), kernel.inspect_asm(signature)
    calls = {match[1] for line in ir.splitlines() if 'call ' in line
             if (match := re.search(r'@([^\s(]+)\(', line))
             and root in match[1] and not match[1].startswith('_ZN')}
    vector = sorted(name for name in calls
                    if name.startswith(('_ZGV', '_simd_', 'v')) and name in asm)
    hardware = sorted(set(re.findall(
        r'^\s*(fsqrt\.\w+|v?sqrt(?:ps|pd))\s', asm, re.MULTILINE)))
    scalar = sorted(name for name in (root, root + 'f')
                    if re.search(r'(?<![\w.])_?' + name + r'(?![\w.])', asm))
    return vector or hardware or scalar, vector, ir, asm


def source_state(module):
    path = Path(module.__file__).resolve().parents[1]
    def git(*args):
        return subprocess.check_output(['git', '-C', str(path), *args])
    return dict(path=str(path), commit=git('rev-parse', 'HEAD').decode().strip(),
                diff_sha256=hashlib.sha256(git('diff', 'HEAD')).hexdigest())


def collect(args):
    import math
    import platform
    import numba
    import llvmlite
    from llvmlite import binding as llvm

    provider = args.worker
    if numba.config.VECTOR_MATH_LIBRARY != provider:
        raise ValueError('Provider differs from NUMBA_VECTOR_MATH_LIBRARY')
    if provider == 'libmvec' and args.load_libmvec:
        llvm.load_library_permanently(ctypes.util.find_library('mvec'))
    directory = args.output / provider
    directory.mkdir(parents=True, exist_ok=False)
    (directory / 'ir').mkdir()
    metadata = dict(provider=provider, started_utc=datetime.now(timezone.utc).isoformat(),
                    platform=platform.platform(), cpu=llvm.get_host_cpu_name(),
                    llvm=llvm.llvm_version_info, numpy=np.__version__,
                    python=platform.python_version(), numba=numba.__version__,
                    llvmlite=llvmlite.__version__, fastmath=False,
                    sources={name: source_state(module) for name, module in
                             [('numba', numba), ('llvmlite', llvmlite)]})
    cases = []
    for name in args.operations:
        operation = math.erf if name == 'erf' else getattr(np, name)
        for dtype in (np.float32, np.float64):
            kernel = kernel_for(operation, name == 'power')
            for profile, x, y, description in profiles(name, dtype):
                if profile not in args.profiles:
                    continue
                out = np.empty_like(x)
                kernel(x, y, out)
                emitted, vector, ir, asm = inspect(kernel, name)
                if not emitted:
                    raise ValueError(f'No math implementation found: {name}, {dtype}')
                stem = f'{name}_{np.dtype(dtype).name}'
                filename = f'{stem}_{profile}.npz'
                arrays = dict(output=out)
                if provider == 'none':
                    arrays.update(x=x, y=y)
                np.savez_compressed(directory / filename, **arrays)
                (directory / 'ir' / f'{stem}.ll').write_text(ir)
                (directory / 'ir' / f'{stem}.s').write_text(asm)
                cases.append(dict(operation=name, dtype=np.dtype(dtype).name,
                    profile=profile, description=description, size=x.size,
                    input_sha256=hashlib.sha256(x.tobytes() + y.tobytes()).hexdigest(),
                    file=filename, symbols=emitted, vector_calls=vector))
        print(f'{provider}: {name}', flush=True)
    (directory / 'manifest.json').write_text(json.dumps(
        dict(metadata=metadata, cases=cases), indent=2) + '\n')


def compare_outputs(root, providers):
    manifests = {name: json.loads((root / name / 'manifest.json').read_text())
                 for name in providers}
    baseline = {r['file']: r for r in manifests['none']['cases']}
    rows = []
    for provider in providers:
        if provider == 'none':
            continue
        if {r['file'] for r in manifests[provider]['cases']} != baseline.keys():
            raise ValueError(f'{provider}: incomplete comparison')
        for case in manifests[provider]['cases']:
            reference_case = baseline[case['file']]
            if case['input_sha256'] != reference_case['input_sha256']:
                raise ValueError(f'{provider}: inputs differ for {case["file"]}')
            with np.load(root / 'none' / case['file']) as saved:
                reference, x, y = saved['output'], saved['x'], saved['y']
            with np.load(root / provider / case['file']) as saved:
                actual = saved['output']
            stats = compare(reference, actual)
            def sample(index):
                return dict(index=int(index),
                    **{name: dict(value=str(array[index]), hex=float(array[index]).hex())
                       for name, array in [('x', x), ('y', y), ('none', reference),
                                           ('selected', actual)]})
            special = ((np.isnan(reference) != np.isnan(actual)) |
                       ((np.isinf(reference) | np.isinf(actual)) &
                        ~np.isnan(reference) & ~np.isnan(actual) & (reference != actual)))
            zero_signs = ((reference == 0) & (actual == 0) &
                          (np.signbit(reference) != np.signbit(actual)))
            rows.append(dict(provider=provider, **case, **stats,
                vectorized=case['symbols'] != reference_case['symbols'],
                baseline_symbols=reference_case['symbols'],
                worst=[sample(i) for i in stats['worst_indices']],
                special_examples=[sample(i) for i in np.flatnonzero(special)[:5]],
                zero_sign_examples=[sample(i) for i in np.flatnonzero(zero_signs)[:5]]))
    (root / 'comparison.json').write_text(json.dumps(dict(
        metadata={name: value['metadata'] for name, value in manifests.items()},
        rows=rows), indent=2, allow_nan=False) + '\n')
    print(f'Compared {len(rows)} cases with none; saved {root / "comparison.json"}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--providers', nargs='+', default=['none'])
    parser.add_argument('--operations', nargs='+', default=OPERATIONS)
    parser.add_argument('--profiles', nargs='+', default=['benchmark', 'wide', 'edges'])
    parser.add_argument('--load-libmvec', action='store_true')
    parser.add_argument('--worker')
    args = parser.parse_args()
    if args.worker:
        collect(args)
        return
    if args.providers[0] != 'none':
        parser.error('--providers must start with none')
    for provider in args.providers:
        env = os.environ.copy()
        env.update(NUMBA_VECTOR_MATH_LIBRARY=provider, NUMBA_DISABLE_INTEL_SVML='1',
                   NUMBA_OPT='3', NUMBA_NUM_THREADS='1')
        for name in ('NUMBA_CPU_NAME', 'NUMBA_CPU_FEATURES', 'NUMBA_VECTOR_MATH_LIBRARY_PATH'):
            env.pop(name, None)
        command = [sys.executable, str(Path(__file__).resolve()), '--worker', provider,
                   '--output', str(args.output), '--operations', *args.operations,
                   '--profiles', *args.profiles]
        if args.load_libmvec:
            command.append('--load-libmvec')
        subprocess.run(command, env=env, check=True)
    compare_outputs(args.output, args.providers)


if __name__ == '__main__':
    main()
