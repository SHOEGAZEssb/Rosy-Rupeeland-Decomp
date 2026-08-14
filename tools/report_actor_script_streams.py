#!/usr/bin/env python3
"""Report streamed-audio dispatches embedded in actor script bytecode.

The actor VM expresses a stream start as six constant pushes followed by the
two-byte actor-method dispatch ``15 62``. Selector 32 is the stream-start
command; its first operand is the stream ID. Scripts may also build those stack
operands through registers, context slots, or branches. Those dispatches are
reported as unresolved instead of being silently omitted. This report
deliberately reads extracted build artifacts and never copies game data into
the repository.
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


class StreamRequest(NamedTuple):
    command_offset: int | None
    dispatch_offset: int
    kind: str
    stream_id: str | None
    stream_id_constant: int | None
    start_units: str | None
    volume: str | None
    fade_frames: str | None
    fade_in: str | None


class StackPush(NamedTuple):
    expression: str
    constant: int | None
    size: int


def read_constant_push(data: bytes, offset: int) -> tuple[int, int] | None:
    """Decode one constant-push instruction as (value, encoded byte count)."""
    if offset >= len(data):
        return None
    opcode = data[offset]
    if opcode == 0x39:
        return 0, 1
    if opcode == 0x20 and offset + 3 <= len(data):
        return struct.unpack_from("<h", data, offset + 1)[0], 3
    if opcode == 0x2C and offset + 5 <= len(data):
        return struct.unpack_from("<I", data, offset + 1)[0], 5
    return None


def read_stack_push(data: bytes, offset: int) -> StackPush | None:
    """Decode one stack-producing instruction without evaluating runtime data."""
    decoded = read_constant_push(data, offset)
    if decoded is not None:
        value, size = decoded
        return StackPush(str(value), value, size)
    if offset + 2 > len(data):
        return None
    opcode = data[offset]
    operand = data[offset + 1]
    expressions = {
        0x17: f"register[{(operand >> 4) & 7}]",
        0x2D: f"gamework_halfword[{operand}]",
        0x2E: f"context[{operand}]",
        0x2F: f"callback[{operand}]",
        0x38: f"gamework_word[{operand}]",
    }
    expression = expressions.get(opcode)
    return None if expression is None else StackPush(expression, None, 2)


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


def find_stream_requests(data: bytes) -> Iterator[StreamRequest]:
    """Yield decoded starts plus every otherwise-unclassified byte pattern."""
    by_dispatch: dict[int, StreamRequest] = {}
    for start in range(len(data)):
        offset = start
        operands: list[StackPush] = []
        for _ in range(6):
            decoded = read_stack_push(data, offset)
            if decoded is None:
                break
            operands.append(decoded)
            offset += decoded.size
        if (len(operands) != 6 or data[offset:offset + 2] != b"\x15\x62"):
            continue
        selector = operands[0]
        if selector.constant is not None and selector.constant != 32:
            continue
        values = operands[1:]
        kind = "constant" if all(value.constant is not None for value in values) else "symbolic"
        by_dispatch[offset] = StreamRequest(
            start,
            offset,
            kind,
            values[0].expression,
            values[0].constant,
            values[1].expression,
            values[2].expression,
            values[3].expression,
            values[4].expression,
        )

    search_offset = 0
    while True:
        dispatch = data.find(b"\x15\x62", search_offset)
        if dispatch < 0:
            return
        command = by_dispatch.get(dispatch)
        if command is not None:
            yield command
        else:
            yield StreamRequest(
                None, dispatch, "byte_pattern", None, None, None, None, None, None
            )
        search_offset = dispatch + 1


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
    writer.writerow((
        "binary", "kind", "command_offset", "dispatch_offset", "stream_id",
        "start_units", "volume", "fade_frames", "fade_in"
    ))
    count = 0
    for path in binary_files(root):
        for request in find_stream_requests(path.read_bytes()):
            if (stream_filter is not None and request.stream_id_constant is not None
                    and request.stream_id_constant != stream_filter):
                continue
            writer.writerow((
                path.name,
                request.kind,
                "" if request.command_offset is None else f"0x{request.command_offset:x}",
                f"0x{request.dispatch_offset:x}",
                "" if request.stream_id is None else request.stream_id,
                "" if request.start_units is None else request.start_units,
                "" if request.volume is None else request.volume,
                "" if request.fade_frames is None else request.fade_frames,
                "" if request.fade_in is None else request.fade_in,
            ))
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
    parser.add_argument(
        "--stream",
        type=int,
        help=(
            "report this constant stream ID plus symbolic requests and "
            "unclassified 15 62 byte patterns that could conceal it"
        ),
    )
    args = parser.parse_args()
    if not args.path.exists():
        parser.error(f"path does not exist: {args.path}")
    write_report(sys.stdout, args.path, args.stream)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
