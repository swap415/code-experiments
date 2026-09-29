"""Embed the recorded folded stacks in a portable, offline explainer."""

import json
from pathlib import Path


def read_profile(path):
    stacks = []
    for line in path.read_text().splitlines():
        stack, weight = line.rsplit(" ", 1)
        stacks.append({"frames": stack.split(";"), "weight": int(weight)})
    return stacks


def main():
    directory = Path(__file__).resolve().parent
    data = {name: read_profile(directory / f"{name}.folded") for name in ("original", "optimized")}
    assert sum(row["weight"] for row in data["original"]) == 44609024343
    assert sum(row["weight"] for row in data["optimized"]) == 42514740819
    template = (directory / "explainer.template.html").read_text()
    assert template.count("__PROFILE_DATA__") == 1
    payload = json.dumps(data, separators=(",", ":")).replace("<", "\\u003c")
    target = directory / "explainer.html"
    target.write_text(template.replace("__PROFILE_DATA__", payload))
    print(f"Built {target.name}: {target.stat().st_size:,} bytes, {sum(map(len, data.values()))} recorded stacks")


if __name__ == "__main__":
    main()
