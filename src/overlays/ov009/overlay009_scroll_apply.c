#include "tingle/types.h"

/*
 * Overlay 9 background-scroll application. This recovered helper mirrors the
 * scene camera offsets into main-engine BG2 and BG3 scroll registers.
 */

/*
 * Negate state +0xF0/+0xF4, mask each to nine bits, pack horizontal/vertical
 * values, and write the same word to BG2HOFS/BG2VOFS and BG3HOFS/BG3VOFS.
 * Return zero. This directly writes I/O addresses 0x04000018..0x0400001F.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay009_ApplyScroll(void *state)
{
    volatile u32 *scroll = (volatile u32 *)0x04000018;
    scroll[0] = ((u32)-*(s32 *)((u8 *)state + 0xf0) & 0x1ff) |
                (((u32)-*(s32 *)((u8 *)state + 0xf4) & 0x1ff) << 16);
    scroll[1] = ((u32)-*(s32 *)((u8 *)state + 0xf0) & 0x1ff) |
                (((u32)-*(s32 *)((u8 *)state + 0xf4) & 0x1ff) << 16);
    return 0;
}
