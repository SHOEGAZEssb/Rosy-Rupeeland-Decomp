#!/usr/bin/env python3
"""Extract documented initialized-data assembly while retaining BSS symbols."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--portable", required=True)
    parser.add_argument("--binary", type=Path)
    parser.add_argument("--base", type=lambda value: int(value, 0))
    args = parser.parse_args()

    lines = args.input.read_text().splitlines()
    data_start = next(i for i, line in enumerate(lines) if line.startswith("    .section .data"))
    bss_start = next((i for i in range(data_start, len(lines)) if lines[i].startswith("    .section .bss")), len(lines))
    data_lines = lines[data_start:bss_start]
    # MWASMARM aligns symbolic .word directives even when the recovered record
    # stores an intentionally unaligned pointer. Address-derived symbols make
    # the original little-endian bytes explicit without introducing padding.
    for i, line in enumerate(data_lines):
        match = re.match(r"(\s*)\.word\s+[A-Za-z_][A-Za-z0-9_]*_([0-9a-fA-F]{8})\s*$", line)
        if match:
            value = int(match.group(2), 16)
            encoded = ", ".join(f"0x{byte:02x}" for byte in value.to_bytes(4, "little"))
            data_lines[i] = f"{match.group(1)}.byte {encoded}"
    bss_lines = lines[bss_start + 1 :] if bss_start < len(lines) else []

    label_pattern = re.compile(r"^(data_[A-Za-z0-9_]+):")
    word_pattern = re.compile(r"\.word\s+([A-Za-z_][A-Za-z0-9_]*)")
    defined = {match.group(1) for line in data_lines for match in [label_pattern.match(line)] if match}
    bss = []
    for line in bss_lines:
        match = re.match(r"^(data_[A-Za-z0-9_]+):\s*\.space\s+", line)
        if match:
            bss.append(match.group(1))
    referenced = {match.group(1) for line in data_lines for match in word_pattern.finditer(line)}

    output = [
        "; Matching fallback for initialized records and BSS documented in",
        f"; {args.portable}.",
    ]
    if args.binary is not None:
        if args.base is None:
            parser.error("--base is required with --binary")
        first_address = int(next(iter(sorted(defined))).rsplit("_", 1)[1], 16)
        end_address = int(bss[0].rsplit("_", 1)[1], 16)
        payload = args.binary.read_bytes()[first_address - args.base : end_address - args.base]
        output.append("; Absolute labels preserve fixed-address record and BSS references without alignment padding.")
        for symbol in sorted(defined):
            output.extend([f".global {symbol}", f".set {symbol}, 0x{symbol.rsplit('_', 1)[1]}"])
        for symbol in bss:
            output.extend([f".global {symbol}", f".set {symbol}, 0x{symbol.rsplit('_', 1)[1]}"])
        output.append("    .section .data, 4, 1, 4")
        for offset in range(0, len(payload), 16):
            encoded = ", ".join(f"0x{byte:02x}" for byte in payload[offset : offset + 16])
            output.append(f"    .byte {encoded}")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text("\n".join(output) + "\n")
        return
    for symbol in bss:
        output.extend([f".global {symbol}", f".set {symbol}, 0x{symbol.rsplit('_', 1)[1]}"])
    if bss:
        output.insert(2, "; Absolute BSS addresses retain link references without emitting zero bytes into ROM.")
    output.extend(f".extern {symbol}" for symbol in sorted(referenced - defined - set(bss)))
    output.extend(f".global {symbol}" for symbol in sorted(defined))
    output.extend(data_lines)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(output) + "\n")


if __name__ == "__main__":
    main()
