"""Summarize saved evidence; normalize sampled stack weights per completed call."""

from collections import Counter
import csv
import hashlib
import json
import math
from pathlib import Path
import re
import statistics


ROOT = Path(__file__).resolve().parent


def read_json(path):
    return json.loads((ROOT / path).read_text())


def unknown(frame):
    return frame.startswith("[") or bool(re.fullmatch(r"0x[0-9a-f]+(?:_\[[a-z]\])?", frame))


def canonical(frame):
    frame = re.sub(r"\b(?:original|optimized)_kernel::", "", frame)
    return re.sub(r"\[abi:[^]]*\]", "", frame)


profiles = {}
for variant in ("original", "optimized"):
    directory = ROOT / variant
    workload = read_json(f"{variant}/workload.json")
    leaves, normalized = Counter(), Counter()
    total = missing_leaf = missing_ancestor = 0
    for line in (directory / "stacks.folded").read_text().splitlines():
        stack, value = line.rsplit(" ", 1)
        weight, frames = int(value), stack.split(";")
        total += weight
        missing_leaf += weight * unknown(frames[-1])
        missing_ancestor += weight * any(map(unknown, frames[:-1]))
        leaves[canonical(frames[-1])] += weight
        normalized[";".join(map(canonical, frames))] += weight
    report = (directory / "report.txt").read_text()
    lost = int(re.search(r"Total Lost Samples: (\d+)", report)[1])
    assert total == int(re.search(r"Event count \(approx\.\): (\d+)", report)[1])
    samples = int(re.search(r"\((\d+) samples\)", (directory / "record.log").read_text())[1])
    per_call = {stack: round(weight / workload["iterations"])
                for stack, weight in normalized.items()}
    (directory / "per-call.folded").write_text("".join(
        f"{stack} {weight}\n" for stack, weight in sorted(per_call.items()) if weight))
    profiles[variant] = {
        "samples": samples, "lost_samples": lost, "cycle_period_weight": total,
        "workload": workload, "unresolved_leaf_percent": 100 * missing_leaf / total,
        "unresolved_ancestor_percent": 100 * missing_ancestor / total,
        "nrt_refcount_leaf_percent": 100 * sum(leaves[n] for n in ("NRT_incref", "NRT_decref")) / total,
        "top_leaves": [{"symbol": name, "percent": 100 * weight / total}
                       for name, weight in leaves.most_common(12)],
        "estimated_sampled_cycles_per_call": total / workload["iterations"],
    }

counters = {}
for variant in profiles:
    workload = read_json(f"{variant}-stat/workload.json")
    events = {}
    for row in csv.reader((ROOT / f"{variant}-stat/counters.csv").read_text().splitlines(), delimiter=";"):
        if len(row) < 5 or not row[0] or row[0].startswith("#"):
            continue
        name = row[2].split("/")[1].split(":")[0]
        events[name] = {"total": float(row[0]), "per_call": float(row[0]) / workload["iterations"],
                        "counter_running_percent": float(row[4])}
    assert set(events) == {"cycles", "instructions", "branches", "branch-misses"}
    counters[variant] = {"events": events, "workload": workload,
                         "ipc": events["instructions"]["total"] / events["cycles"]["total"]}

timings = {str(n): read_json(f"timing-{n}/timings.json") for n in (8, 13)}
hashes = {name: hashlib.sha256((ROOT / filename).read_bytes()).hexdigest()
          for name, filename in (("original", "original_numba_debug.py"), ("optimized", "optimized_numba.py"))}
for benchmark in timings.values():
    assert benchmark["source_sha256"] == hashes
    for stats in benchmark["timings"].values():
        assert math.isclose(stats["mean_ms"], statistics.mean(stats["raw_ms"]))
        assert math.isclose(stats["std_ms"], statistics.stdev(stats["raw_ms"]))
for name in ("original", "optimized", "original-stat", "optimized-stat", "timing-8", "timing-13"):
    env = read_json(f"{name}/env.json")
    assert env["source_sha256"] == hashes
    assert env["affinity"] == [2] and env["debuginfo"] == 0 and env["profiling"] == 1
for collection in (profiles, counters):
    for value in collection.values():
        assert value["workload"]["output_sha256"] == timings["13"]["output_sha256"]

