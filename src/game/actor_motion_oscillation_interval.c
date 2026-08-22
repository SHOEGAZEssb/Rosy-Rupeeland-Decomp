#include "tingle/actor_motion.h"

/*
 * Scalar interval construction for actor oscillation. This is a separate
 * retail object from the caller, which preserves external call relocations in
 * ActorMotion_SetOscillation even though both functions are adjacent in ROM.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);

/*
 * Encode first/second as a half-range, midpoint, and 16.16 phase increment.
 * The result is caller-owned, division follows the fixed-point SDK helper,
 * and no state outside result changes. Returns result.
 */
ActorMotionTriple *ActorMotionOscillation_InitInterval(ActorMotionTriple *result,
                                                       s32 first, s32 second,
                                                       s32 duration)
{
    s32 minimum = first <= second ? first : second;
    s32 difference = first - second;
    s32 half = (difference + (s32)((u32)difference >> 31)) >> 1;

    result->x = half;
    if (half < 0)
        half = -half;
    result->y = minimum + half;
    result->z = func_020befec(0x10000, duration);
    return result;
}

#ifdef __cplusplus
}
#endif
