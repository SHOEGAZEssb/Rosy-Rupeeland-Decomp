#!/usr/bin/env python3
"""Report every known sound-context command embedded in actor bytecode.

The report is structural: it recognizes the recovered command selector,
operand count, and following actor-method dispatch. It does not pretend that a
method byte has one global meaning across actor classes. Constant SSAR packed
IDs are split into archive/member fields; SSEQ and STRM IDs remain in their
native index domains. Symbolic stack producers are retained as expressions.
"""

from __future__ import annotations

import argparse
import csv
import sys
from pathlib import Path
from typing import Iterator, NamedTuple, TextIO

try:
    from .report_actor_script_streams import (
        SdatStreamCatalog,
        SymbolResolver,
        binary_files,
        read_stack_push,
    )
except ImportError:  # Direct ``python tools/report_actor_script_audio.py`` use.
    from report_actor_script_streams import (
        SdatStreamCatalog,
        SymbolResolver,
        binary_files,
        read_stack_push,
    )


class CommandSpec(NamedTuple):
    operands: int
    operation: str
    audio_type: str
    id_operand: int | None = None
    packed_ssar: bool = False


SPECS = {
    0: CommandSpec(1, "play_default", "SSAR", 0, True),
    1: CommandSpec(1, "stop", "SSAR", 0, True),
    2: CommandSpec(1, "play_owned", "SSAR", 0, True),
    3: CommandSpec(1, "query", "SSAR", 0, True),
    4: CommandSpec(1, "Sound_StopAllDirectSequences", "GLOBAL"),
    5: CommandSpec(1, "query", "SSEQ", 0),
    6: CommandSpec(1, "play_default", "STRM", 0),
    7: CommandSpec(1, "stop", "STRM"),
    8: CommandSpec(1, "load", "GROUP", 0),
    9: CommandSpec(1, "release", "GROUP", 0),
    10: CommandSpec(1, "Sound_SetCaptureEnabled", "GLOBAL"),
    11: CommandSpec(1, "Sound_SetCaptureRoute0Enabled", "GLOBAL"),
    12: CommandSpec(1, "Sound_SetCaptureRoute1Enabled", "GLOBAL"),
    13: CommandSpec(1, "Sound_SetDirectCaptureRoutesEnabled", "GLOBAL"),
    14: CommandSpec(1, "SoundPhaseDatabaseManager_Update", "GLOBAL"),
    15: CommandSpec(0, "query_current", "STRM"),
    16: CommandSpec(0, "save_position", "STRM"),
    17: CommandSpec(0, "resume_position", "STRM"),
    18: CommandSpec(0, "Sound_StopAllManagedPlayers", "GLOBAL"),
    19: CommandSpec(0, "SoundPhaseManager_Reset", "GLOBAL"),
    20: CommandSpec(0, "reapply", "GROUP"),
    21: CommandSpec(2, "play", "SSEQ", 0),
    22: CommandSpec(2, "stop", "SSEQ", 0),
    23: CommandSpec(2, "volume", "SSEQ", 0),
    24: CommandSpec(2, "volume", "STRM"),
    25: CommandSpec(2, "set_slot", "GROUP", 1),
    26: CommandSpec(3, "play_owned_parameters", "SSAR", 0, True),
    27: CommandSpec(3, "volume", "SSAR", 0, True),
    28: CommandSpec(3, "track_value", "SSEQ", 0),
    29: CommandSpec(3, "Sound_ConfigureAuxiliaryManagers", "SSEQ", 0),
    30: CommandSpec(4, "play_parameters", "SSAR", 0, True),
    31: CommandSpec(4, "set_parameters", "SSAR", 0, True),
    32: CommandSpec(5, "play_parameters", "STRM", 0),
    33: CommandSpec(3, "track_bit", "SSEQ", 0),
    34: CommandSpec(1, "SoundPhaseManager_RequestAlternateTransition", "GLOBAL"),
}


class AudioCommand(NamedTuple):
    offset: int
    dispatch_offset: int
    dispatch_method: int
    selector: int
    spec: CommandSpec
    operands: tuple


def find_audio_commands(data: bytes) -> Iterator[AudioCommand]:
    """Yield structurally valid instances of all recovered audio selectors."""
    start = 0
    while start < len(data):
        selector = read_stack_push(data, start)
        if selector is None or selector.constant not in SPECS:
            start += 1
            continue
        spec = SPECS[selector.constant]
        offset = start + selector.size
        operands = []
        for _ in range(spec.operands):
            operand = read_stack_push(data, offset)
            if operand is None:
                break
            operands.append(operand)
            offset += operand.size
        if len(operands) != spec.operands:
            start += 1
            continue
        if offset + 2 > len(data) or data[offset] != 0x15:
            start += 1
            continue
        yield AudioCommand(
            start, offset, data[offset + 1], selector.constant, spec,
            tuple(operands)
        )
        # Operands are data for this instruction sequence, not independent
        # selectors. Resuming after dispatch prevents nested false positives.
        start = offset + 2


def identity(command: AudioCommand) -> tuple[str, str]:
    """Return primary ID and SSAR member expressions for one command."""
    index = command.spec.id_operand
    if index is None:
        return "", ""
    operand = command.operands[index]
    if not command.spec.packed_ssar:
        return operand.expression, ""
    if operand.constant is None:
        return f"({operand.expression}&0xffff)>>7", f"{operand.expression}&0x7f"
    packed = operand.constant & 0xFFFF
    return str(packed >> 7), str(packed & 0x7F)


def write_report(
    output: TextIO, root: Path, config_root: Path,
    stream_catalog: SdatStreamCatalog | None = None,
) -> int:
    """Write an address-resolved CSV report and return its row count."""
    writer = csv.writer(output)
    writer.writerow((
        "binary", "selector", "operation", "audio_type", "confidence",
        "command_offset", "dispatch_offset", "dispatch_method",
        "source_address", "source_symbol", "audio_id", "member", "operands",
    ))
    count = 0
    for path in binary_files(root):
        resolver = SymbolResolver(path, config_root)
        for command in find_audio_commands(path.read_bytes()):
            if (stream_catalog is not None and
                    command.spec.audio_type == "STRM" and
                    command.spec.id_operand is not None and
                    not stream_catalog.contains(
                        command.operands[command.spec.id_operand].constant
                    )):
                continue
            address, symbol = resolver.describe(command.offset)
            audio_id, member = identity(command)
            writer.writerow((
                path.name, command.selector, command.spec.operation,
                command.spec.audio_type, "structural_candidate",
                f"0x{command.offset:x}", f"0x{command.dispatch_offset:x}",
                f"0x{command.dispatch_method:02x}", address, symbol,
                audio_id, member,
                "|".join(operand.expression for operand in command.operands),
            ))
            count += 1
    return count


def main() -> int:
    """Parse paths and emit the complete actor-script audio inventory."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "path", nargs="?", type=Path,
        default=Path("build/source-rom/arm9_overlays"),
        help="overlay-binary directory or one binary file",
    )
    parser.add_argument(
        "--config-root", type=Path, default=Path("config/arm9"),
        help="symbol configuration root used to resolve binary offsets",
    )
    parser.add_argument(
        "--sdat", type=Path,
        default=Path("build/source-rom/files/data/sound/sound_data.sdat"),
        help="extracted SDAT used to reject impossible constant STRM IDs",
    )
    args = parser.parse_args()
    if not args.path.exists():
        parser.error(f"path does not exist: {args.path}")
    catalog = SdatStreamCatalog(args.sdat if args.sdat.exists() else None)
    write_report(sys.stdout, args.path, args.config_root, catalog)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
