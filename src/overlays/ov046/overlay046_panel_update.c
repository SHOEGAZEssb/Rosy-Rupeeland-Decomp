#include "tingle/types.h"

/*
 * Overlay 46 live panel update. The recovered routine synchronizes the header
 * sprite, item sprites, and progress marker with GameWork and layout tables.
 * Exact assembly is retained because the nested table scans keep many values
 * live across SDK calls and are highly compiler-sensitive.
 */

/*
 * Update `panel` for the current game selection and progress state. It hides
 * the header initially, reads current counters/flags from GameWork, chooses a
 * matching entry among eleven 0x34-byte records, positions and reveals the
 * header as appropriate, then scans the entry's grid to update item sprite
 * glyphs, positions, and visibility. It returns no value; panel sprite state
 * and SDK renderer state change, with no direct MMIO access.
 */
extern "C" void func_ov046_0220c4a0(void *panel);
