#!/usr/bin/env python3
"""Summarize and optionally enforce selected objdiff results."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPECTED_SECTIONS = (".text", ".rodata", ".data", ".bss")
EXPECTED_FUNCTIONS = (
    "init_genrand",
    "init_by_array",
    "genrand_int32",
    "InitRandom",
)


def find_match(entries: list[dict], name: str) -> dict:
    for entry in entries:
        if entry.get("name") == name and entry.get("match_percent") is not None:
            return entry
    raise ValueError(f"objdiff report is missing match data for {name}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--section", action="append", dest="sections")
    parser.add_argument("--function", action="append", dest="functions")
    parser.add_argument("--require-exact", action="store_true")
    args = parser.parse_args()

    sections = args.sections or EXPECTED_SECTIONS
    functions = args.functions or EXPECTED_FUNCTIONS

    report = json.loads(args.input.read_text(encoding="utf-8"))
    target = report["left"]
    current = report["right"]

    lines = [f"Objdiff report: {args.input.stem}", ""]
    exact = True

    lines.append("Sections:")
    for name in sections:
        entry = find_match(target["sections"], name)
        percent = float(entry["match_percent"])
        exact &= percent == 100.0
        lines.append(f"  {name:<8} {percent:10.6f}%  {int(entry['size']):4d} bytes")

    lines.extend(("", "Functions:"))
    for name in functions:
        target_entry = find_match(target["symbols"], name)
        current_entry = next(
            entry for entry in current["symbols"] if entry.get("name") == name
        )
        percent = float(target_entry["match_percent"])
        exact &= percent == 100.0
        lines.append(
            f"  {name:<16} {percent:10.6f}%  "
            f"target {int(target_entry['size']):3d} / current {int(current_entry['size']):3d} bytes"
        )

    lines.extend(("", f"Exact match: {'yes' if exact else 'no'}"))
    text = "\n".join(lines) + "\n"
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(text, encoding="utf-8", newline="\n")
    print(text, end="")

    if args.require_exact and not exact:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
