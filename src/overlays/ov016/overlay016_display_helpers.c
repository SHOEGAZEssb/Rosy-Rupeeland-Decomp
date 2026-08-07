#include "tingle/types.h"

/* Overlay 16 display-engine mask and background-register helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * When state bit 10 at +0x20 is set, commit the five-bit masks at +0x48/+0x4C
 * into DISPCNT bits 8-12 for the main and sub engines, preserving other bits.
 * Return zero. The volatile writes at 0x04000000/0x04001000 directly change
 * Nintendo DS display-layer enables.
 */
extern "C" s32 func_ov016_021fed7c(void *state)
{
    if ((FIELD(u32, state, 0x20) & 0x400) != 0) {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        *mainDisplay = (*mainDisplay & ~0x1f00u) | (FIELD(u32, state, 0x48) << 8);
        *subDisplay = (*subDisplay & ~0x1f00u) | (FIELD(u32, state, 0x4c) << 8);
    }
    return 0;
}

/*
 * Replace power-control bit 15 at 0x04000304 with the low bit of enabled while
 * preserving all other bits. Return void; this directly toggles the Nintendo DS
 * display-engine power assignment.
 */
extern "C" void func_ov016_021ff04c(s32 enabled)
{
    volatile u16 *power = (volatile u16 *)0x04000304;
    *power = (u16)((*power & ~0x8000u) | (enabled << 15));
}

/*
 * Rebuild the main BG3CNT register at 0x0400000E from four caller fields placed
 * at shifts 14, 7, 8, and 2, preserving only existing bits 0, 1, and 6. Return
 * void. The volatile halfword write directly changes BG3 size/map/tile settings.
 */
extern "C" void func_ov016_021ff068(s32 size, s32 mapBase, s32 colorMode, s32 tileBase)
{
    volatile u16 *bg3 = (volatile u16 *)0x0400000e;
    *bg3 = (u16)((*bg3 & 0x43) | (size << 14) | (mapBase << 7) |
                 (colorMode << 8) | (tileBase << 2));
}
