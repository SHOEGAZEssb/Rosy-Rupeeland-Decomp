#include "tingle/types.h"

/* Overlay 31 sub-engine display-mode, scanline displacement, and brightness callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov031_021fd160(void *, s32);
extern s32 func_ov031_021fd17c(void *, s32);
extern void GXx_SetMasterBrightness_(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag 0x400 is set, toggles word +0x528 between zero and one and
 * replaces sub-engine DISPCNT bits 8..12 from scene field +0x4C. Always returns
 * zero; scene memory and sub-engine display-control MMIO may change.
 */
extern "C" s32 func_ov031_021fdc48(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0) {
        FIELD(s32, scene, 0x528) = 1 - FIELD(s32, scene, 0x528);
        volatile u32 *subDispCnt = (volatile u32 *)0x04001000;
        *subDispCnt = (*subDispCnt & ~0x1f00) |
                      (FIELD(u32, scene, 0x4c) << 8);
    }
    return 0;
}

/*
 * When scene flag 0x400 and effect-enable +0xA0 are set and main VCOUNT is below
 * 192, samples the completed waveform +0xA4 at the current scanline. It writes
 * the low nine displacement bits to sub-engine BG2X and applies the paired signed
 * offset as sub-engine master brightness. Always returns zero; only display MMIO
 * changes through direct access and the GX helper.
 */
extern "C" s32 func_ov031_021fdc88(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0 &&
        FIELD(s32, scene, 0xa0) != 0) {
        s32 line = *(volatile u16 *)0x04000006;
        if (line < 0xc0) {
            s32 displacement = func_ov031_021fd160((u8 *)scene + 0xa4, line);
            *(volatile u32 *)0x04001010 = displacement & 0x1ff;
            s32 brightness = func_ov031_021fd17c((u8 *)scene + 0xa4, line);
            GXx_SetMasterBrightness_((void *)0x0400106c, brightness);
        }
    }
    return 0;
}
