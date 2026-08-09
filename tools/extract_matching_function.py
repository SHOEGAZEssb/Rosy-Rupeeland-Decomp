#!/usr/bin/env python3
"""Extract one documented matching fallback from an analysis assembly file."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


SYMBOL_RE = re.compile(
    r"\b(?:func_[A-Za-z0-9_]+|data_[A-Za-z0-9_]+|g[A-Z][A-Za-z0-9_]*|"
    r"Heap_Alloc|Heap_Free|GameWork_TestFlag|Sound_Play|__[A-Za-z0-9_]+)\b"
)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("function")
    parser.add_argument("--portable", required=True)
    args = parser.parse_args()

    lines = args.input.read_text(encoding="utf-8").splitlines()
    start_marker = f"    arm_func_start {args.function}"
    end_marker = f"    arm_func_end {args.function}"
    try:
        start = lines.index(start_marker)
        end = lines.index(end_marker, start + 1)
    except ValueError as error:
        parser.error(f"could not find complete function {args.function}: {error}")

    body = lines[start + 1 : end]
    body = [line.split(";", 1)[0].rstrip() for line in body]
    defined = {
        match.group(1)
        for line in body
        if (match := re.match(r"^([A-Za-z_.$][A-Za-z0-9_.$]*):", line.strip()))
    }
    referenced = set(SYMBOL_RE.findall("\n".join(body)))
    referenced.update(
        match.group(1)
        for line in body
        if (match := re.search(r"\bblx?\s+([A-Za-z_][A-Za-z0-9_]*)", line))
    )
    registers = {f"r{index}" for index in range(16)} | {"sp", "lr", "pc", "ip"}
    externs = sorted(referenced - defined - registers - {args.function})

    output = [
        ".text",
        f"; Matching fallback for the portable implementation in {args.portable}.",
    ]
    output.extend(f".extern {symbol}" for symbol in externs)
    output.append("")
    output.append(f".global {args.function}")
    output.extend(body)
    output.append(f".size {args.function}, . - {args.function}")
    output.append("")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(output), encoding="utf-8", newline="\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
