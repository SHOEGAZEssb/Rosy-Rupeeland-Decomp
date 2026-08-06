#include "tingle/types.h"

/*
 * Recovered two-component fixed-point vector limiter. It preserves direction
 * while reducing vectors whose magnitude exceeds a caller-supplied maximum.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are pointers to signed 20.12 X/Y components and a maximum magnitude.
 * Measure the vector with func_0204cfa4. If it is already at or below the
 * maximum, return unchanged. Otherwise divide each component by the original
 * magnitude through func_020adc90, multiply by the maximum, add fixed-point
 * rounding bias 0x800, shift by 12, and store both reduced components. No value
 * is returned. The two caller-owned words may change; the division and DS
 * square-root helpers have their documented SDK/hardware effects.
 */
void func_0204cff4(s32 *x, s32 *y, s32 maximum)
{
    s32 magnitude = func_0204cfa4(*x, *y);
    s64 product;
    if (magnitude <= maximum)
        return;
    product = (s64)func_020adc90(*x, magnitude) * maximum + 0x800;
    *x = (s32)(product >> 12);
    product = (s64)func_020adc90(*y, magnitude) * maximum + 0x800;
    *y = (s32)(product >> 12);
}
