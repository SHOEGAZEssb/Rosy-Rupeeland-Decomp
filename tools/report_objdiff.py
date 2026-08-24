#!/usr/bin/env python3
"""Summarize and optionally enforce selected objdiff results."""

from __future__ import annotations

import argparse
import json
import re
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


def load_symbol_renames(directory: Path | None) -> dict[str, str]:
    """Load reviewed target-to-current symbol aliases for naming-only diffs."""
    if directory is None:
        return {}
    mapping: dict[str, str] = {}
    for path in sorted(directory.glob("*.json")):
        entries = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(entries, dict):
            raise ValueError(f"symbol rename file is not an object: {path}")
        for old, new in entries.items():
            previous = mapping.setdefault(old, new)
            if previous != new:
                raise ValueError(f"conflicting symbol rename for {old}")
    return mapping


def normalized_symbol(name: str, renames: dict[str, str]) -> str:
    return renames.get(name, name)


def normalized_text(text: str, renames: dict[str, str]) -> str:
    if not renames:
        return text
    return re.sub(
        r"\b[A-Za-z_]\w*\b",
        lambda match: normalized_symbol(match.group(0), renames),
        text,
    )


def relocation_target(entry: dict, symbols: list[dict],
                      renames: dict[str, str]) -> str | None:
    relocation = entry.get("relocation")
    if relocation is None:
        return None
    index = relocation.get("target_symbol")
    if not isinstance(index, int) or index < 0 or index >= len(symbols):
        return None
    return normalized_symbol(str(symbols[index].get("name", "")), renames)


def instructions_match_after_renames(target_entry: dict, current_entry: dict,
                                     target_symbols: list[dict],
                                     current_symbols: list[dict],
                                     renames: dict[str, str]) -> bool:
    """Accept only instruction-identical functions whose reloc labels changed."""
    target_instructions = target_entry.get("instructions", [])
    current_instructions = current_entry.get("instructions", [])
    if target_entry.get("size") != current_entry.get("size"):
        return False
    if len(target_instructions) != len(current_instructions):
        return False
    for target, current in zip(target_instructions, current_instructions):
        target_instruction = target.get("instruction", {})
        current_instruction = current.get("instruction", {})
        if target_instruction.get("address") != current_instruction.get("address"):
            return False
        if target_instruction.get("size") != current_instruction.get("size"):
            return False
        target_formatted = normalized_text(
            str(target_instruction.get("formatted", "")), renames)
        current_formatted = normalized_text(
            str(current_instruction.get("formatted", "")), renames)
        if target_formatted != current_formatted:
            return False
        target_relocation = target.get("relocation")
        current_relocation = current.get("relocation")
        if (target_relocation is None) != (current_relocation is None):
            return False
        if target_relocation is not None:
            for field in ("type", "type_name", "addend"):
                if target_relocation.get(field) != current_relocation.get(field):
                    return False
            if relocation_target(target, target_symbols, renames) != relocation_target(
                current, current_symbols, renames
            ):
                return False
    return True


def is_exported_function(entry: dict) -> bool:
    """Recognize source functions even when objdiff omits their kind tag."""
    return (
        entry.get("kind") == "SYMBOL_FUNCTION"
        or (
            bool(entry.get("flags", {}).get("global"))
            and entry.get("match_percent") is not None
            and bool(entry.get("instructions"))
        )
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--section", action="append", dest="sections")
    parser.add_argument("--function", action="append", dest="functions")
    parser.add_argument("--require-exact", action="store_true")
    parser.add_argument("--symbol-renames", type=Path)
    args = parser.parse_args()

    sections = args.sections or EXPECTED_SECTIONS
    functions = args.functions or EXPECTED_FUNCTIONS

    report = json.loads(args.input.read_text(encoding="utf-8"))
    target = report["left"]
    current = report["right"]
    renames = load_symbol_renames(args.symbol_renames)
    target_symbols = target["symbols"]
    current_symbols = current["symbols"]

    rename_only: set[str] = set()
    for target_entry in target_symbols:
        if not is_exported_function(target_entry):
            continue
        name = str(target_entry.get("name", ""))
        current_entry = next(
            (entry for entry in current_symbols
             if normalized_symbol(str(entry.get("name", "")), renames)
             == normalized_symbol(name, renames)),
            None,
        )
        if current_entry is not None and instructions_match_after_renames(
            target_entry, current_entry, target_symbols, current_symbols, renames
        ):
            rename_only.add(name)

    lines = [f"Objdiff report: {args.input.stem}", ""]
    exact = True

    lines.append("Sections:")
    for name in sections:
        entry = find_match(target["sections"], name)
        percent = float(entry["match_percent"])
        if name == ".text" and percent != 100.0:
            mismatched = [
                symbol for symbol in target_symbols
                if is_exported_function(symbol)
                and symbol.get("match_percent") is not None
                and float(symbol["match_percent"]) != 100.0
            ]
            if mismatched and all(str(symbol.get("name", "")) in rename_only
                                  for symbol in mismatched):
                percent = 100.0
        exact &= percent == 100.0
        lines.append(f"  {name:<8} {percent:10.6f}%  {int(entry['size']):4d} bytes")

    lines.extend(("", "Functions:"))
    for name in functions:
        target_entry = find_match(target["symbols"], name)
        current_entry = next(entry for entry in current_symbols
                             if normalized_symbol(str(entry.get("name", "")), renames)
                             == normalized_symbol(name, renames))
        percent = float(target_entry["match_percent"])
        if name in rename_only:
            percent = 100.0
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
