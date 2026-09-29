"""Compare existing serial parfor fusion on SHAP clustering kernels.

Run from the Numba checkout:
    PYTHONPATH=. shap/.venv/bin/python issues/shap_bench/bench_compiler_fusion.py
"""

import argparse
import ast
from contextlib import contextmanager
import hashlib
from pathlib import Path
import platform
import statistics
import time

import llvmlite
from llvmlite import binding as llvm
import numba
from numba.parfors import parfor
import numpy as np


SOURCE = Path(__file__).with_name("original_numba_debug.py")
SOURCE_SHA256 = "2f9a86acc344e01748588698f356ed985af242d5ea6c20226acd5e56ce021eea"
REPEATS = 10


def load_kernels():
    source = SOURCE.read_bytes()
    assert hashlib.sha256(source).hexdigest() == SOURCE_SHA256
    tree = ast.parse(source, filename=str(SOURCE))
    # Keep the original imports, decorators and functions, not its smoke test.
    tree.body = [node for node in tree.body
                 if isinstance(node, (ast.Import, ast.ImportFrom, ast.FunctionDef))]
    namespace = {"__name__": "shap_original_repro"}
    exec(compile(tree, str(SOURCE), "exec"), namespace)
    return namespace


@contextmanager
def sequential_lowering():
    """Experimental, process-global switch: only use in this single-threaded test."""
    previous = parfor.sequential_parfor_lowering
    parfor.sequential_parfor_lowering = True
    try:
        yield
    finally:
        parfor.sequential_parfor_lowering = previous


def compile_serial_score(original, a, b):
    """Compile this specialization with existing fusion but no worker threads."""
    fused = numba.njit(parallel=True)(original.py_func)
    with sequential_lowering():
        fused(a, b)
    return fused


def inspect_kernels(name, kernels):
    threading_symbols = ("numba_parallel_for", "do_scheduling", "allocate_sched",
                         "deallocate_sched", "get_num_threads", "get_thread_id")
    for function in kernels.values():
        if not isinstance(function, numba.core.registry.CPUDispatcher):
            continue
        for signature in function.signatures:
            ir = function.inspect_llvm(signature)
            assert not any(symbol in ir for symbol in threading_symbols), function
    score = kernels["_mask_delta_score"]
    ir = score.inspect_llvm(score.signatures[0])
    allocations = [line.strip() for line in ir.splitlines()
                   if " call " in line and "NRT_MemInfo_alloc" in line]
    print(f"{name} _mask_delta_score LLVM NRT allocation calls: {len(allocations)}")
    assert len(allocations) == (1 if name == "baseline" else 0)
    print(f"{name} threading symbols across score and callers: 0")
    if name == "serial_fusion":
        diagnostics = score.overloads[score.signatures[0]].metadata["parfor_diagnostics"]
        print(f"Existing parfor fusion metadata: {dict(diagnostics.fusion_info)}")
        assert diagnostics.fusion_info


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cpp", action="store_true",
                        help="also time the installed current SHAP C++ extension")
    args = parser.parse_args()
    print(f"Python {platform.python_version()} | {platform.platform()}")
    print(f"NumPy {np.__version__} | Numba {numba.__version__} | "
          f"llvmlite {llvmlite.__version__} | LLVM {llvm.llvm_version_info}")
    print(f"Numba source: {numba.__file__}")
    print(f"Original source SHA256: {SOURCE_SHA256}")
    print("Only difference: the unchanged _mask_delta_score uses existing "
          "parallel=True fusion, compiled with sequential parfor lowering. "
          "All callers retain their original @njit configuration.")
    inputs = {features: np.random.default_rng(0).integers(
        0, 2, (2**features, features)).astype(np.bool_)
        for features in (8, 13)}

    baseline = load_kernels()
    expected = {features: baseline["_delta_minimization_order"](masks)
                for features, masks in inputs.items()}
    fused = load_kernels()
    a, b = inputs[8][:2]
    fused["_mask_delta_score"] = compile_serial_score(fused["_mask_delta_score"], a, b)
    variants = {"baseline": baseline, "serial_fusion": fused}

    for name, kernels in variants.items():
        function = kernels["_delta_minimization_order"]
        for features, masks in inputs.items():
            for _ in range(2):
                np.testing.assert_array_equal(function(masks), expected[features])
            np.testing.assert_array_equal(np.sort(expected[features]),
                                          np.arange(len(masks)))
        inspect_kernels(name, kernels)

    functions = {name: kernels["_delta_minimization_order"]
                 for name, kernels in variants.items()}
    if args.cpp:
        import shap
        from shap import _cutils

        print(f"C++ comparison: current SHAP {shap.__version__}, {_cutils.__file__}; "
              "not the historical PR 4654 build")
        functions["current_cpp"] = _cutils.delta_minimization_order
        for features, masks in inputs.items():
            for _ in range(2):
                np.testing.assert_array_equal(functions["current_cpp"](masks),
                                              expected[features])

    for features, masks in inputs.items():
        times = {name: [] for name in functions}
        for repetition in range(REPEATS):
            names = list(functions)
            offset = repetition % len(names)
            names = names[offset:] + names[:offset]
            for name in names:
                function = functions[name]
                start = time.perf_counter_ns()
                result = function(masks)
                elapsed_ms = (time.perf_counter_ns() - start) / 1e6
                times[name].append(elapsed_ms)
                np.testing.assert_array_equal(result, expected[features])
        print(f"\nfeatures={features}, masks={len(masks)}, n={REPEATS}")
        for name, samples in times.items():
            print(f"{name}: mean={statistics.mean(samples):.4f} ms, "
                  f"std={statistics.stdev(samples):.4f} ms, "
                  f"median={statistics.median(samples):.4f} ms")
            print(f"{name} raw samples (ms): {samples}")
        speedup = statistics.median(times["baseline"]) / statistics.median(times["serial_fusion"])
        print(f"median speedup: {speedup:.2f}x")
    assert hashlib.sha256(SOURCE.read_bytes()).hexdigest() == SOURCE_SHA256


if __name__ == "__main__":
    main()
