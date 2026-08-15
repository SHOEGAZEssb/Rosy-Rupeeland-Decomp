#!/usr/bin/env python3
"""Report streamed-audio dispatches embedded in actor script bytecode.

The actor VM has two stream-start forms. High-arity selector 32 pushes five
playback parameters before the known ``15 62`` actor-method dispatch. Sound
selector 6 pushes a stream ID before an actor-method dispatch and starts it at
offset zero and full volume; selector 7 stops the sole stream with its operand
as the fade duration. Actor-method indices vary with the actor class, so the
short forms are reported as structural candidates and include their dispatch
method byte rather than being silently omitted. Scripts may also build stack
operands through registers, context slots, or branches, which remain symbolic.
This report deliberately reads extracted build artifacts and never copies game
data into the repository.
"""

from __future__ import annotations

import argparse
import csv
import re
import struct
import sys
from pathlib import Path
from typing import Iterator, NamedTuple, TextIO


def read_u32(data: bytes, offset: int) -> int | None:
    """Read one little-endian word, returning None outside the input."""
    if offset < 0 or offset + 4 > len(data):
        return None
    return struct.unpack_from("<I", data, offset)[0]


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


class ShortStreamRequest(NamedTuple):
    command_offset: int
    dispatch_offset: int
    dispatch_method: int
    operation: str
    operand: str
    operand_constant: int | None


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


def find_short_stream_requests(data: bytes) -> Iterator[ShortStreamRequest]:
    """Yield adjacent command-6 starts and command-7 fades/stops.

    Opcode 0x15 dispatches through an actor-class method table, so its following
    byte is retained as evidence rather than treated as a global function ID.
    """
    for start in range(len(data)):
        command = read_stack_push(data, start)
        if command is None or command.constant not in (6, 7):
            continue
        operand_offset = start + command.size
        operand = read_stack_push(data, operand_offset)
        if operand is None:
            continue
        dispatch = operand_offset + operand.size
        if dispatch + 2 > len(data) or data[dispatch] != 0x15:
            continue
        yield ShortStreamRequest(
            start,
            dispatch,
            data[dispatch + 1],
            "start_default" if command.constant == 6 else "stop_fade",
            operand.expression,
            operand.constant,
        )


SYMBOL_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:\S+.*\saddr:0x(?P<address>[0-9a-fA-F]+)"
)


class SymbolResolver:
    """Resolve extracted binary offsets to the nearest configured symbol."""

    def __init__(self, binary: Path, config_root: Path):
        if binary.name == "arm9.bin":
            symbol_path = config_root / "symbols.txt"
            self.base = 0x02000000
        else:
            overlay = binary.stem
            symbol_path = config_root / "overlays" / overlay / "symbols.txt"
            self.base = 0
        self.symbols: list[tuple[int, str]] = []
        if symbol_path.exists():
            for line in symbol_path.read_text(encoding="utf-8").splitlines():
                match = SYMBOL_RE.match(line)
                if match is not None:
                    self.symbols.append((
                        int(match.group("address"), 16), match.group("name")
                    ))
            self.symbols.sort()
            if self.base == 0 and self.symbols:
                self.base = self.symbols[0][0]

    def describe(self, offset: int) -> tuple[str, str]:
        """Return runtime address and nearest symbol-plus-displacement."""
        address = self.base + offset
        nearest: tuple[int, str] | None = None
        for symbol in self.symbols:
            if symbol[0] > address:
                break
            nearest = symbol
        if nearest is None:
            return f"0x{address:08x}", ""
        displacement = address - nearest[0]
        description = nearest[1]
        if displacement:
            description += f"+0x{displacement:x}"
        return f"0x{address:08x}", description