inspection = {name: read_json(f"{name}/inspection.json") for name in profiles}
assert inspection["optimized"]["optimized_kernel._reverse_window_score_gain.0"]["native_nrt_calls"] == []
summary = {"timings": timings, "profiles": profiles, "counters": counters,
           "source_sha256": hashes, "native_inspection": inspection}
(ROOT / "comparison.json").write_text(json.dumps(summary, indent=2) + "\n")

print("ORIGINAL SHAP vs STANDALONE OPTIMIZED NUMBA\n")
print("Fresh Linux i7-14700 runs, CPU 2, seed=0, boolean inputs; source.diff contains the only kernel changes.")
print("NUMBA_ENABLE_PROFILING=1, NUMBA_DEBUGINFO=0 throughout. No compiler patch or forced inlining.")
print("No sampling during timing trials. Warm-up/equality checks precede timing and perf enable acknowledgements.\n")
print("WALL TIME: mean +/- sample std; milliseconds; n=10, alternating variant order")
for features, benchmark in timings.items():
    print(f"  {2**int(features)} masks x {features} features:")
    for name, stats in benchmark["timings"].items():
        print(f"    {name:10} {stats['mean_ms']:.4f} +/- {stats['std_ms']:.4f}; median {stats['median_ms']:.4f}")
    print(f"    median speedup: {benchmark['median_speedup']:.4f}x")
print("\nHARDWARE COUNTERS PER CALL: separate 8-second gated perf stat runs")
print("  event                      original           optimized      original/optimized")
for event in ("cycles", "instructions", "branches", "branch-misses"):
    a, b = (counters[name]["events"][event]["per_call"] for name in profiles)
    print(f"  {event:18} {a:19,.2f} {b:19,.2f} {a/b:14.4f}x")
for name, values in counters.items():
    print(f"  {name}: IPC={values['ipc']:.4f}; calls={values['workload']['iterations']}; "
          f"counter running percentages={[v['counter_running_percent'] for v in values['events'].values()]}")
print("\nRUNTIME SAMPLES: shares use cycle-event periods, not literal sample counts")
for name, profile in profiles.items():
    print(f"  {name}: samples={profile['samples']}; lost={profile['lost_samples']}; "
          f"calls={profile['workload']['iterations']}")
    print(f"    unresolved leaf={profile['unresolved_leaf_percent']:.4f}%; "
          f"unresolved ancestor={profile['unresolved_ancestor_percent']:.4f}%")
    print(f"    NRT_incref + NRT_decref leaf weight={profile['nrt_refcount_leaf_percent']:.4f}%")
    for leaf in profile["top_leaves"][:6]:
        print(f"    {leaf['percent']:8.4f}% {leaf['symbol']}")
print("\nNATIVE LLVM: static NRT call sites (not execution counts)")
for name, functions in inspection.items():
    for function, details in functions.items():
        print(f"  {function}: {dict(Counter(details['native_nrt_calls']))}")
print("\nCORRECTNESS: verification/checks.json; 588 exact-order/input cases + 16 signed-gain cases.")
print("All benchmark/profile/counter outputs match; source and output hashes are in JSON evidence.")
print("\nREADING THE DIFFERENTIAL FLAMEGRAPHS")
print("Weights are estimated sampled cycles per completed call, rounded to integers; no total-share normalization.")
print("Only original_kernel/optimized_kernel prefixes and compiler ABI tags are stripped to align names.")
print("diff-before.svg uses original widths; diff-after.svg uses optimized widths. Blue=less, red=more attributed cost.")
print("Inlining changes attribution: red can mean work moved into a caller, not a regression. Widths auto-scale between files.")
print("Folded stacks expand inline frames; flat perf report may group that code under the enclosing symbol, so leaf shares can differ.")
print("\nLIMITATIONS")
print("JIT leaf symbols resolve well, but missing unwind records can truncate or corrupt caller chains.")
print("Zero unknown markers does not prove complete stacks. A tiny unresolved leaf is reported, not discarded.")
print("The optimized scoring helper has no native NRT calls; the entry point still allocates its output array.")
print("No sampled refcount leaves does not prove zero refcounts. Original refcounts need not all belong to XOR temporaries.")
print("Ordinary cycles sampling can skid; assembly percentages are not precise instruction latencies.")
print("Each hardware-counter result is one gated run, not a repeated-trial estimate. Governor remains powersave.")
print("Raw perf data requires Linux and matching binary/source paths; jitdump ELF files retain their original paths.")
