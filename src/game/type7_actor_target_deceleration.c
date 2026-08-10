#include "tingle/types.h"

/*
 * Recovered type-seven target-following callback. It tracks a related actor and
 * scales the resulting motion down as the installed callback approaches its
 * duration.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern void Type7Actor_UpdateMotionTowardTransform(void *actor, const void *transform);
extern void func_02048148(void *actor);
extern s32 func_020adae4(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Set actor flag 0x8000 and +0xd0 bit one. If
 * related object +0x210 is absent, dispatch the installed callback and return
 * zero. Otherwise adjust unsigned halfword +0x2a2: add two while actor +0x10
 * bit 0x2000 is set, or decrement a nonzero value while it is clear.
 *
 * Copy related transform +0x18 to temporary +0x78 twice, preserving the retail
 * sequence, then update actor motion. If signed duration +0x24a is positive,
 * calculate an fx32 scale from (duration - elapsed +0x248 - adjustment +0x2a2)
 * divided by duration and clamp it to zero; otherwise use zero. Apply that
 * scale with fx32 rounding to motion words +0x3c/+0x40, select presentation 14,
 * and return zero. Actor, callback, target, and motion state may change; there
 * are no direct SDK or hardware effects.
 */
s32 func_02049ad4(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related;
    s32 scale;
    s64 product;

    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    related = *(u8 **)(actor + 0x210);
    if (related == 0) {
        func_02048148(actor);
        return 0;
    }

    if ((*(u32 *)(actor + 0x10) & 0x2000) != 0) {
        *(u16 *)(actor + 0x2a2) += 2;
    } else if (*(u16 *)(actor + 0x2a2) != 0) {
        --*(u16 *)(actor + 0x2a2);
    }
    func_020050a4(actor + 0x78, related + 0x18);
    related = *(u8 **)(actor + 0x210);
    func_020050a4(actor + 0x78, related + 0x18);
    Type7Actor_UpdateMotionTowardTransform(actor, actor + 0x78);

    if (*(s16 *)(actor + 0x24a) > 0) {
        scale = func_020adae4(
            (*(s16 *)(actor + 0x24a) - *(s16 *)(actor + 0x248)
             - *(u16 *)(actor + 0x2a2)) << 12,
            *(s16 *)(actor + 0x24a));
        if (scale < 0)
            scale = 0;
    } else {
        scale = 0;
    }
    product = (s64)*(s32 *)(actor + 0x3c) * scale + 0x800;
    *(s32 *)(actor + 0x3c) = (s32)(product >> 12);
    product = (s64)*(s32 *)(actor + 0x40) * scale + 0x800;
    *(s32 *)(actor + 0x40) = (s32)(product >> 12);
    *(u16 *)(actor + 0xd6) = 14;
    return 0;
}
