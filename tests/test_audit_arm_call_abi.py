"""Tests for the ARM argument-register audit."""

from __future__ import annotations

import unittest
import tempfile
from pathlib import Path

from tools.audit_arm_call_abi import (
    Function,
    analyze_requirements,
    source_argument_count,
)


class AuditArmCallAbiTests(unittest.TestCase):
    """Exercise direct and transitive register liveness."""

    def test_wrapper_inherits_register_left_live_for_callee(self) -> None:
        """A wrapper that supplies r0 but preserves r1 still takes r1."""
        base = 0x02000000
        wrapper = bytes.fromhex(
            "0000a0e3"  # mov r0, #0
            "010000eb"  # bl base + 0x10
            "1eff2fe1"  # bx lr
            "00000000"  # alignment
        )
        callee = bytes.fromhex(
            "0050a0e1"  # mov r5, r0
            "0140a0e1"  # mov r4, r1
            "1eff2fe1"  # bx lr
        )
        requirements = analyze_requirements(
            wrapper + callee,
            base,
            [Function("wrapper", base, 12), Function("callee", base + 16, 12)],
        )

        self.assertEqual(requirements[base + 16], {"r0", "r1"})
        self.assertEqual(requirements[base], {"r1"})

    def test_push_for_alignment_does_not_create_argument(self) -> None:
        """CodeWarrior's push {r3, lr} prologue does not imply arg four."""
        base = 0x02000000
        body = bytes.fromhex(
            "08402de9"  # push {r3, lr}
            "0050a0e1"  # mov r5, r0
            "0880bde8"  # pop {r3, pc}
        )
        requirements = analyze_requirements(
            body, base, [Function("aligned", base, len(body))]
        )

        self.assertEqual(requirements[base], {"r0"})

    def test_canonical_header_argument_count(self) -> None:
        """The audit also detects drift in the checked-in declaration."""
        with tempfile.TemporaryDirectory() as temporary:
            header = Path(temporary) / "sound.h"
            header.write_text(
                "void SoundManager_PlayDefaultStream(void *manager,\n"
                "                     int stream);\n",
                encoding="utf-8",
            )
            self.assertEqual(source_argument_count(header, "SoundManager_PlayDefaultStream"), 2)


if __name__ == "__main__":
    unittest.main()
