"""Synthetic coverage for the complete actor-script audio report."""

from __future__ import annotations

import struct
import unittest

from tools.report_actor_script_audio import find_audio_commands, identity


def constant(value: int) -> bytes:
    """Encode the VM's five-byte constant-push instruction."""
    return b"\x2c" + struct.pack("<I", value & 0xFFFFFFFF)


class ActorScriptAudioReportTests(unittest.TestCase):
    """Cover SSAR, SSEQ, STRM, and utility selector shapes."""

    def command(self, selector: int, *operands: int):
        data = constant(selector)
        data += b"".join(constant(value) for value in operands)
        data += b"\x15\xa4"
        commands = list(find_audio_commands(data))
        self.assertEqual(len(commands), 1)
        return commands[0]

    def test_packed_ssar_identity(self) -> None:
        command = self.command(30, (390 << 7) | 4, 127, -10, 64)
        self.assertEqual(command.spec.audio_type, "SSAR")
        self.assertEqual(identity(command), ("390", "4"))

    def test_sequence_and_stream_shapes(self) -> None:
        sequence = self.command(21, 13, 127)
        stream = self.command(32, 2, 0, 127, 0, 0)
        utility = self.command(16)
        self.assertEqual(identity(sequence), ("13", ""))
        self.assertEqual(identity(stream), ("2", ""))
        self.assertEqual(utility.spec.operation, "save_position")


if __name__ == "__main__":
    unittest.main()
