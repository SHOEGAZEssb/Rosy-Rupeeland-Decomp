#include "tingle/types.h"

/* Overlay 27 graphics-context setup and per-frame display application. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov048_0220ba90(void *);
extern void func_ov048_0220b7b8(void *);
extern void func_020b0300(u16, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag 0x400 is set, applies the graphics context at +0x198 and
 * replaces main-engine DISPCNT bits 8..12 with +0x48. Always returns zero;
 * the register write directly affects Nintendo DS display-layer selection.
 */
extern "C" s32 func_ov027_021fe06c(void *scene)
{
    if (FIELD(u32, scene, 0x20) & 0x400) {
        func_ov048_0220ba90((u8 *)scene + 0x198);
        volatile u32 *const dispcnt = (volatile u32 *)0x04000000;
        *dispcnt = (*dispcnt & ~0x1f00u) |
                   (FIELD(u32, scene, 0x48) << 8);
    }
    return 0;
}

/*
 * Initializes graphics context +0x198, selects display mask +0x48=0x11,
 * applies the fixed 0x7FFF/0x1F/0x7FFF/0x3F display parameters, and enables
 * field +0x80. Returns void and affects Nintendo DS graphics state.
 */
extern "C" void func_ov027_021fe0ac(void *scene)
{
    func_ov048_0220b7b8((u8 *)scene + 0x198);
    FIELD(s32, scene, 0x48) = 0x11;
    func_020b0300(0x7fff, 0x1f, 0x7fff, 0x3f, 0);
    FIELD(s32, scene, 0x80) = 1;
}
