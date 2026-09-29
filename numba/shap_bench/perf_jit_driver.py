"""Profile warmed, unchanged SHAP kernels with perf's control/ack FIFOs.

Run perf with --delay=-1 --control=fifo:CONTROL,ACK and pass the same paths
here. --ungated is for smoke tests, not runtime-only perf recordings.
"""

import argparse
from contextlib import contextmanager
import os
import platform
import select
import time

import llvmlite
from llvmlite import binding as llvm
import numba
import numpy as np

from bench_compiler_fusion import SOURCE_SHA256, compile_serial_score, load_kernels


@contextmanager
def perf_events(control, ack):
    if control is None:
        yield
        return
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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("original", "serial_fusion"))
    parser.add_argument("--features", type=int, default=13)
    parser.add_argument("--seconds", type=float, default=8)
    gating = parser.add_mutually_exclusive_group(required=True)
    gating.add_argument("--control")
    gating.add_argument("--ungated", action="store_true")
    parser.add_argument("--ack")
    args = parser.parse_args()
    if bool(args.control) != bool(args.ack):
        parser.error("--control and --ack must be supplied together")
    if args.features < 1 or args.seconds <= 0:
        parser.error("--features and --seconds must be positive")

    print(f"Python {platform.python_version()} | {platform.platform()}")
    print(f"NumPy {np.__version__} | Numba {numba.__version__} | "
          f"llvmlite {llvmlite.__version__} | LLVM {llvm.llvm_version_info}")
    print(f"Numba: {numba.__file__}\nllvmlite: {llvmlite.__file__}")
    print(f"profiling={numba.config.ENABLE_PROFILING} "
          f"debuginfo={numba.config.DEBUGINFO_DEFAULT} "
          f"has_perf_jit_events={getattr(llvm, 'has_perf_jit_events', 'unavailable')}")
    print(f"Original source SHA256: {SOURCE_SHA256}")
    masks = np.random.default_rng(0).integers(
        0, 2, (2**args.features, args.features)).astype(np.bool_)
    original = load_kernels()
    expected = original["_delta_minimization_order"](masks)
    kernels = original
    if args.mode == "serial_fusion":
        kernels = load_kernels()
        kernels["_mask_delta_score"] = compile_serial_score(
            kernels["_mask_delta_score"], masks[0], masks[1])
    function = kernels["_delta_minimization_order"]
    np.testing.assert_array_equal(function(masks), expected)
    np.testing.assert_array_equal(np.sort(expected), np.arange(len(masks)))
    print(f"warm/check complete: pid={os.getpid()} mode={args.mode} "
          f"features={args.features} masks={len(masks)}", flush=True)

    iterations = 0
    checksum = 0
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
    assert checksum == iterations * (int(expected[0]) + int(expected[-1]))
    print(f"mode={args.mode} elapsed={elapsed:.3f}s iterations={iterations} "
          f"checksum={checksum} mean={elapsed / iterations * 1000:.3f}ms "
          "(profiling throughput, not a repeated-trial benchmark)", flush=True)


if __name__ == "__main__":
    main()
