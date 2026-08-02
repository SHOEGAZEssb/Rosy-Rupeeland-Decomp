#!/usr/bin/env python3
"""Extract and verify an address range from a flat loaded binary."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


def integer(value: str) -> int:
    return int(value, 0)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--base-address", type=integer, required=True)
    parser.add_argument("--start", type=integer, required=True)
    parser.add_argument("--end", type=integer, required=True)
    parser.add_argument("--sha256")
    args = parser.parse_args()

    if args.end <= args.start:
        parser.error("--end must be greater than --start")

    data = args.input.read_bytes()
    start = args.start - args.base_address
    end = args.end - args.base_address
    if start < 0 or end > len(data):
        parser.error(
            f"range 0x{args.start:08x}-0x{args.end:08x} is outside "
            f"{args.input} loaded at 0x{args.base_address:08x}"
        )

    output = data[start:end]
    actual_sha256 = hashlib.sha256(output).hexdigest().upper()
    if args.sha256 and actual_sha256 != args.sha256.upper():
        parser.error(
            f"unexpected slice SHA-256: {actual_sha256} "
            f"(expected {args.sha256.upper()})"
        )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(output)
    print(
        f"{args.output}: 0x{len(output):x} bytes, "
        f"SHA-256 {actual_sha256}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
