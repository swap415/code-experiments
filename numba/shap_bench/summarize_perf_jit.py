"""Compare symbol resolution of saved folded stacks, weighted by event period."""

from collections import Counter
from pathlib import Path
import re

from build_explainer import read_profile


def unresolved(frame):
    return frame.startswith("[") or bool(re.fullmatch(r"0x[0-9a-f]+", frame))


def summarize(path):
    rows = read_profile(path)
    total = sum(row["weight"] for row in rows)
    leaves = Counter()
    for row in rows:
        leaves[row["frames"][-1]] += row["weight"]
    missing_leaf = sum(weight for name, weight in leaves.items() if unresolved(name))
    missing_ancestor = sum(row["weight"] for row in rows
                           if any(map(unresolved, row["frames"][:-1])))
    print(f"{path.parent.name}/{path.name}: total cycle-event weight={total}")
    print(f"  unresolved leaf={missing_leaf / total:.4%}; "
          f"stack has unresolved ancestor={missing_ancestor / total:.4%}")
    for name, weight in leaves.most_common(5):
        print(f"  {weight / total:.4%} {name}")
    return total


if __name__ == "__main__":
    root = Path(__file__).with_name("perf-jit-2026-09-29")
    before = summarize(root / "original/raw.folded")
    after = summarize(root / "original/stacks.folded")
    assert before == after, "injection must preserve total event weight"
    summarize(root / "serial-fusion/stacks.folded")
    summarize(root / "original-source/stacks.folded")
