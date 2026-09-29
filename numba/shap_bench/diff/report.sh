#!/usr/bin/env bash
set -euxo pipefail
cd -- "$(dirname -- "$0")"
python=${SHAP_PERF_PYTHON:-/tmp/shap-bench-venv/bin/python}
flamegraph=${SHAP_FLAMEGRAPH:-/tmp/FlameGraph}
"$python" analyze.py > comparison.txt
"$flamegraph/difffolded.pl" original/per-call.folded optimized/per-call.folded > diff-after.folded
"$flamegraph/flamegraph.pl" --title "SHAP diff | estimated cycles per call | AFTER widths" \
    --countname "estimated cycles/call" diff-after.folded > diff-after.svg
"$flamegraph/difffolded.pl" optimized/per-call.folded original/per-call.folded > diff-before.folded
"$flamegraph/flamegraph.pl" --negate --title "SHAP diff | estimated cycles per call | BEFORE widths" \
    --countname "estimated cycles/call" diff-before.folded > diff-before.svg
