#!/usr/bin/env python3
"""Generate repetitive exact-match Ninja edges for overlay assembly objects."""

from __future__ import annotations

import argparse
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("overlay", help="three-digit overlay number")
    parser.add_argument("output", type=Path)
    parser.add_argument("entries", nargs="+", help="stem=function pairs")
    args = parser.parse_args()

    overlay = args.overlay.zfill(3)
    reports: list[str] = []
    lines = [
        f"# Generated exact matching fallbacks for overlay {overlay}.",
        "# Regenerate with tools/generate_overlay_matching_ninja.py.",
        "",
    ]
    for entry in args.entries:
        stem, function = entry.split("=", 1)
        source = f"asm/overlays/ov{overlay}/{stem}.s"
        target = f"build/decomp/asm/overlays/ov{overlay}/{stem}.o"
        base = f"build/decomp/delinks/asm/overlays/ov{overlay}/{stem}.o"
        report_json = f"build/reports/{stem}.json"
        report_text = f"build/reports/{stem}.txt"
        reports.append(report_text)
        lines.extend(
            [
                f"build {target}: mwasmarm {source}",
                f"build {base}: dsd_delink config/arm9/config.yaml | config/arm9/overlays/ov{overlay}/delinks.txt config/arm9/overlays/ov{overlay}/symbols.txt config/arm9/overlays/ov{overlay}/relocs.txt",
                f"  object = {source}",
                f"build {report_json}: objdiff {target} {base}",
                f"  target_object = {target}",
                f"  base_object = {base}",
                f"build {report_text}: match_report {report_json} | tools/report_objdiff.py",
                f"  report_json = {report_json}",
                f"  report_args = --section .text --function {function} --require-exact",
                "",
            ]
        )

    lines.append(f"build overlay{overlay}_matching: phony {' '.join(reports)}")
    lines.append("")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
