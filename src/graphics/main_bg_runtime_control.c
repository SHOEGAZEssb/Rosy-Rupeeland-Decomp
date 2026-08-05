#include "tingle/types.h"

/* Set main-engine background scroll registers and visibility bits. */

/* Write low-nine-bit X/Y scroll values for main background 0..3 and return zero. */
s32 func_0201cabc(s32 background, s32 x, s32 y)
{
    if ((u32)background <= 3) {
        volatile u32 *scroll = (volatile u32 *)(0x04000010 + background * 4);
        *scroll = ((u32)x & 0x1ff) | (((u32)y & 0x1ff) << 16);
    }
    return 0;
}

/* Set or clear the selected main-background visibility bit in DISPCNT; return zero. */
s32 func_0201cb70(s32 background, s32 enabled)
{
    volatile u32 *displayControl = (volatile u32 *)0x04000000;
    if ((u32)background <= 3) {
        u32 mask = 1u << (background + 8);
        if (enabled)
            *displayControl |= mask;
        else
            *displayControl &= ~mask;
    }
    return 0;
}
