#include "tingle/types.h"

/*
 * Recovered extended type-two actor direction gate. It computes actor-to-actor
 * displacement and tests it against a mode-specific angular acceptance rule.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * Compute other +0x1c/+0x20 minus actor +0x1c/+0x20 and forward actor, mode,
 * and that fixed-point displacement to ActorExtendedType2_IsDirectionDisplacementAccepted. Returns its boolean
 * result. Inputs are read only and no SDK or hardware state changes.
 */
s32 ActorExtendedType2_IsDirectionToActorAccepted(const void *self, s32 mode, const void *other)
{
    const u8 *actor = (const u8 *)self;
    const u8 *target = (const u8 *)other;
    extern s32 ActorExtendedType2_IsDirectionDisplacementAccepted(const void *, s32, s32, s32);
    return ActorExtendedType2_IsDirectionDisplacementAccepted(actor, mode,
                         *(const s32 *)(target + 0x1c) - *(const s32 *)(actor + 0x1c),
                         *(const s32 *)(target + 0x20) - *(const s32 *)(actor + 0x20));
}

/*
 * Return one unconditionally for mode one and for a zero displacement. Mode two
 * computes the displacement angle through func_020ae024, wraps its difference
 * from actor angle +0xc8 to the shorter 16-bit arc, and returns one when that
 * difference is below 0x2ee0. Other cases return zero. Actor and displacement
 * are read only; the angle helper has no documented hardware effect.
 */
s32 ActorExtendedType2_IsDirectionDisplacementAccepted(const void *self, s32 mode, s32 deltaX, s32 deltaY)
{
    const u8 *actor = (const u8 *)self;
    if (mode == 1 || (deltaX == 0 && deltaY == 0))
        return 1;
    if (mode == 2) {
        s32 angle = func_020ae024(deltaY, deltaX);
        s32 facing = *(const s32 *)(actor + 0xc8);
        s32 difference;
        if (angle < facing)
            angle += 0x10000;
        difference = angle - facing;
        if (difference > 0x8000)
            difference = 0x10000 - difference;
        if (difference < 0x2ee0)
            return 1;
    }
    return 0;
}
