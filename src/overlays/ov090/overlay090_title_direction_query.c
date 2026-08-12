#include "tingle/system.h"

/* Read the retail eight-way directional code during overlay-90 boss-stage motion. */

/*
 * Convert pad 1's held D-pad bits into codes 0-7; return -1 when no direction
 * is held. Up has priority over down, followed by diagonal modifiers.
 */
s32 func_ov090_0221aab8(void)
{
    u16 held = gSystemState.pads[1].held;
    if (held & 0x20) {
        if (held & 0x40)
            return 3;
        if (held & 0x80)
            return 1;
        return 2;
    }
    if (held & 0x10) {
        if (held & 0x40)
            return 5;
        if (held & 0x80)
            return 7;
        return 6;
    }
    if (held & 0x40)
        return 4;
    return -(s32)((held & 0x80) == 0);
}
