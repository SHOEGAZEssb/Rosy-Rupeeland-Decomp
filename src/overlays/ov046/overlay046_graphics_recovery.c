#include "tingle/types.h"

/*
 * Overlay 46 graphics recovery. These routines load the selection panel's
 * tile resources, rebuild its visible sprite/canvas contents, and write the
 * corresponding main- or sub-engine OAM state. Exact matching assembly is
 * retained for the long compiler-sensitive loops and direct MMIO sequences.
 */

/*
 * Load the mode-selected resource triplet (0xB10A..0xB10C or
 * 0xC00F..0xC011), configure BG0..BG3 control registers for the panel's
 * owning display, upload resource set slot 3 at 0x1E0, rebuild the panel, and
 * release the temporary resource set. `panel` changes and this routine has no
 * return value. It writes main-engine registers at 0x04000008..0x0400000E or
 * sub-engine registers at 0x04001008..0x0400100E according to font ownership.
 */
extern "C" void func_ov046_0220bac0(void *panel);

/*
 * Clear a rectangle in the software canvas referenced by `canvas` +0x24.
 * `rectangle` supplies offset-derived x/y/width/height fields at +4/+8/+0xC/
 * +0x10; coordinates are scaled by six and converted to the DS 8x8 tiled
 * 16-bit bitmap layout. Pixel memory changes, nothing is returned, and no
 * hardware register is touched directly. The first argument is unused.
 */
extern "C" void func_ov046_0220bc80(void *unused, void *canvas,
                                     const void *rectangle);

/*
 * Recompute the three visible selection slots from panel origin +0x10C/+0x110
 * and the seven layout records at data_ov046_0220ce28. It updates slot indices
 * +0xC8, loads mode-dependent tile resources for changed slots, redraws their
 * software canvases, and refreshes sprite attributes/visibility. `panel` and
 * graphics resources change; temporary resource sets are released; no value
 * is returned. Table field meanings beyond confirmed coordinates and resource
 * IDs remain inferred from offset use.
 */
extern "C" void func_ov046_0220bd14(void *panel);

/*
 * Hide all 32 item sprites, then populate them for selection `index` using
 * the corresponding 0x34-byte data_020d780C record and 0x14-byte placement
 * record. `value` selects a record variant and `flag` controls the auxiliary
 * sprite path. The routine updates sprite glyphs, positions, visibility, and
 * finally rebuilds panel slots; it returns no value and affects renderer/OAM
 * state through SDK helpers.
 */
extern "C" void func_ov046_0220bffc(void *panel, s32 index, s32 value,
                                     s32 flag);

/*
 * Write panel scroll/blend configuration and three slot positions into the
 * selected display engine's BG/OAM registers. Inputs are read from panel
 * origin +0x10C/+0x110, selected slots +0xC8, and layout records. No panel
 * fields are modified and no value is returned; this routine directly writes
 * Nintendo DS main- or sub-engine MMIO according to the font/display owner.
 */
extern "C" void func_ov046_0220c1d8(void *panel);
