#include "tingle/debug_phase_selector.h"

/* Restore sub-engine BG2 after the selector's auxiliary debug overlay. */

/*
 * Set bit 2 in the sub-engine display mode field at 0x04001000 and return 0,
 * preserving other DISPCNT bits. self is unused and the register write directly
 * re-enables the BG2 mode used by the phase grid.
 */
s32 func_0200c650(DebugPhaseSelector *self)
{
    volatile u32 *displayControl = (volatile u32 *)0x04001000;
    u32 mode = (*displayControl & 0x1f00) >> 8;

    (void)self;
    *displayControl = (*displayControl & ~0x1f00) | ((mode | 4) << 8);
    return 0;
}
