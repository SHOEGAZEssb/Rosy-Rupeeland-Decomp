#include "tingle/actor_motion.h"

/*
 * Symmetric oscillation setup for actor motion. Two compact triples retain a
 * half-range, midpoint, and fixed-point phase increment for later sampling.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Enable motion flag 0x2 and configure independent X and Y oscillations from
 * negative to positive tile amplitudes over duration. Embedded movement state
 * changes; temporary vector construction has no SDK or hardware side effects.
 */
void ActorMotion_SetOscillation(ActorMotion *self, s32 xAmplitude, s32 yAmplitude,
                   s32 duration)
{
    VecFx32Object amplitudes;
    ActorMotionTriple first;
    ActorMotionTriple second;

    self->field_30 |= 2;
    VecFx32Object_InitComponents(&amplitudes, xAmplitude << 12, yAmplitude << 12, 0);
    ActorMotionOscillation_InitInterval(&first, -amplitudes.value.x,
                  amplitudes.value.x, duration);
    ActorMotionTriple_Assign(&self->state.first, &first);
    ActorMotionOscillation_InitInterval(&second, -amplitudes.value.y,
                  amplitudes.value.y, duration);
    ActorMotionTriple_Assign(&self->state.second, &second);
    VecFx32Object_Destroy(&amplitudes);
}

/*
 * Encode a scalar interval for table-driven oscillation. The first word is
 * half the signed difference (truncated toward zero), the second is the
 * interval midpoint, and the third is 0x10000 divided by duration through the
 * fixed-point SDK divider. Returns result and changes no external state.
 */
ActorMotionTriple *ActorMotionOscillation_InitInterval(ActorMotionTriple *result, s32 first,
                                 s32 second, s32 duration)
{
    s32 difference = first - second;
    s32 half = (difference + (s32)((u32)difference >> 31)) >> 1;

    result->x = half;
    if (half < 0)
        half = -half;
    result->y = (first <= second ? first : second) + half;
    result->z = func_020befec(0x10000, duration);
    return result;
}
