"""Write RESULTS.md from the saved 262,144-element, fastmath=False runs."""

import argparse
from collections import defaultdict
import json
from pathlib import Path
from statistics import mean, stdev


PROVIDERS = {
    'macos': ('none', 'accelerate', 'darwin_libsystem_m'),
    'linux': ('none', 'libmvec'),
}
OPERATIONS = ('sin', 'cos', 'tan', 'exp', 'log', 'log1p', 'log2', 'expm1',
              'tanh', 'sqrt', 'power', 'erf')


def symbols(row):
    emitted = {s['name'] for s in row['math_symbols'] if s['assembly']}
    vector = emitted.intersection(row['vector_calls'])
    hardware = row['hardware_sqrt']
    if hardware and not vector:
        return tuple(sorted(name for name in hardware
                            if '.' in name or name.endswith(('ps', 'pd'))))
    return tuple(sorted(vector or emitted))


def read_results(directory):
    groups = defaultdict(list)
    metadata = None
    for path in sorted(directory.glob('*_round*.jsonl')):
        for line in path.read_text().splitlines():
            row = json.loads(line)
            if row['kind'] == 'metadata':
                metadata = row
            elif row['size'] == 262144 and not row['fastmath']:
                if row['status'] != 'ok':
                    raise ValueError(f'Failed benchmark: {row}')
                groups[row['provider'], row['operation'], row['dtype']].append(row)
    results = {}
    for key, rows in groups.items():
        if sorted(r['round'] for r in rows) != [0, 1, 2]:
            raise ValueError(f'{key}: expected three process rounds')
        implementations = {symbols(row) for row in rows}
        if len(implementations) != 1 or not symbols(rows[0]):
            raise ValueError(f'{key}: missing or inconsistent emitted symbols')
        samples = [sample for row in rows for sample in row['samples_ms']]
        if any(len(row['samples_ms']) != 7 for row in rows):
            raise ValueError(f'{key}: expected seven samples per round')
        results[key] = mean(samples), stdev(samples), symbols(rows[0])
    return metadata, results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--machines', nargs='+', choices=PROVIDERS, default=list(PROVIDERS))
    args = parser.parse_args()
    root = Path(__file__).parent
    lines = ['# Vector math benchmark results', '',
             '262,144 elements · fastmath=False · 21 samples per row. '
             'Speedup = mean time with `none` ÷ mean time with selection.', '']
    for machine in args.machines:
        metadata, results = read_results(root / 'results' / machine)
        lines += [f'## {machine}: {metadata["cpu"]}', '',
                  f'{metadata["platform"]}; LLVM {".".join(map(str, metadata["llvm"]))}, '
                  f'Python {metadata["python"]}, NumPy {metadata["numpy"]}.', '']
        for dtype in ('float32', 'float64'):
            lines += [f'### {dtype}', '',
                      '| Operation | Selection | Time ± std (ms) | Speedup | Emitted math symbol / instruction | Different from none? |',
                      '|---|---|---:|---:|---|---|']
            for operation in OPERATIONS:
                baseline, _, baseline_symbols = results['none', operation, dtype]
                for provider in PROVIDERS[machine]:
                    timing, deviation, emitted = results[provider, operation, dtype]
                    changed = str(emitted != baseline_symbols).lower()
                    names = ', '.join(f'`{name}`' for name in emitted)
                    speedup = '1.00× (baseline)' if provider == 'none' else f'{baseline / timing:.2f}×'
                    lines.append(f'| {operation} | `{provider}` | '
                                 f'{timing:.4f} ± {deviation:.4f} | {speedup} | '
                                 f'{names} | {changed} |')
            lines.append('')
    (root / 'RESULTS.md').write_text('\n'.join(lines))


if __name__ == '__main__':
    main()
