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
CONFIG_SYMBOL_RE = re.compile(
    r"^(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s+.*\baddr:0x(?P<address>[0-9A-Fa-f]+)\b"
)


def load_address_aliases(repository: Path) -> dict[str, str]:
    """Map DSD's address names to the current names in symbol configs."""
    aliases: dict[str, str] = {}
    config_root = repository / "config" / "arm9"

    for symbols_path in config_root.rglob("symbols.txt"):
        overlay_match = re.search(r"overlays[/\\]ov(\d+)[/\\]symbols\.txt$", str(symbols_path))
        overlay = overlay_match.group(1) if overlay_match else None
        for line in symbols_path.read_text(encoding="utf-8").splitlines():
            match = CONFIG_SYMBOL_RE.match(line)
            if match is None:
                continue
            name = match.group("name")
            address = match.group("address").lower().zfill(8)
            prefix = "data" if name.startswith("data_") else "func"
            old_name = (
                f"{prefix}_ov{overlay}_{address}"
                if overlay is not None
                else f"{prefix}_{address}"
            )
            if name != old_name:
                aliases[old_name] = name
    return aliases


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
    aliases = load_address_aliases(Path(__file__).resolve().parents[1])
    body = [
        SYMBOL_RE.sub(lambda match: aliases.get(match.group(0), match.group(0)), line)
        for line in body
    ]
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
