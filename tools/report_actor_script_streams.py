#!/usr/bin/env python3
"""Report constant streamed-audio commands embedded in actor script bytecode.

The actor VM expresses a stream start as six constant pushes followed by the
two-byte actor-method dispatch ``15 62``. Selector 32 is the stream-start
command; its first operand is the stream ID. This report deliberately reads
extracted build artifacts and never copies game data into the repository.
"""

from __future__ import annotations

import argparse
import csv
import struct
import sys
from pathlib import Path
from typing import Iterator, NamedTuple, TextIO


class StreamCommand(NamedTuple):
    offset: int
    stream_id: int
    start_units: int
    volume: int
    fade_frames: int
    fade_in: int


def read_constant_push(data: bytes, offset: int) -> tuple[int, int] | None:
    """Decode one constant-push instruction as (value, encoded byte count)."""
    opcode = data[offset]
    if opcode == 0x39:
        return 0, 1
    if opcode == 0x20 and offset + 3 <= len(data):
        return struct.unpack_from("<h", data, offset + 1)[0], 3
    if opcode == 0x2C and offset + 5 <= len(data):
        return struct.unpack_from("<I", data, offset + 1)[0], 5
    return None


def find_stream_commands(data: bytes) -> Iterator[StreamCommand]:
    """Yield constant selector-32 stream starts found in one binary image."""
    for start in range(len(data)):
        offset = start
        values: list[int] = []
        for _ in range(6):
            if offset >= len(data):
                break
            decoded = read_constant_push(data, offset)
            if decoded is None:
                break
            value, size = decoded
            values.append(value)
            offset += size
        if (
            len(values) == 6
            and values[0] == 32
            and data[offset : offset + 2] == b"\x15\x62"
        ):
            yield StreamCommand(start, *values[1:])


def binary_files(root: Path) -> Iterator[Path]:
    """Yield overlay binaries from a directory, or a single requested file."""
    if root.is_file():
        yield root
        return
    yield from sorted(root.glob("ov*.bin"))


def write_report(
    output: TextIO, root: Path, stream_filter: int | None
) -> int:
    """Write CSV rows to output and return the number of matching commands."""
    writer = csv.writer(output)
    writer.writerow(
        ("binary", "offset", "stream_id", "start_units", "volume", "fade_frames", "fade_in")
    )
    count = 0
    for path in binary_files(root):
        for command in find_stream_commands(path.read_bytes()):
            if stream_filter is not None and command.stream_id != stream_filter:
                continue
            writer.writerow((path.name, f"0x{command.offset:x}", *command[1:]))
            count += 1
    return count


def main() -> int:
    """Parse command-line arguments and emit the actor-script stream report."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "path",
        nargs="?",
        type=Path,
        default=Path("build/source-rom/arm9_overlays"),
        help="overlay-binary directory or one binary file",
    )
    parser.add_argument("--stream", type=int, help="only report this stream ID")
    args = parser.parse_args()
    if not args.path.exists():
        parser.error(f"path does not exist: {args.path}")
    write_report(sys.stdout, args.path, args.stream)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
