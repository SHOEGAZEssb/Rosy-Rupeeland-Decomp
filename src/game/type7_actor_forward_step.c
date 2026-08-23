#include "tingle/actor.h"

/*
 * Recovered forward-step transition for the type-seven actor. It probes the
 * cell ahead of a moving actor and begins a short vertical transition when the
 * next cell is exactly one level above the current level.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SaveAndForceFlags(Actor *actor);
extern s32 Actor_QueryTerrainHeight(Actor *actor, s32 gridX, s32 gridY);
extern s32 Actor_IsTerrainFootprintEligibleAtHeight(
    Actor *actor, s32 worldXFx32, s32 worldYFx32,
    s32 referenceHeightFx32);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020adc90(s32 value, s32 length);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Proceed only while current height equals cached
 * terrain height and a low-nibble pair-state direction is present with nonzero
 * derived magnitude field +0x240. Project velocity by 0x11000 divided by that
 * magnitude, then query the projected cell. If it is exactly one terrain level
 * (16 world units) above the cached height and the projected footprint is
 * eligible, store the transition target, save/force actor flags, and begin a
 * 24-frame interpolation. Per-frame X/Y deltas are the projected deltas divided
 * by 24; vertical velocity is cleared. Return one when the transition begins,
 * otherwise zero. Actor state and collision-query state may change; there are
 * no direct SDK or hardware effects.
 */
s32 Type7Actor_TryStartForwardStepTransition(Actor *self)
{
    s32 directionPresent;

    if (self->position.value.z != self->cachedTerrainHeight)
        return 0;

    directionPresent =
        ((self->pairStateBytes[0] | self->pairStateBytes[1]) & 0xf) != 0;
    if (!directionPresent || *(u32 *)((u8 *)self + 0x240) == 0)
        return 0;

    {
        s32 projectionMultiplier =
            func_020adc90(0x11000, *(s32 *)((u8 *)self + 0x240)) >> 12;
        s32 projectedXFx32 = self->position.value.x +
            self->velocity.value.x * projectionMultiplier;
        s32 projectedYFx32 = self->position.value.y +
            self->velocity.value.y * projectionMultiplier;
        s32 projectedTerrainHeight = Actor_QueryTerrainHeight(
            self, projectedXFx32 >> 16, projectedYFx32 >> 16);
        s32 projectedTerrainHeightFx32 = projectedTerrainHeight << 16;

        if (self->cachedTerrainHeight + 0x10000 != projectedTerrainHeightFx32
            || Actor_IsTerrainFootprintEligibleAtHeight(
                    self, projectedXFx32, projectedYFx32,
                    projectedTerrainHeightFx32) == 0)
            return 0;

        self->positionTransitionTarget.value.x = projectedXFx32;
        self->positionTransitionTarget.value.y = projectedYFx32;
        self->positionTransitionTarget.value.z = projectedTerrainHeightFx32;
        Actor_SaveAndForceFlags(self);
        self->positionTransitionState = 0;
        self->positionTransitionTimer =
            ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES;
        self->positionTransitionDeltaX = func_020adae4(
            self->velocity.value.x * projectionMultiplier,
            ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES);
        self->positionTransitionDeltaY = func_020adae4(
            self->velocity.value.y * projectionMultiplier,
            ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES);
        self->velocity.value.z = 0;
    }
    return 1;
}
