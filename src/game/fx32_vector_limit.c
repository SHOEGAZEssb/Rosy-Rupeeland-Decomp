#include "tingle/types.h"

/*
 * Recovered two-component fixed-point vector magnitude limiter. For vectors
 * above a caller-supplied maximum, independently rounded component rescaling
 * approximately preserves direction and moves the magnitude toward that
 * maximum.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are distinct, nonnull pointers to signed 20.12 X/Y components and a
 * nonnegative maximum magnitude in the same units. Measure the vector with
 * Fx32Vector2_Magnitude. If it is already at or below the maximum, return
 * unchanged. Otherwise divide each component by the original magnitude
 * through func_020adc90, multiply by the maximum, add fixed-point rounding
 * bias 0x800, shift by 12, and store both rescaled components. Independent
 * fixed-point rounding can perturb direction and leave the recomputed
 * magnitude slightly above or below the target; this is not a strict
 * postcondition clamp. No value is returned. The two caller-owned words may
 * change; the division and DS square-root helpers have their documented
 * SDK/hardware effects. Retail callers satisfy the pointer and maximum
 * contracts; this helper does not validate them.
 */
void Fx32Vector2_LimitMagnitude(s32 *x, s32 *y, s32 maximumMagnitude)
{
    s32 magnitude = Fx32Vector2_Magnitude(*x, *y);
    s64 product;
    if (magnitude <= maximumMagnitude)
        return;
    product = (s64)func_020adc90(*x, magnitude) * maximumMagnitude + 0x800;
    *x = (s32)(product >> 12);
    product = (s64)func_020adc90(*y, magnitude) * maximumMagnitude + 0x800;
    *y = (s32)(product >> 12);
}
