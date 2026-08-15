"""Synthetic coverage for the actor-script streamed-audio reporter."""

from __future__ import annotations

import io
import struct
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from report_actor_script_streams import (  # noqa: E402
    SdatStreamCatalog,
    find_short_stream_requests,
    find_stream_requests,
    write_report,
)


def constant(value: int) -> bytes:
    """Encode the VM's five-byte constant-push instruction."""
    return b"\x2c" + struct.pack("<I", value & 0xFFFFFFFF)


class ActorScriptStreamReportTest(unittest.TestCase):
    """Prove both stream-start forms and the SDAT validity filter."""

    def test_parameterized_start(self) -> None:
        data = b"".join(constant(value) for value in (32, 2, 0, 127, 12, 1))
        data += b"\x15\x62"
        requests = list(find_stream_requests(data))
        self.assertEqual(len(requests), 1)
        self.assertEqual(requests[0].stream_id_constant, 2)
        self.assertEqual(requests[0].fade_frames, "12")

    def test_default_start_and_stop(self) -> None:
        data = constant(6) + constant(2) + b"\x15\x5c"
        data += constant(7) + constant(60) + b"\x15\xe0"
        requests = list(find_short_stream_requests(data))
        self.assertEqual(
            [(request.operation, request.operand_constant,
              request.dispatch_method) for request in requests],
            [("start_default", 2, 0x5C), ("stop_fade", 60, 0xE0)],
        )

    def test_sdat_catalog_and_csv_report(self) -> None:
        archive = bytearray(0x200)
        archive[:4] = b"SDAT"
        struct.pack_into("<I", archive, 0x10, 0x40)
        struct.pack_into("<I", archive, 0x18, 0x100)
        archive[0x40:0x44] = b"SYMB"
        struct.pack_into("<I", archive, 0x40 + 8 + 7 * 4, 0x40)
        struct.pack_into("<I", archive, 0x80, 3)
        struct.pack_into("<I", archive, 0x80 + 4 + 2 * 4, 0x60)
        archive[0xA0:0xA7] = b"HARP_2\0"
        archive[0x100:0x104] = b"INFO"
        struct.pack_into("<I", archive, 0x100 + 8 + 7 * 4, 0x40)
        struct.pack_into("<I", archive, 0x140, 3)
        struct.pack_into("<I", archive, 0x140 + 4 + 2 * 4, 0x80)

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            sdat = root / "sound.sdat"
            binary = root / "ov999.bin"
            sdat.write_bytes(archive)
            binary.write_bytes(constant(6) + constant(2) + b"\x15\x5c")
            catalog = SdatStreamCatalog(sdat)
            output = io.StringIO()
            count = write_report(output, binary, 2, root / "config", catalog)

        self.assertEqual(count, 1)
        self.assertTrue(catalog.contains(2))
        self.assertFalse(catalog.contains(1))
        self.assertIn("start_default", output.getvalue())
        self.assertIn("HARP_2", output.getvalue())


if __name__ == "__main__":
    unittest.main()
