"""Write precision tables from saved comparisons with none."""

import argparse
import json
from pathlib import Path

from precision_inputs import OPERATIONS


PROFILES = {
    'benchmark': 'Benchmark inputs',
    'wide': 'Wider input ranges',
    'edges': 'Boundary and special inputs',
}


def table(rows):
    lines = [
        '| Operation | Selection | Finite pairs / total | Max ULP | P99 ULP | '
        'Different (%) | Special mismatches | ±0 differences |',
        '|---|---|---:|---:|---:|---:|---:|---:|',
    ]
    for row in sorted(rows, key=lambda r: (
            OPERATIONS.index(r['operation']), r['provider'])):
        maximum = '—' if row['max_ulp'] is None else f"{row['max_ulp']:,}"
        p99 = '—' if row['p99_ulp'] is None else f"{row['p99_ulp']:,}"
        changed = f"{row['changed_percent']:.4f}".rstrip('0').rstrip('.')
        lines.append(
            f"| {row['operation']} | `{row['provider']}` | "
            f"{row['finite_pairs']:,} / {row['size']:,} | {maximum} | {p99} | "
            f"{changed} | {row['special_mismatch']:,} | "
            f"{row['signed_zero_differences']:,} |")
    return lines


def report(comparisons):
    lines = [
        '# Vector math precision compared with none', '',
        'ULP = representable floating-point steps from `none`, which is a '
        'comparison baseline, not an accuracy oracle. fastmath=False.', '',
        'Max, P99 and Different use finite pairs; NaN/infinity disagreements '
        'and signed-zero differences are counted separately. '
        '[Input definitions](precision_inputs.py).', '',
    ]
    for machine, data in comparisons.items():
        metadata = data['metadata']['none']
        llvm = '.'.join(map(str, metadata['llvm']))
        lines += [f"## {machine}: {metadata['cpu']}", '',
                  f"{metadata['platform']}; LLVM {llvm}.", '']
        for dtype in ('float32', 'float64'):
            lines += [f'### {dtype}', '']
            for profile, title in PROFILES.items():
                rows = [row for row in data['rows']
                        if row['dtype'] == dtype and row['profile'] == profile]
                if not rows:
                    continue
                lines += [f'#### {title}', '']
                if profile == 'edges':
                    lines += ['Each distinct input is repeated 16 times; '
                              'padding completes vector batches.', '']
                lines += table(rows) + ['']
    return '\n'.join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input', type=Path, default=Path(__file__).parent / 'precision')
    parser.add_argument('--output', type=Path, default=Path(__file__).parent / 'PRECISION.md')
    args = parser.parse_args()
    comparisons = {path.parent.name: json.loads(path.read_text())
                   for path in sorted(args.input.glob('*/comparison.json'),
                                      key=lambda path: path.parent.name != 'macos')}
    if not comparisons:
        parser.error(f'no comparison.json files under {args.input}')
    args.output.write_text(report(comparisons))


if __name__ == '__main__':
    main()
