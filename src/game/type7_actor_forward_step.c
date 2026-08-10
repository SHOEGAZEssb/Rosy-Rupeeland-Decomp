#include "tingle/types.h"

/*
 * Recovered forward-step transition for the type-seven actor. It probes the
 * cell ahead of a moving actor and begins a short vertical transition when the
 * next cell is exactly one level above the current level.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SaveAndForceFlags(void *actor);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 func_02034d34(void *actor, s32 x, s32 y, s32 height);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020adc90(s32 value, s32 length);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Proceed only while current height +0x24 equals
 * recovered reference height +0x1dc and a low-nibble direction flag at
 * +0x4a/+0x4b is present with nonzero field +0x240. Project direction vector
 * +0x3c/+0x40 by 0x11000 divided by magnitude field +0x240, then query
 * the projected cell. If it is exactly one fixed-point level above +0x1dc and
 * func_02034d34 accepts the position, copy it to +0xb4..+0xbc, reset related
 * motion state through Actor_SaveAndForceFlags, and begin an 0x18-frame interpolation.
 * The X/Y increments at +0xc0/+0xc4 are the projected deltas divided by 0x18;
 * +0x44 is cleared. Return one when the transition begins, otherwise zero.
 * Actor state and collision-query state may change; there are no direct SDK
 * or hardware effects.
 */
s32 Type7Actor_TryStartForwardStepTransition(void *self)
{
    u8 *actor = (u8 *)self;
    s32 directionPresent;

    if (*(s32 *)(actor + 0x24) != *(s32 *)(actor + 0x1dc))
        return 0;

    directionPresent =
        ((*(u8 *)(actor + 0x4a) | *(u8 *)(actor + 0x4b)) & 0xf) != 0;
    if (!directionPresent || *(u32 *)(actor + 0x240) == 0)
        return 0;

    {
        s32 scale = func_020adc90(0x11000, *(s32 *)(actor + 0x240)) >> 12;
        s32 x = *(s32 *)(actor + 0x1c) + *(s32 *)(actor + 0x3c) * scale;
        s32 y = *(s32 *)(actor + 0x20) + *(s32 *)(actor + 0x40) * scale;
        s32 level = Actor_QueryTerrainHeight(actor, x >> 16, y >> 16);
        s32 height = level << 16;

        if (*(s32 *)(actor + 0x1dc) + 0x10000 != height
            || func_02034d34(actor, x, y, height) == 0)
            return 0;

        *(s32 *)(actor + 0xb4) = x;
        *(s32 *)(actor + 0xb8) = y;
        *(s32 *)(actor + 0xbc) = height;
        Actor_SaveAndForceFlags(actor);
        *(u16 *)(actor + 0xac) = 0;
        *(u16 *)(actor + 0xae) = 0x18;
        *(s32 *)(actor + 0xc0) =
            func_020adae4(*(s32 *)(actor + 0x3c) * scale, 0x18);
        *(s32 *)(actor + 0xc4) =
            func_020adae4(*(s32 *)(actor + 0x40) * scale, 0x18);
        *(u32 *)(actor + 0x44) = 0;
    }
    return 1;
}
