#!/usr/bin/env python3
"""Compare canonical audio-request CSV traces event by event.

Both inputs use the recompilation boundary schema:
``frame,event,type,id,member,arg0,arg1,arg2,result``. Frame numbers are ignored
by default because emulator and host capture can begin on different frames;
request order, audio type, IDs, arguments, and result classification remain
exact. Use ``--check-frame`` when both captures share the same frame origin.
"""

from __future__ import annotations

import argparse
import csv
import difflib
import sys
from pathlib import Path


FIELDS = ("frame", "event", "type", "id", "member", "arg0", "arg1",
          "arg2", "result")


def read_trace(path: Path, check_frame: bool = False) -> list[tuple[str, ...]]:
    """Read and normalize one trace, rejecting an incompatible schema."""
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream)
        if reader.fieldnames != list(FIELDS):
            raise ValueError(
                f"{path}: expected {','.join(FIELDS)}, got "
                f"{','.join(reader.fieldnames or [])}"
            )
        selected = FIELDS if check_frame else FIELDS[1:]
        return [tuple(row[field] for field in selected) for row in reader]


def format_rows(rows: list[tuple[str, ...]], check_frame: bool) -> list[str]:
    """Return stable comma-delimited rows for a compact unified diff."""
    fields = FIELDS if check_frame else FIELDS[1:]
    return [",".join(fields)] + [",".join(row) for row in rows]


def compare(reference: Path, candidate: Path, check_frame: bool = False) -> str:
    """Return an empty string on equality, otherwise a unified diff."""
    expected = format_rows(read_trace(reference, check_frame), check_frame)
    actual = format_rows(read_trace(candidate, check_frame), check_frame)
    if expected == actual:
        return ""
    return "\n".join(difflib.unified_diff(
        expected, actual, fromfile=str(reference), tofile=str(candidate),
        lineterm=""
    ))


def main() -> int:
    """Compare command-line trace paths and return nonzero on divergence."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("reference", type=Path, help="retail/reference CSV")
    parser.add_argument("candidate", type=Path, help="recomp candidate CSV")
    parser.add_argument(
        "--check-frame", action="store_true",
        help="require identical frame numbers as well as identical requests",
    )
    args = parser.parse_args()
    try:
        difference = compare(args.reference, args.candidate, args.check_frame)
    except (OSError, ValueError) as error:
        parser.error(str(error))
    if difference:
        print(difference)
        return 1
    print(f"audio traces match: {len(read_trace(args.reference))} events")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
