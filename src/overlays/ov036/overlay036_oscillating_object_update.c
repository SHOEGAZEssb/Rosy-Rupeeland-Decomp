#include "tingle/types.h"

/* Overlay 36 oscillating object's five-state motion and resource update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020948d4(void *field, s32 value);
extern void func_ov036_021fe978(void *resource, s32 x, s32 y, s32 z);
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void GraphicsAnimationInstance_SetAnimation(void *resource, s32 selector);
extern void Sound_Play(void *sound, s32 id, s32 mode);
extern void func_02091bac(void *timer, s32 mode, s32 first,
                          s32 second, s32 duration);
extern s32 func_02091bd0(void *timer, s32 mode, s32 first, s32 second);
extern s32 func_02091cf0(void *timer);
extern void func_ov036_02201d60(void *object, s32 value);
#ifdef __cplusplus
}
#endif

/* Implements signed division by 256 with truncation toward zero. */
static s32 divide_by_256(s32 value)
{
    return (value + ((u32)(value >> 7) >> 24)) >> 8;
}

/*
 * Updates a five-state oscillating object and reports when its selected path
 * leaves the recovered vertical bounds. Phase +0xF4 advances by 0x200 modulo
 * 16 bits. State 0 saves X +0x10 at +0xC4 and falls into state 1. In state 1,
 * data_020c9670 supplies a six-unit, signed-truncated oscillation around that
 * X; Y is offset by +0x18 and resource +0xD4 follows the resulting XYZ.
 * Variant +0xCC zero starts a 30-frame timer once Y exceeds 0xC00. Variant one
 * periodically advances the resource selector from resource byte +0x54 plus
 * +0xC8 modulo eight, retargets field +0x4C from +0x50, and returns one above
 * Y=0x1600.
 *
 * State 2 waits for that timer, plays sound 0x1B1, selects resource entry one,
 * marks +0xA0, sets scale 0x400, and starts a 16-frame interpolation. State 3
 * copies the timer sample into vector +0xAC..+0xB4 and interpolates scale from
 * 0x400 to 0x666; on completion it sets flag +0x98 bit zero, selects resource
 * entry two, and advances. State 4 lowers Y by 0x80 per call, updates the
 * resource, and returns one below -0xA00. Otherwise returns zero. Timer,
 * sound, resource selection/position, transforms, flags, and state may change.
 */
extern "C" s32 func_ov036_02201e50(void *object)
{
    FIELD(s32, object, 0xf4) =
        (u16)(FIELD(s32, object, 0xf4) + 0x200);

    switch (FIELD(s32, object, 0xd0)) {
    case 0:
        FIELD(s32, object, 0xc4) = FIELD(s32, object, 0x10);
        ++FIELD(s32, object, 0xd0);
        /* The recovered jump table intentionally continues into state 1. */
    case 1: {
        s32 index = (FIELD(s32, object, 0xf4) >> 4) * 2;
        s32 x = FIELD(s32, object, 0xc4) +
                divide_by_256((s16)data_020c9670[index] * 6);
        func_020948d4((u8 *)object + 0xc, x);
        func_020948d4((u8 *)object + 0x1c,
                      FIELD(s32, object, 0x20) + 0x18);
        func_ov036_021fe978(FIELD(void *, object, 0xd4),
                            FIELD(s32, object, 0x10),
                            FIELD(s32, object, 0x20),
                            FIELD(s32, object, 0x30));
        if (FIELD(s32, object, 0xcc) == 0) {
            if (FIELD(s32, object, 0x20) > 0xc00) {
                func_02091b98((u8 *)object + 0xd8, 0x1e);
                ++FIELD(s32, object, 0xd0);
            }
        } else if (FIELD(s32, object, 0xcc) == 1) {
            if (func_02091c7c((u8 *)object + 0xd8, 2) != 0) {
                func_02091b98((u8 *)object + 0xd8, 0xa);
                void *resource = FIELD(void *, object, 0xd4);
                s32 selector = (FIELD(s32, object, 0xc8) +
                                FIELD(u8, resource, 0x54)) & 7;
                GraphicsAnimationInstance_SetAnimation(resource, selector);
                func_020948d4((u8 *)object + 0x4c,
                              FIELD(s32, object, 0x50) -
                              FIELD(s32, object, 0xc8) * 0x333);
            }
            if (FIELD(s32, object, 0x20) > 0x1600)
                return 1;
        }
        break;
    }
    case 2:
        if (func_02091c7c((u8 *)object + 0xd8, 2) != 0) {
            Sound_Play(gSoundContext, 0x1b1, 0);
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, object, 0xd4), 1);
            FIELD(s32, object, 0xa0) = 1;
            func_020948d4((u8 *)object + 0x6c, 0x400);
            func_02091bac((u8 *)object + 0xd8, 1, 1, 1, 0x10);
            ++FIELD(s32, object, 0xd0);
        }
        break;
    case 3: {
        s32 value = func_02091c7c((u8 *)object + 0xd8, 1);
        func_ov036_02201d60(object, value);
        value = func_02091bd0((u8 *)object + 0xd8, 1, 0x400, 0x666);
        func_020948d4((u8 *)object + 0x6c, value);
        if (func_02091cf0((u8 *)object + 0xd8) != 0) {
            FIELD(u16, object, 0x98) |= 1;
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, object, 0xd4), 2);
            ++FIELD(s32, object, 0xd0);
        }
        break;
    }
    case 4:
        func_020948d4((u8 *)object + 0x1c,
                      FIELD(s32, object, 0x20) - 0x80);
        func_ov036_021fe978(FIELD(void *, object, 0xd4),
                            FIELD(s32, object, 0x10),
                            FIELD(s32, object, 0x20),
                            FIELD(s32, object, 0x30));
        if (FIELD(s32, object, 0x20) < -0xa00)
            return 1;
        break;
    }
    return 0;
}
