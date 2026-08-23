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
extern s32 Actor_QueryTerrainHeight(void *actor, s32 gridX, s32 gridY);
extern s32 Actor_IsTerrainFootprintEligibleAtHeight(
    void *actor, s32 worldXFx32, s32 worldYFx32, s32 referenceHeightFx32);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020adc90(s32 value, s32 length);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Proceed only while current height +0x24 equals
 * recovered reference height +0x1dc and a low-nibble direction flag at
 * +0x4a/+0x4b is present with nonzero field +0x240. Project direction vector
 * +0x3c/+0x40 by 0x11000 divided by magnitude field +0x240, then query the
 * projected cell. If it is exactly one terrain-height level (16 world units)
 * above +0x1dc and the projected terrain footprint is eligible at that height,
 * copy it to +0xb4..+0xbc, reset related motion state through
 * Actor_SaveAndForceFlags, and begin an 0x18-frame interpolation. The X/Y
 * increments at +0xc0/+0xc4 are the projected deltas divided by 0x18; +0x44 is
 * cleared. Return one when the transition begins, otherwise zero. Actor state
 * and collision-query state may change; there are no direct SDK or hardware
 * effects.
 */
s32 Type7Actor_TryStartForwardStepTransition(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    s32 directionPresent;

    if (*(s32 *)(actor + 0x24) != *(s32 *)(actor + 0x1dc))
        return 0;

    directionPresent =
        ((*(u8 *)(actor + 0x4a) | *(u8 *)(actor + 0x4b)) & 0xf) != 0;
    if (!directionPresent || *(u32 *)(actor + 0x240) == 0)
        return 0;

    {
        s32 projectionMultiplier =
            func_020adc90(0x11000, *(s32 *)(actor + 0x240)) >> 12;
        s32 projectedXFx32 = *(s32 *)(actor + 0x1c)
            + *(s32 *)(actor + 0x3c) * projectionMultiplier;
        s32 projectedYFx32 = *(s32 *)(actor + 0x20)
            + *(s32 *)(actor + 0x40) * projectionMultiplier;
        s32 projectedTerrainHeight = Actor_QueryTerrainHeight(
            actor, projectedXFx32 >> 16, projectedYFx32 >> 16);
        s32 projectedTerrainHeightFx32 = projectedTerrainHeight << 16;

        if (*(s32 *)(actor + 0x1dc) + 0x10000
                != projectedTerrainHeightFx32
            || Actor_IsTerrainFootprintEligibleAtHeight(
                    actor, projectedXFx32, projectedYFx32,
                    projectedTerrainHeightFx32) == 0)
            return 0;

        *(s32 *)(actor + 0xb4) = projectedXFx32;
        *(s32 *)(actor + 0xb8) = projectedYFx32;
        *(s32 *)(actor + 0xbc) = projectedTerrainHeightFx32;
        Actor_SaveAndForceFlags(actor);
        *(u16 *)(actor + 0xac) = 0;
        *(u16 *)(actor + 0xae) = 0x18;
        *(s32 *)(actor + 0xc0) =
            func_020adae4(
                *(s32 *)(actor + 0x3c) * projectionMultiplier, 0x18);
        *(s32 *)(actor + 0xc4) =
            func_020adae4(
                *(s32 *)(actor + 0x40) * projectionMultiplier, 0x18);
        *(u32 *)(actor + 0x44) = 0;
    }
    return 1;
}
