#include "tingle/types.h"

/* Overlay 24 timed selection transitions and transition-entry callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const s32 data_ov024_021fe1e4[];
extern const u32 data_ov024_021fe300[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020919e8(s32, s32, s32, s32);
extern void func_02028100(void *, s32);
extern void func_02091b98(void *, s32);
extern void func_020755bc(void *);
extern void func_ov005_021fbd64(void *, s32, s32);
extern void func_ov005_021fbd74(void *, s32);
extern void func_ov024_021fce04(void *, void *, void *);
extern void func_ov046_0220bffc(void *, s32, s32, s32);
extern s32 func_ov046_0220c3bc(void *, s32);
extern s32 func_ov046_0220c410(void *, s32);
extern void func_ov046_0220c46c(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Starts a timed transition toward `target`: stores target +0x2F4 and duration
 * +0x2EC, and clears elapsed counter +0x2F0. No child is updated yet and there
 * is no return value.
 */
extern "C" void func_ov024_021fdab0(void *scene, s32 target, s32 duration)
{
    FIELD(s32, scene, 0x2f4) = target;
    FIELD(s32, scene, 0x2ec) = duration;
    FIELD(s32, scene, 0x2f0) = 0;
}

/* Metrowerks' fixed-point interpolation is performed at eight fractional bits. */
static s32 interpolate_8(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 value = func_020919e8(start << 8, end << 8, duration, elapsed);
    return (value + ((u32)(value >> 7) >> 24)) >> 8;
}

/*
 * Advances the transition configured by func_ov024_021FDAB0. It interpolates
 * overlay-46 panel coordinates and overlay-5 displacement from current
 * selection +0x290 to target +0x2F4, updates display-mode bits +0x48, and at
 * the midpoint commits debug/panel/menu selection and restarts the 120-tick
 * transition. It clears duration when elapsed reaches it. Returns one only
 * when called with no active transition, otherwise zero; UI state changes.
 */
extern "C" s32 func_ov024_021fdac4(void *scene)
{
    s32 duration = FIELD(s32, scene, 0x2ec);
    if (duration == 0) return 1;
    s32 elapsed = ++FIELD(s32, scene, 0x2f0);
    s32 selection = FIELD(s32, scene, 0x290);
    s32 target = FIELD(s32, scene, 0x2f4);
    void *panel = FIELD(void *, scene, 0x2c0);

    s32 x = interpolate_8(func_ov046_0220c3bc(panel, selection),
                          func_ov046_0220c3bc(panel, target),
                          duration, elapsed);
    s32 y = interpolate_8(func_ov046_0220c410(panel, selection),
                          func_ov046_0220c410(panel, target),
                          duration, elapsed);
    func_ov046_0220c46c(panel, x, y);
    FIELD(s32, scene, 0x2e8) = interpolate_8(
        data_ov024_021fe1e4[selection], data_ov024_021fe1e4[target],
        duration, elapsed);
    func_ov005_021fbd64(FIELD(void *, scene, 0x2bc), 0,
                        -FIELD(s32, scene, 0x2e8));
    FIELD(u32, scene, 0x48) |= 7;
    if (FIELD(s32, scene, 0x2e8) < 0xc0)
        FIELD(u32, scene, 0x48) &= ~4u;
    else
        FIELD(u32, scene, 0x48) &= ~1u;

    if (elapsed == ((duration + (s32)((u32)duration >> 31)) >> 1)) {
        func_02028100(FIELD(void *, scene, 0x2c4), target);
        func_ov046_0220bffc(panel, target, 0, 0);
        func_ov005_021fbd74(FIELD(void *, scene, 0x2bc), target);
        func_02091b98((u8 *)scene + 0x2c8, 120);
        FIELD(s32, scene, 0x2e4) = 1;
    }
    if (elapsed == duration) FIELD(s32, scene, 0x2ec) = 0;
    return 0;
}

/*
 * Exit-transition callback. Step zero resets the shared graphics/font owner;
 * step one enables scene flag bit 0, starts a 12-tick transition to one past
 * unlocked limit +0x60, and installs callback pair data_ov024_021FE300.
 * Other steps are inert. Returns zero; graphics, flags, tween, and callback
 * state may change.
 */
extern "C" s32 func_ov024_021fdc54(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        func_020755bc(data_020f4e14);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
    }
    if (FIELD(s32, scene, 4) == 1) {
        FIELD(u32, scene, 0x20) = (FIELD(u32, scene, 0x20) & ~1u) | 1u;
        func_ov024_021fdab0(scene, FIELD(s32, scene, 0x60) + 1, 12);
        func_ov024_021fce04(scene, (void *)data_ov024_021fe300[0],
                           (void *)data_ov024_021fe300[1]);
    }
    return 0;
}
