#include "tingle/actor_motion.h"
#include "tingle/touch_region.h"

/*
 * Per-frame update for the bounded/jittered ActorMotion subclass. It advances
 * scripted motion, clamps it to a viewport, or follows the bound actor with an
 * optional random displacement before sampling configured oscillation.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32 value, u32 modulus);
#ifdef __cplusplus
}
#endif

/*
 * Update one motion frame. Mode 2 advances stored X/Y deltas until the signed
 * count becomes negative, then snaps to the retained destination and clamps X
 * to [bounds[0], bounds[2]-256] and Y to [bounds[1], bounds[3]-192]. Other
 * modes follow the bound actor; while the derived countdown is positive, two
 * global PRNG draws add independent offsets in [-radius, radius). Oscillation
 * flag 0x2 then refreshes the trailing sampled offsets. Returns no value;
 * global MT state advances only when jitter is active, and no hardware changes.
 */
void ActorMotionJitter_Update(ActorMotionJitter *self, const s16 *bounds)
{
    ActorMotion *motion = &self->base;
    const RectS16 *viewport = (const RectS16 *)bounds;

    if (motion->mode == 2) {
        if ((motion->velocityX | motion->velocityY) != 0) {
            if (motion->remainingSteps >= 0) {
                motion->flags |= ACTOR_MOTION_FLAG_MOVING;
                --motion->remainingSteps;
                motion->position.value.x += motion->velocityX;
                motion->position.value.y += motion->velocityY;
            } else {
                motion->flags &= ~ACTOR_MOTION_FLAG_MOVING;
                motion->position.value.x = motion->destinationX;
                motion->position.value.y = motion->destinationY;
                motion->velocityX = 0;
                motion->velocityY = 0;
            }
        }

        if ((motion->position.value.x >> 12) < viewport->left)
            motion->position.value.x = viewport->left << 12;
        if ((motion->position.value.x >> 12) + 0x100 >= viewport->right)
            motion->position.value.x = (viewport->right - 0x100) << 12;
        if ((motion->position.value.y >> 12) < viewport->top)
            motion->position.value.y = viewport->top << 12;
        if ((motion->position.value.y >> 12) + 0xc0 >= viewport->bottom)
            motion->position.value.y = (viewport->bottom - 0xc0) << 12;
    } else {
        VecFx32Object position;

        VecFx32Object_Init(&position);
        if (motion->actor != 0) {
            VecFx32Object actorPosition;

            if (motion->mode == 0)
                motion->mode = 1;
            ActorMotion_GetBoundActorTargetPosition(&actorPosition, motion);
            VecFx32Object_Assign(&position, &actorPosition);
            VecFx32Object_Destroy(&actorPosition);

            if (self->remainingFrames > 0) {
                s32 span;
                s32 random;

                --self->remainingFrames;
                span = self->radius * 2;
                random = (s32)(func_020bf1f8(genrand_int32(), (u32)span) >> 32);
                position.value.x += (self->radius - random) << 12;
                random = (s32)(func_020bf1f8(genrand_int32(), (u32)span) >> 32);
                position.value.y += (self->radius - random) << 12;
            }
            VecFx32Object_Assign(&motion->position, &position);
        }
        VecFx32Object_Destroy(&position);
    }

    if (motion->flags & ACTOR_MOTION_FLAG_OSCILLATION)
        ActorMotion_UpdateOscillation(motion);
}
