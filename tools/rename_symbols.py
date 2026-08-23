#!/usr/bin/env python3
"""Apply reviewed identifier renames across tracked decompilation text files.

The mapping is a JSON object whose keys and values are complete C/assembly
identifiers.  Replacements are token-aware, dry-run by default, and preserve
the existing newline bytes so a naming batch does not create formatting noise.
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path


IDENTIFIER = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")


def tracked_files(repository: Path) -> list[Path]:
    result = subprocess.run(
        ["git", "ls-files", "-z"],
        cwd=repository,
        check=True,
        stdout=subprocess.PIPE,
    )
    return [
        repository / entry.decode("utf-8")
        for entry in result.stdout.split(b"\0")
        if entry
    ]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("mapping", type=Path)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--repository", type=Path)
    parser.add_argument("--allow-unreferenced", action="store_true")
    args = parser.parse_args()

    repository = (args.repository or Path(__file__).resolve().parents[1]).resolve()
    mapping_path = args.mapping.resolve()
    mapping = json.loads(mapping_path.read_text(encoding="utf-8"))
    if not isinstance(mapping, dict) or not mapping:
        parser.error("mapping must be a non-empty JSON object")
    for old, new in mapping.items():
        if not isinstance(old, str) or not isinstance(new, str):
            parser.error("every mapping entry must contain strings")
        if not IDENTIFIER.fullmatch(old) or not IDENTIFIER.fullmatch(new):
            parser.error(f"invalid identifier mapping: {old!r} -> {new!r}")
        if old == new:
            parser.error(f"identity mapping is not useful: {old}")
    if len(set(mapping.values())) != len(mapping):
        parser.error("two old identifiers map to the same new identifier")

    pattern = re.compile(
        r"\b(?:" + "|".join(re.escape(name) for name in
                            sorted(mapping, key=len, reverse=True)) + r")\b"
    )
    changed_files = 0
    replacements = 0
    seen = {name: 0 for name in mapping}
    for path in tracked_files(repository):
        if not path.is_file():
            continue
        raw = path.read_bytes()
        if b"\0" in raw:
            continue
        try:
            text = raw.decode("utf-8")
        except UnicodeDecodeError:
            continue

        def replace(match: re.Match[str]) -> str:
            nonlocal replacements
            old = match.group(0)
            seen[old] += 1
            replacements += 1
            return mapping[old]

        updated = pattern.sub(replace, text)
        if updated == text:
            continue
        changed_files += 1
        print(path.relative_to(repository).as_posix())
        if args.write:
            path.write_bytes(updated.encode("utf-8"))

    missing = [name for name, count in seen.items() if count == 0]
    print(f"files={changed_files} replacements={replacements}")
    if missing:
        print("unreferenced=" + ",".join(missing))
        if not args.allow_unreferenced:
            return 1
    if not args.write:
        print("dry run; pass --write to apply")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
