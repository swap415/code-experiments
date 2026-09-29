# The unknown JIT symbols, resolved

Open the interactive SVGs in a browser; click a frame to zoom, or use Search.

- [Original: resolved](original/flamegraph.svg)
- [Same original capture: before symbol injection](original/raw-flamegraph.svg)
- [Existing serial fusion: resolved](serial-fusion/flamegraph.svg)
- [Original: separate source-debug recording](original-source/flamegraph.svg)

## What changed

The same original recording contains **42,859,572,411 cycle-event weight**
before and after `perf inject --jit`:

| Measure | Before injection | After injection |
| --- | ---: | ---: |
| Unresolved leaf weight | 81.2944% | 0.0000% |
| Weight with an unresolved ancestor | 18.2556% | 5.7225% |

These are shares of sampled cycle-event periods, not fractions of literal
sample counts. Leaf and ancestor categories can overlap in general.
Absence of an unknown marker does **not** prove a complete call chain.

The original's newly resolved leaf hot spots:

| Function | Leaf cycle weight |
| --- | ---: |
| `NRT_decref` | 34.9672% |
| `NRT_incref` | 28.6129% |
| `_mask_delta_score` | 12.5826% |
| `_reverse_window_score_gain` | 4.6137% |

Reference-counting functions account for **63.58%** of sampled cycle weight.
Their [decrement](original/nrt-decref-asm.txt) and
[increment](original/nrt-incref-asm.txt) assembly contains `lock decq` and
`lock incq`. Most attributed instruction samples land immediately after those
operations. Ordinary cycle sampling can skid: this is evidence of hot reference
counting, not an exact per-instruction latency or proof of inter-thread contention.
The profile alone does not distinguish reference counts for the temporary from
those for input arrays or row views.

In the serial-fusion recording, `_reverse_window_score_gain` accounts for
91.8147%, and no `NRT_incref`/`NRT_decref` leaves were sampled. Both profiles
have 0% unresolved leaf weight. This does not imply the whole function performs
no allocation: its output array still allocates.

## Remaining limits

- LLVM's perf listener emits code-load and optional source-line records, but
  no jitdump unwind records. The original still has unresolved ancestors on
  5.7225% of cycle weight. Many JIT stacks also terminate early without an
  unknown marker. In particular, `python → NRT_decref` is **not** evidence that
  Python directly called that helper. Some recovered caller addresses may be
  unreliable. Trust resolved sampled PCs more than the reconstructed ancestry.
- The source-debug recording provides [source/assembly annotation](original-source/annotation.txt).
  Numba warns that source for its generated `__numba_array_expr_*` function
  cannot be found. Some locations are line 0 or approximate; this is not a
  complete inline-source reconstruction.
- `NUMBA_DEBUGINFO=1` inhibits LLVM-level inlining and changes performance.
  Keep that diagnostic separate from the `DEBUGINFO=0` profiles.
- These are new recordings of the hash-verified original SHAP code and the
  existing serial-fusion experiment. The older explainer used a different
  driver with forced helper inlining; it is preserved, not retroactively fixed.

## Recording and checks

Linux profiling host, i7-14700, pinned CPU 2. Python 3.12.3,
Numba 0.67.0, NumPy 2.5.3, LLVM 22.1.0, perf 6.8.12.
llvmlite `0.49.0dev0-98-gaecbe8f7`, exact
[PR #7](https://github.com/swap415/llvmlite/pull/7) head
`aecbe8f79dd56bb2752b0f55b02791b285ef8e97`, linked to the existing LLVM build
with `LLVM_USE_PERF=ON`. Loaded through `PYTHONPATH`; no existing installation
was replaced. [Numba PR #28](https://github.com/swap415/numba/pull/28) supplies
the workflow/docs/tests; its runtime hook already exists in this Numba version.

The two llvmlite capability/jitdump tests passed; see [test output](jit-tests.log).
The driver checks full output equality after warm-up and after the recording,
and verifies a runtime checksum. Perf events are enabled only after warm-up,
then disabled before final validation, with control-FIFO acknowledgements.
There can be tiny control/loop/Python bookkeeping costs inside that window.

| Recording | Samples | Lost | Warmed calls | Profiled ms/call |
| --- | ---: | ---: | ---: | ---: |
| Original, debug=0 | 4,057 | 0 | 27 | 300.861 |
| Serial fusion, debug=0 | 3,998 | 0 | 411 | 19.473 |
| Original, debug=1 | 4,238 | 0 | 17 | 499.392 |

Times are profiled run means, **not repeated-trial benchmark estimates**.
Logs and flat reports are in each profile's directory. The symbolic recording
has the same event totals before/after injection; the summarizer asserts this.

## Reproduce

Run on Linux, from `/tmp/shap-perf-jit.o4UxQr`, using a new output directory:

```bash
export PYTHONPATH=/tmp/shap-perf-jit.o4UxQr/llvmlite
bash record_perf_jit.sh original-repeat original 0
bash record_perf_jit.sh fusion-repeat serial_fusion 0
bash record_perf_jit.sh source-repeat original 1
```

[The recording script](../record_perf_jit.sh) runs, in part:

```bash
NUMBA_ENABLE_PROFILING=1 NUMBA_DEBUGINFO=0 JITDUMPDIR="$PWD/jitdump" \
perf record -k 1 -F 499 -e cycles:u -m 64M --call-graph dwarf,16384 \
  --delay=-1 --control=fifo:control,ack -o perf.data -- \
  taskset -c 2 /tmp/shap-bench-venv/bin/python -u ../perf_jit_driver.py \
  original --features 13 --seconds 8 --control control --ack ack
perf inject --jit -i perf.data -o perf.jit.data
perf script -i perf.jit.data | /tmp/FlameGraph/stackcollapse-perf.pl --all
```

Raw data, jitdump files, and synthetic ELF images remain on Linux under
`/tmp/shap-perf-jit.o4UxQr/{original-symbols-v2,fusion-symbols,original-source}`.
Keep those together for further `perf report`/`perf annotate` analysis.
The failed initial FIFO-protocol test remains in `original-symbols` for audit
and is **not** included in these results.

Recalculate resolution statistics locally:

```bash
shap/.venv/bin/python issues/shap_bench/summarize_perf_jit.py
```
