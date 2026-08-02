#!/usr/bin/env python3
"""Restore the retail secure-area CRC and recalculate the NDS header CRC."""

from __future__ import annotations

import argparse
import struct
from pathlib import Path


SECURE_AREA_CRC_OFFSET = 0x6C
HEADER_CRC_OFFSET = 0x15E
HEADER_CRC_END = 0x15E


def crc16(data: bytes | bytearray) -> int:
    value = 0xFFFF
    for byte in data:
        value ^= byte
        for _ in range(8):
            value = (value >> 1) ^ 0xA001 if value & 1 else value >> 1
    return value


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("reference", type=Path, help="original retail ROM")
    parser.add_argument("rom", type=Path, help="rebuilt ROM to patch in place")
    args = parser.parse_args()

    reference = args.reference.read_bytes()
    rebuilt = bytearray(args.rom.read_bytes())
    if len(reference) < HEADER_CRC_OFFSET + 2 or len(rebuilt) < HEADER_CRC_OFFSET + 2:
        raise SystemExit("input is too small to contain a Nintendo DS header")

    rebuilt[SECURE_AREA_CRC_OFFSET : SECURE_AREA_CRC_OFFSET + 2] = reference[
        SECURE_AREA_CRC_OFFSET : SECURE_AREA_CRC_OFFSET + 2
    ]
    struct.pack_into("<H", rebuilt, HEADER_CRC_OFFSET, crc16(rebuilt[:HEADER_CRC_END]))
    args.rom.write_bytes(rebuilt)


if __name__ == "__main__":
    main()
