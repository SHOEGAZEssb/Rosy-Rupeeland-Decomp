#include "tingle/types.h"

/*
 * Overlay 48 display/capture setup. These recovered routines route VRAM,
 * configure main/sub BG modes, and prepare a software OAM buffer for a capture
 * effect. Exact assembly preserves volatile Nintendo DS MMIO write ordering.
 */

/*
 * Initialize display hardware and OAM state for `object`. It masks 3D control
 * bits at 0x04000060, initializes the transfer table at +0x404, selects main
 * and sub graphics modes, configures BG2 affine parameters and sub BG control,
 * fills twelve initial OAM entries in the 128-entry buffer, uploads the 0x400-
 * byte OAM block, applies plane priorities, and initializes capture registers.
 * Object OAM records, SDK graphics state, and main/sub MMIO all change; nothing
 * is returned. Packed values are confirmed hardware encodings.
 */
extern "C" void func_ov048_0220b7b8(void *object);

/*
 * Set or clear bit 15 of POWCNT1 at 0x04000304 from `enabled`. No masking of
 * the input beyond its left shift occurs. Hardware power/display state changes;
 * memory is unchanged and nothing is returned.
 */
extern "C" void func_ov048_0220b9a0(s32 enabled);

/*
 * Route VRAM banks and configure DISPCAPCNT according to selector field +0,
 * then return that selector. Zero routes bank C for LCDC after clearing the
 * alternate mapping; nonzero routes bank C to sub BG and bank D to LCDC. VRAM
 * bank ownership and capture MMIO change through SDK calls.
 */
extern "C" s32 func_ov048_0220b9bc(void *object);

/*
 * Pack capture source, size, destination-bank, mode, offset, and EVA/EVB stack
 * arguments into DISPCAPCNT at 0x04000064 and set its enable bit. Hardware
 * capture state changes, nothing is returned, and values are shifted exactly
 * as provided without semantic validation.
 */
extern "C" void func_ov048_0220ba54(u32 sourceA, u32 sourceB, u32 size,
                                     u32 mode, u32 destination, u32 eva,
                                     u32 evb);

/*
 * Apply selector field +0 to POWCNT1 and sub-engine display mode bits: zero
 * enables the power bit and chooses display mode 4, nonzero clears it and
 * chooses mode 1. Main/sub display MMIO changes; the object is unchanged and
 * no value is returned.
 */
extern "C" void func_ov048_0220ba90(void *object);