class SdatStreamCatalog:
    """Read valid STRM slots and optional names from an extracted SDAT."""

    def __init__(self, path: Path | None):
        self.names: dict[int, str] = {}
        self.valid_ids: set[int] | None = None
        if path is None or not path.exists():
            return
        data = path.read_bytes()
        if data[:4] != b"SDAT":
            raise ValueError(f"not an SDAT archive: {path}")
        info = read_u32(data, 0x18)
        symb = read_u32(data, 0x10)
        if info is None or info + 40 > len(data) or data[info:info + 4] != b"INFO":
            raise ValueError(f"SDAT has no valid INFO block: {path}")
        table_rel = read_u32(data, info + 8 + 7 * 4)
        if table_rel is None:
            raise ValueError(f"SDAT has no STRM table: {path}")
        table = info + table_rel
        count = read_u32(data, table)
        if count is None or table + 4 + count * 4 > len(data):
            raise ValueError(f"SDAT has a malformed STRM table: {path}")
        self.valid_ids = {
            index for index in range(count)
            if read_u32(data, table + 4 + index * 4) not in (None, 0)
        }
        if (symb is None or symb + 40 > len(data) or
                data[symb:symb + 4] != b"SYMB"):
            return
        name_table_rel = read_u32(data, symb + 8 + 7 * 4)
        if name_table_rel is None:
            return
        name_table = symb + name_table_rel
        name_count = read_u32(data, name_table)
        if name_count is None or name_table + 4 + name_count * 4 > len(data):
            return
        for index in range(name_count):
            name_rel = read_u32(data, name_table + 4 + index * 4)
            if name_rel in (None, 0) or symb + name_rel >= len(data):
                continue
            end = data.find(b"\0", symb + name_rel)
            if end < 0:
                continue
            self.names[index] = data[symb + name_rel:end].decode(
                "ascii", errors="replace"
            )

    def contains(self, stream_id: int | None) -> bool:
        """Accept symbolic IDs or IDs present in the archive's INFO table."""
        return (stream_id is None or self.valid_ids is None or
                stream_id in self.valid_ids)

    def name(self, stream_id: int | None) -> str:
        """Return the SYMB name, falling back to a stable decimal label."""
        if stream_id is None:
            return ""
        return self.names.get(stream_id, f"STRM_{stream_id}")


def binary_files(root: Path) -> Iterator[Path]:
    """Yield overlay binaries from a directory, or a single requested file."""
    if root.is_file():
        yield root
        return
    yield from sorted(root.glob("ov*.bin"))


def write_report(
    output: TextIO, root: Path, stream_filter: int | None,
    config_root: Path, catalog: SdatStreamCatalog
) -> int:
    """Write CSV rows to output and return the number of matching commands."""
    writer = csv.writer(output)
    writer.writerow((
        "binary", "operation", "confidence", "kind", "command_offset",
        "dispatch_offset", "dispatch_method", "source_address",
        "source_symbol", "stream_id", "stream_name", "start_units",
        "volume", "fade_frames", "fade_in"
    ))
    count = 0
    for path in binary_files(root):
        resolver = SymbolResolver(path, config_root)
        for request in find_stream_requests(path.read_bytes()):
            if not catalog.contains(request.stream_id_constant):
                continue
            if (stream_filter is not None and request.stream_id_constant is not None
                    and request.stream_id_constant != stream_filter):
                continue
            address, symbol = resolver.describe(request.command_offset
                                                 if request.command_offset is not None
                                                 else request.dispatch_offset)
            writer.writerow((
                path.name, "start_parameters", "verified_dispatch",
                request.kind,
                "" if request.command_offset is None else f"0x{request.command_offset:x}",
                f"0x{request.dispatch_offset:x}",
                "0x62", address, symbol,
                "" if request.stream_id is None else request.stream_id,
                catalog.name(request.stream_id_constant),
                "" if request.start_units is None else request.start_units,
                "" if request.volume is None else request.volume,
                "" if request.fade_frames is None else request.fade_frames,
                "" if request.fade_in is None else request.fade_in,
            ))
            count += 1
        for request in find_short_stream_requests(path.read_bytes()):
            if (request.operation == "start_default" and
                    not catalog.contains(request.operand_constant)):
                continue
            if (stream_filter is not None and
                    (request.operation != "start_default" or
                     (request.operand_constant is not None and
                      request.operand_constant != stream_filter))):
                continue
            address, symbol = resolver.describe(request.command_offset)
            stream_id = request.operand if request.operation == "start_default" else ""
            stream_name = (catalog.name(request.operand_constant)
                           if request.operation == "start_default" else "")
            writer.writerow((
                path.name, request.operation, "structural_candidate",
                "constant" if request.operand_constant is not None else "symbolic",
                f"0x{request.command_offset:x}",
                f"0x{request.dispatch_offset:x}",
                f"0x{request.dispatch_method:02x}", address, symbol,
                stream_id, stream_name, "0" if request.operation == "start_default" else "",
                "127" if request.operation == "start_default" else "",
                request.operand if request.operation == "stop_fade" else "",
                "0" if request.operation == "start_default" else "",
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
        "--sdat",
        type=Path,
        default=Path("build/source-rom/files/data/sound/sound_data.sdat"),
        help="extracted SDAT used to validate stream IDs and resolve names",
    )
    parser.add_argument(
        "--config-root",
        type=Path,
        default=Path("config/arm9"),
        help="symbol configuration root used to resolve binary offsets",
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
    catalog = SdatStreamCatalog(args.sdat if args.sdat.exists() else None)
    write_report(sys.stdout, args.path, args.stream, args.config_root, catalog)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
