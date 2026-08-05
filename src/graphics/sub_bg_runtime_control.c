#include "tingle/types.h"

/* Set sub-engine background scroll offsets and visibility bits. */

#ifdef __cplusplus
extern "C" {
#endif
extern void BgScroll_SetSubBg0(s32 x, s32 y);
extern void BgScroll_SetSubBg1(s32 x, s32 y);
extern void BgScroll_SetSubBg2(s32 x, s32 y);
extern void BgScroll_SetSubBg3(s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/* Dispatch X/Y scroll offsets to sub background 0..3 and return zero. */
s32 func_0201c5ac(s32 background, s32 x, s32 y)
{
    switch (background) {
    case 0: BgScroll_SetSubBg0(x, y); break;
    case 1: BgScroll_SetSubBg1(x, y); break;
    case 2: BgScroll_SetSubBg2(x, y); break;
    case 3: BgScroll_SetSubBg3(x, y); break;
    }
    return 0;
}

/* Set or clear the selected sub-background visibility bit in DISPCNT_SUB; return zero. */
s32 func_0201c610(s32 background, s32 enabled)
{
    volatile u32 *displayControl = (volatile u32 *)0x04001000;
    if ((u32)background <= 3) {
        u32 mask = 1u << (background + 8);
        if (enabled)
            *displayControl |= mask;
        else
            *displayControl &= ~mask;
    }
    return 0;
}
