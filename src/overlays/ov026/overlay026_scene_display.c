#include "tingle/types.h"

/* Overlay 26 scene display callback, range/scale setup, and graphics-state initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u16 data_ov026_02204300[];
extern const u16 data_ov026_02204302[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02092850(s32);
extern void func_020add34(void *, void *);
extern void func_020b0300(u16, s32, s32, s32, s32);
extern void func_020b0374(s32, s32, s32, s32);
extern void func_ov048_0220b7b8(void *);
extern void func_ov048_0220ba90(void *);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag bit 10 at +0x20 is set, advances display helper +0x370 and
 * replaces main-display BG mode bits 8..12 with +0x48. Always returns zero.
 */
extern "C" s32 func_ov026_0220031c(void *scene)
{
    if ((FIELD(u32, scene, 0x20) >> 10) & 1) {
        func_ov048_0220ba90((u8 *)scene + 0x370);
        volatile u32 *display_control = (volatile u32 *)0x04000000;
        *display_control = (*display_control & ~0x1f00) |
                           (FIELD(u32, scene, 0x48) << 8);
    }
    return 0;
}

/*
 * Stores range endpoints in +0x794/+0x798, clears interpolation +0x79C, and
 * copies `scale_x`/`scale_y` into composite effect +0x160 fields +0x134/+0x138.
 * Returns void.
 */
extern "C" void func_ov026_0220035c(void *scene, s32 range0, s32 range1,
                                      s32 scale_x, s32 scale_y)
{
    FIELD(s32, scene, 0x794) = range0;
    FIELD(s32, scene, 0x798) = range1;
    FIELD(s32, scene, 0x79c) = 0;
    void *effect = FIELD(void *, scene, 0x160);
    FIELD(s32, effect, 0x134) = scale_x;
    FIELD(s32, effect, 0x138) = scale_y;
}

/*
 * Initializes helper +0x370 and fixed DS graphics state, selects palette/color
 * entries using variant +0x58, writes the selected value to 0x04000358, sets
 * camera vector +0x180 to (0x1000,-0x2000,0), enables recovered camera flags,
 * and passes 0x7FFF to the SDK display routine. Returns void.
 */
extern "C" void func_ov026_02200390(void *scene)
{
    func_ov048_0220b7b8((u8 *)scene + 0x370);
    FIELD(s32, scene, 0x48) = 0x11;
    func_020b0374(1, 0, 2, 0x6000);
    s32 variant = FIELD(s32, scene, 0x58);
    func_020b0300(data_ov026_02204300[variant * 4], 0x1f,
                  0x7fff, 0x3f, 0);
    *(volatile u32 *)0x04000358 = data_ov026_02204302[variant * 4];
    FIELD(u16, scene, 0x18e) = 1;
    FIELD(s32, scene, 0x180) = 0x1000;
    FIELD(s32, scene, 0x184) = -0x2000;
    FIELD(s32, scene, 0x188) = 0;
    func_020add34((u8 *)scene + 0x180, (u8 *)scene + 0x180);
    FIELD(u16, scene, 0x18e) = 1;
    FIELD(u16, scene, 0x18c) = 0x7fff;
    FIELD(s32, scene, 0x1c0) = 2;
    FIELD(s32, scene, 0x254) = 1;
    func_02092850(0x7fff);
}
