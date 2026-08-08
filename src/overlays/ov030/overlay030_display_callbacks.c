#include "tingle/types.h"

/* Overlay 30 per-frame display-register and transform callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020929f4(void *);
extern void func_02092a34(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * If scene flag 0x400 is set, replaces display-control bits 8..12 for both
 * engines from fields +0x48/+0x4C, writes the low nine bits of offsets +0x338/
 * +0x33C into main-engine BG2X/BG2Y high halves, and advances transform object
 * +0x364. Always returns zero; scene transform state and Nintendo DS display
 * MMIO may change.
 */
extern "C" s32 func_ov030_021fe218(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0) {
        volatile u32 *mainDispCnt = (volatile u32 *)0x04000000;
        volatile u32 *subDispCnt = (volatile u32 *)0x04001000;
        *mainDispCnt = (*mainDispCnt & ~0x1f00) |
                       (FIELD(u32, scene, 0x48) << 8);
        *subDispCnt = (*subDispCnt & ~0x1f00) |
                      (FIELD(u32, scene, 0x4c) << 8);
        *(volatile u32 *)0x04000010 =
            (FIELD(u32, scene, 0x338) << 16) & 0x01ff0000;
        *(volatile u32 *)0x04000014 =
            (FIELD(u32, scene, 0x33c) << 16) & 0x01ff0000;
        func_020929f4((u8 *)scene + 0x364);
    }
    return 0;
}

/*
 * If scene flag 0x400 is set, commits/finalizes transform object +0x364 with
 * argument zero. Always returns zero; SDK transform state may change and no
 * direct hardware register is accessed here.
 */
extern "C" s32 func_ov030_021fe28c(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0)
        func_02092a34((u8 *)scene + 0x364, 0);
    return 0;
}
