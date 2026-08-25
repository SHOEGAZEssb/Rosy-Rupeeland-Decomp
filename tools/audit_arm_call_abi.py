#!/usr/bin/env python3
"""Audit ARM argument registers across recovered call boundaries.

The audit follows direct ARM ``bl`` calls and propagates callee requirements
back through registers that a wrapper leaves live. This catches matching C
declarations that appear to take one argument while preserving additional ABI
arguments for the callee, such as SoundContext_PlayDefaultStream -> SoundManager_PlayDefaultStream in the stream
manager. It reads extracted binaries and symbol metadata only.
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import NamedTuple

try:
    from capstone import Cs, CS_ARCH_ARM, CS_MODE_ARM, CS_MODE_LITTLE_ENDIAN
except ImportError as error:  # pragma: no cover - environment diagnostic
    raise SystemExit("audit_arm_call_abi.py requires the Python capstone package") from error


SYMBOL_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:function\(arm,size=0x(?P<size>[0-9a-fA-F]+)\)"
    r"\s+addr:0x(?P<address>[0-9a-fA-F]+)"
)
ARGUMENTS = ("r0", "r1", "r2", "r3")


class Function(NamedTuple):
    name: str
    address: int
    size: int


def read_functions(path: Path) -> list[Function]:
    """Read address-sorted ARM function symbols."""
    functions: list[Function] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        match = SYMBOL_RE.match(line)
        if match is not None:
            functions.append(Function(
                match.group("name"), int(match.group("address"), 16),
                int(match.group("size"), 16)
            ))
    return sorted(functions, key=lambda function: function.address)


def direct_target(instruction) -> int | None:
    """Return the immediate target of one direct BL instruction."""
    if instruction.mnemonic != "bl" or not instruction.op_str.startswith("#"):
        return None
    try:
        return int(instruction.op_str[1:], 0)
    except ValueError:
        return None


def analyze_requirements(
    binary: bytes, base: int, functions: list[Function]
) -> dict[int, set[str]]:
    """Return the fixed-point lower bound of argument registers per function."""
    decoder = Cs(CS_ARCH_ARM, CS_MODE_ARM | CS_MODE_LITTLE_ENDIAN)
    decoder.detail = True
    instructions: dict[int, list] = {}
    for function in functions:
        offset = function.address - base
        if offset < 0 or offset + function.size > len(binary):
            continue
        instructions[function.address] = list(decoder.disasm(
            binary[offset:offset + function.size], function.address
        ))
    requirements = {address: set() for address in instructions}
    changed = True
    while changed:
        changed = False
        for address, body in instructions.items():
            written: set[str] = set()
            needed: set[str] = set(requirements[address])
            for instruction in body:
                target = direct_target(instruction)
                if target is not None:
                    for register in requirements.get(target, set()):
                        if register not in written:
                            needed.add(register)
                    # AAPCS permits a direct callee to clobber every argument
                    # register. Reads after the call therefore do not consume
                    # this function's incoming values unless restored first.
                    written.update(ARGUMENTS)
                reads, writes = instruction.regs_access()
                for register_id in reads:
                    register = instruction.reg_name(register_id)
                    # PUSH may mention r0-r3 only to preserve or align the
                    # stack. It does not semantically consume an argument.
                    if (instruction.mnemonic != "push" and
                            register in ARGUMENTS and register not in written):
                        needed.add(register)
                for register_id in writes:
                    register = instruction.reg_name(register_id)
                    if register in ARGUMENTS:
                        written.add(register)
            if not needed.issubset(requirements[address]):
                requirements[address].update(needed)
                changed = True
    return requirements


class Contract(NamedTuple):
    declared_arguments: int
    declaration_path: str


def read_contracts(path: Path) -> dict[str, Contract]:
    """Read argument counts and optional canonical declaration paths."""
    with path.open(newline="", encoding="utf-8") as stream:
        return {
            row["function"]: Contract(
                int(row["declared_arguments"]), row.get("declaration_path", "")
            )
            for row in csv.DictReader(stream)
        }


def source_argument_count(path: Path, function: str) -> int | None:
    """Count parameters in a simple canonical C header declaration."""
    source = path.read_text(encoding="utf-8")
    source = re.sub(r"/\*.*?\*/|//[^\r\n]*", "", source, flags=re.DOTALL)
    match = re.search(
        rf"\b{re.escape(function)}\s*\((?P<arguments>[^;{{}}]*)\)\s*;",
        source,
        flags=re.DOTALL,
    )
    if match is None:
        return None
    arguments = match.group("arguments").strip()
    if not arguments or arguments == "void":
        return 0
    return len(arguments.split(","))


def main() -> int:
    """Report and fail on declarations narrower than observed ARM usage."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--binary", type=Path,
        default=Path("build/source-rom/arm9/arm9.bin")
    )
    parser.add_argument(
        "--symbols", type=Path, default=Path("config/arm9/symbols.txt")
    )
    parser.add_argument(
        "--contracts", type=Path,
        default=Path("config/arm9/audio_abi_contracts.csv")
    )
    parser.add_argument("--base", type=lambda value: int(value, 0), default=0x02000000)
    parser.add_argument("--function", help="report only this function")
    args = parser.parse_args()
    for path in (args.binary, args.symbols, args.contracts):
        if not path.exists():
            parser.error(f"path does not exist: {path}")

    functions = read_functions(args.symbols)
    by_name = {function.name: function for function in functions}
    requirements = analyze_requirements(args.binary.read_bytes(), args.base, functions)
    contracts = read_contracts(args.contracts)
    failed = False
    print("function,address,declared_arguments,required_registers,status")
    for name, contract in contracts.items():
        declared = contract.declared_arguments
        if args.function is not None and name != args.function:
            continue
        function = by_name.get(name)
        if function is None:
            print(f"{name},,{declared},,missing_symbol")
            failed = True
            continue
        required = requirements.get(function.address, set())
        ordered = [register for register in ARGUMENTS if register in required]
        minimum = max((ARGUMENTS.index(register) + 1 for register in ordered), default=0)
        status = "ok" if declared >= minimum else "declaration_too_narrow"
        if contract.declaration_path:
            declaration_path = Path(contract.declaration_path)
            source_count = (source_argument_count(declaration_path, name)
                            if declaration_path.exists() else None)
            if source_count is None:
                status = "source_declaration_missing"
            elif source_count != declared:
                status = f"source_declares_{source_count}"
        print(f"{name},0x{function.address:08x},{declared},"
              f"{'|'.join(ordered)},{status}")
        failed |= status != "ok"
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
