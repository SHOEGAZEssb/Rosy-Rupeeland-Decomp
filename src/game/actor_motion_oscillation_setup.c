#include "tingle/actor_motion.h"

/*
 * Symmetric oscillation setup for actor motion. Two compact triples retain a
 * half-range, midpoint, and fixed-point phase increment for later sampling.
 */

/*
 * Enable motion flag 0x2 and configure independent X and Y oscillations from
 * negative to positive tile amplitudes over duration. Embedded movement state
 * changes; temporary vector construction has no SDK or hardware side effects.
 */
void ActorMotion_SetOscillation(ActorMotion *self, s32 xAmplitude, s32 yAmplitude,
                   s32 duration)
{
    VecFx32Object amplitudes;
    ActorMotionTriple second;
    ActorMotionTriple first;

    self->flags |= ACTOR_MOTION_FLAG_OSCILLATION;
    VecFx32Object_InitComponents(&amplitudes, xAmplitude << 12, yAmplitude << 12, 0);
    ActorMotionOscillation_InitInterval(&first, -amplitudes.value.x,
                  amplitudes.value.x, duration);
    ActorMotionTriple_Assign(&self->state.xOscillation, &first);
    ActorMotionOscillation_InitInterval(&second, -amplitudes.value.y,
                  amplitudes.value.y, duration);
    ActorMotionTriple_Assign(&self->state.yOscillation, &second);
    VecFx32Object_Destroy(&amplitudes);
}
