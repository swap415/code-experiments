"""Rotate provider order across three fresh-process rounds."""

import argparse
import os
from pathlib import Path
import subprocess
import sys

parser = argparse.ArgumentParser()
parser.add_argument('--providers', nargs='+', required=True)
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--cpu', type=int)
parser.add_argument('--load-libmvec', action='store_true')
args = parser.parse_args()
benchmark = Path(__file__).with_name('benchmark.py')
for round_number in range(3):
    order = args.providers[round_number:] + args.providers[:round_number]
    for provider in order:
        output = args.output / f'{provider}_round{round_number}.jsonl'
        env = os.environ.copy()
        env.update(NUMBA_VECTOR_MATH_LIBRARY=provider, NUMBA_DISABLE_INTEL_SVML='1',
                   NUMBA_NUM_THREADS='1', OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1')
        env.pop('NUMBA_VECTOR_MATH_LIBRARY_PATH', None)
        command = [sys.executable, str(benchmark), '--output', str(output),
                   '--round', str(round_number)]
        if provider == 'libmvec' and args.load_libmvec:
            command += ['--load-runtime', 'mvec']
        if args.cpu is not None:
            command = ['taskset', '-c', str(args.cpu)] + command
        print(f'Running {provider}, round {round_number + 1}', flush=True)
        subprocess.run(command, env=env, check=True)
