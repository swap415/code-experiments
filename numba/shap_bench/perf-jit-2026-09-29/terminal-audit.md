# Local profile audit commands

Machine identifiers and home paths are redacted in this repository copy.

These are the eight local shell invocations used to audit the saved profiles,
in execution order. They were read-only; no Python snippets, remote commands,
or profiling runs were executed by this audit. This transcript records commands,
not their output. The commands have not been rerun to produce this document.

Every invocation used this working directory:

```text
<numba-checkout>
```

## 1. List saved artifacts

```sh
rg --files issues/shap_bench/perf-jit-2026-09-29
```

## 2. Read original report and reference-count assembly

```sh
sed -n '1,90p' issues/shap_bench/perf-jit-2026-09-29/original/report.txt
sed -n '1,140p' issues/shap_bench/perf-jit-2026-09-29/original/nrt-incref-asm.txt
sed -n '1,140p' issues/shap_bench/perf-jit-2026-09-29/original/nrt-decref-asm.txt
```

## 3. Inspect folded-stack examples and workload metadata

```sh
sed -n '1,8p' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded
sed -n '1,8p' issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
sed -n '1,70p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/report.txt
sed -n '1,90p' issues/shap_bench/perf-jit-2026-09-29/original/workload.log
```

## 4. Initial unresolved-frame count

This initial script stops scanning after encountering an unresolved ancestor,
so it would miss an unresolved leaf on the same stack. Invocation 6 corrects
that. These files had no such overlap, so the reported totals were unchanged.

```sh
awk '
function unresolved(frame) { return frame ~ /^\[(perf-[0-9]+\.map|unknown|anon)\](_\[[jk]\])?$/ || frame ~ /^\[\[stack\]\](_\[[jk]\])?$/ }
FNR == 1 { if (NR > 1) summarize(); total=leaf=ancestor=any=rows=0; name=FILENAME }
function summarize() { printf "%s\nrows=%d total=%.0f unresolved_leaf=%.0f (%.6f%%) unresolved_ancestor=%.0f (%.6f%%) any_unresolved=%.0f (%.6f%%)\n", name, rows, total, leaf, 100*leaf/total, ancestor, 100*ancestor/total, any, 100*any/total }
{ weight=$NF; line=$0; sub(/ [0-9]+$/, "", line); n=split(line,frames,";"); total+=weight; rows++; has=0; for(i=1;i<=n;i++) if(unresolved(frames[i])) {has=1; if(i==n) leaf+=weight; else {ancestor+=weight; break}}; if(has) any+=weight }
END { summarize() }
' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded issues/shap_bench/perf-jit-2026-09-29/serial-fusion/stacks.folded issues/shap_bench/perf-jit-2026-09-29/original-source/stacks.folded
```

## 5. Read recording and workload logs

```sh
sed -n '1,100p' issues/shap_bench/perf-jit-2026-09-29/original/record.log
sed -n '1,100p' issues/shap_bench/perf-jit-2026-09-29/original/inject.log
sed -n '1,60p' issues/shap_bench/perf-jit-2026-09-29/original-source/workload.log
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/workload.log
```

## 6. Corrected counts and placeholder inventory

This counts unresolved leaves and ancestors independently, including their
overlap, then lists the bracketed placeholder frames found in both files.

```sh
awk '
function unresolved(frame) { return frame ~ /^\[(perf-[0-9]+\.map|unknown|anon)\](_\[[jk]\])?$/ || frame ~ /^\[\[stack\]\](_\[[jk]\])?$/ }
function summarize() { printf "%s\nrows=%d total=%.0f leaf=%.0f (%.6f%%) ancestor=%.0f (%.6f%%) any=%.0f (%.6f%%) both=%.0f\n", name, rows,total,leaf,100*leaf/total,ancestor,100*ancestor/total,any,100*any/total,both }
FNR == 1 { if (NR > 1) summarize(); total=leaf=ancestor=any=both=rows=0; name=FILENAME }
{ weight=$NF; line=$0; sub(/ [0-9]+$/, "", line); n=split(line,frames,";"); total+=weight; rows++; l=unresolved(frames[n]); a=0; for(i=1;i<n;i++) if(unresolved(frames[i])) a=1; leaf+=weight*l; ancestor+=weight*a; if(l||a)any+=weight; if(l&&a)both+=weight }
END { summarize() }
' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
awk '{ line=$0; sub(/ [0-9]+$/, "", line); n=split(line,f,";"); for(i=1;i<=n;i++) if(f[i] ~ /^\[/) found[f[i]]=1} END {for(k in found)print k}' issues/shap_bench/perf-jit-2026-09-29/original/raw.folded issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
```

## 7. Inspect resolved stacks and source annotation

```sh
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/original/stacks.folded
sed -n '1,50p' issues/shap_bench/perf-jit-2026-09-29/original-source/report.txt
sed -n '1,120p' issues/shap_bench/perf-jit-2026-09-29/original-source/annotation.txt
```

## 8. Check errors, calculate shares, and inspect fusion stacks

```sh
wc -c issues/shap_bench/perf-jit-2026-09-29/original/*log
awk 'BEGIN { printf "NRT self share %.9f%%\n",100*(14986776686+12263349025)/42859572411; printf "profile throughput ratio %.6fx\n",300.861/19.473 }'
sed -n '1,50p' issues/shap_bench/perf-jit-2026-09-29/original/raw-errors.log
sed -n '1,60p' issues/shap_bench/perf-jit-2026-09-29/original/annotate-errors.log
sed -n '1,45p' issues/shap_bench/perf-jit-2026-09-29/serial-fusion/stacks.folded
```
