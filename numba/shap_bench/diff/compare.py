"""Compare unchanged original and optimized SHAP sources; profile only warm calls."""

import argparse
import ast
from contextlib import contextmanager
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import select
import sys
import time
from types import ModuleType

import llvmlite
from llvmlite import binding as llvm
import numba
import numpy as np


SOURCES = {"original": "original_numba_debug.py", "optimized": "optimized_numba.py"}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def save(directory, name, value):
    (directory / name).write_text(json.dumps(value, indent=2) + "\n")


def load_kernel(variant):
    path = Path(__file__).resolve().parent / SOURCES[variant]
    source = path.read_bytes()
    tree = ast.parse(source, filename=str(path))
    tree.body = [node for node in tree.body
                 if isinstance(node, (ast.Import, ast.ImportFrom, ast.FunctionDef))]
    module = ModuleType(variant + "_kernel")
    module.__file__ = str(path)
    sys.modules[module.__name__] = module
    exec(compile(tree, str(path), "exec"), module.__dict__)
    return module, digest(source)


@contextmanager
def perf_events(control, ack):
    with open(control, "w", buffering=1) as commands, open(ack) as replies:
        def send(command):
            commands.write(command + "\n")
            if not select.select([replies], [], [], 30)[0]:
                raise TimeoutError(f"perf did not acknowledge {command}")
            response = replies.readline().strip("\x00\r\n")
            if response != "ack":
                raise RuntimeError(f"perf {command}: expected ack, got {response!r}")
        send("enable")
        try:
            yield
        finally:
            send("disable")


def inspect_kernel(module, directory):
    inspection = {}
    for name, function in vars(module).items():
        if not isinstance(function, numba.core.registry.CPUDispatcher):
            continue
        for index, signature in enumerate(function.signatures):
            stem = f"{module.__name__}.{name}.{index}"
            ir = function.inspect_llvm(signature)
            native_name = function.overloads[signature].fndesc.mangled_name
            native = str(llvm.parse_assembly(ir).get_function(native_name))
            (directory / (stem + ".ll")).write_text(ir)
            (directory / (stem + ".native.ll")).write_text(native)
            (directory / (stem + ".s")).write_text(function.inspect_asm(signature))
            inspection[stem] = {
                "signature": str(signature), "native_symbol": native_name,
                "native_nrt_calls": re.findall(r"\b(?:call|invoke)\b[^\n]*@NRT_([\w]+)", native),
            }
    save(directory, "inspection.json", inspection)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("benchmark", "profile"))
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--features", type=int, default=13)
    parser.add_argument("--repeats", type=int, default=10)
    parser.add_argument("--variant", choices=tuple(SOURCES))
    parser.add_argument("--seconds", type=float, default=8)
    parser.add_argument("--control")
    parser.add_argument("--ack")
    args = parser.parse_args()
    if args.features < 1 or args.repeats < 2 or args.seconds <= 0:
        parser.error("features/seconds must be positive; repeats must be >= 2")
    if args.mode == "profile" and not all((args.variant, args.control, args.ack)):
        parser.error("profile requires --variant, --control, and --ack")
    args.output.mkdir(parents=True, exist_ok=True)
    modules, hashes = {}, {}
    for variant in SOURCES:
        modules[variant], hashes[variant] = load_kernel(variant)
    functions = {name: module._delta_minimization_order for name, module in modules.items()}
    environment = {
        "python": sys.version, "platform": platform.platform(), "pid": os.getpid(),
        "numpy": np.__version__, "numba": numba.__version__, "llvmlite": llvmlite.__version__,
        "llvm": llvm.llvm_version_info, "numba_path": numba.__file__,
        "llvmlite_path": llvmlite.__file__, "source_sha256": hashes,
        "profiling": numba.config.ENABLE_PROFILING, "debuginfo": numba.config.DEBUGINFO_DEFAULT,
        "has_perf_jit_events": getattr(llvm, "has_perf_jit_events", None),
        "affinity": sorted(os.sched_getaffinity(0)) if hasattr(os, "sched_getaffinity") else None,
        "environment": {k: v for k, v in os.environ.items()
                        if k.startswith(("NUMBA_", "LLVM_")) or k in ("PYTHONPATH", "JITDUMPDIR")},
        "arguments": {k: str(v) if isinstance(v, Path) else v for k, v in vars(args).items()},
    }
    save(args.output, "env.json", environment)
    print(json.dumps(environment, indent=2), flush=True)
    masks = np.random.default_rng(0).integers(0, 2, (2**args.features, args.features)).astype(np.bool_)
    unchanged = masks.copy()
    expected = None
    for function in functions.values():
        for _ in range(2):
            result = function(masks)
            if expected is None:
                expected = result.copy()
            np.testing.assert_array_equal(result, expected)
            np.testing.assert_array_equal(masks, unchanged)
    np.testing.assert_array_equal(np.sort(expected), np.arange(len(masks)))
    output_hash = digest(expected.tobytes())
    print(f"Warm-up/equality/input checks passed; output SHA256={output_hash}", flush=True)
    if args.mode == "benchmark":
        timings = {name: [] for name in functions}
        for repeat in range(args.repeats):
            for name in tuple(functions)[::1 if repeat % 2 == 0 else -1]:
                started = time.perf_counter_ns()
                result = functions[name](masks)
                elapsed_ms = (time.perf_counter_ns() - started) / 1e6
                timings[name].append(elapsed_ms)
                np.testing.assert_array_equal(result, expected)
                np.testing.assert_array_equal(masks, unchanged)
        stats = {name: {"raw_ms": samples, "mean_ms": float(np.mean(samples)),
                        "std_ms": float(np.std(samples, ddof=1)), "median_ms": float(np.median(samples))}
                 for name, samples in timings.items()}
        report = {"n": args.repeats, "seed": 0, "shape": list(masks.shape),
                  "output_sha256": output_hash, "source_sha256": hashes, "timings": stats,
                  "mean_speedup": stats["original"]["mean_ms"] / stats["optimized"]["mean_ms"],
                  "median_speedup": stats["original"]["median_ms"] / stats["optimized"]["median_ms"]}
        save(args.output, "timings.json", report)
    else:
        inspect_kernel(modules[args.variant], args.output)
        function = functions[args.variant]
        iterations = checksum = 0
        with perf_events(args.control, args.ack):
            started = time.perf_counter()
            while True:
                result = function(masks)
                checksum += int(result[0]) + int(result[-1])
                iterations += 1
                elapsed = time.perf_counter() - started
                if elapsed >= args.seconds:
                    break
        np.testing.assert_array_equal(result, expected)
        np.testing.assert_array_equal(masks, unchanged)
        assert checksum == iterations * (int(expected[0]) + int(expected[-1]))
        report = {"variant": args.variant, "elapsed_seconds": elapsed, "iterations": iterations,
                  "checksum": checksum, "output_sha256": output_hash, "source_sha256": hashes,
                  "mean_ms_per_call": elapsed * 1000 / iterations,
                  "note": "Profiled throughput, not a repeated-trial benchmark."}
        save(args.output, "workload.json", report)
    print(json.dumps(report, indent=2), flush=True)


if __name__ == "__main__":
    main()
