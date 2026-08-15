"""Synthetic coverage for deterministic audio-trace comparisons."""

from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from tools.compare_audio_traces import compare


HEADER = "frame,event,type,id,member,arg0,arg1,arg2,result\n"


class CompareAudioTracesTests(unittest.TestCase):
    """Verify frame normalization and request-level mismatch reporting."""

    def test_frame_origin_is_ignored_by_default(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            retail = root / "retail.csv"
            recomp = root / "recomp.csv"
            retail.write_text(
                HEADER + "90,play,STRM,2,-1,0,127,0,requested\n",
                encoding="utf-8",
            )
            recomp.write_text(
                HEADER + "12,play,STRM,2,-1,0,127,0,requested\n",
                encoding="utf-8",
            )

            self.assertEqual(compare(retail, recomp), "")
            self.assertIn("-90,play,STRM,2", compare(retail, recomp, True))

    def test_wrong_audio_id_produces_diff(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            retail = root / "retail.csv"
            recomp = root / "recomp.csv"
            retail.write_text(
                HEADER + "0,play,STRM,2,-1,0,127,0,requested\n",
                encoding="utf-8",
            )
            recomp.write_text(
                HEADER + "0,play,STRM,13,-1,0,127,0,requested\n",
                encoding="utf-8",
            )

            difference = compare(retail, recomp)

        self.assertIn("-play,STRM,2", difference)
        self.assertIn("+play,STRM,13", difference)


if __name__ == "__main__":
    unittest.main()
