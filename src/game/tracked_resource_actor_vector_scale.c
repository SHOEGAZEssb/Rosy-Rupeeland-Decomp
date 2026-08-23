#include "tingle/vec_fx32.h"

/* Divide a fixed-point vector in place by a Q20.12 scalar. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Replace X/Y/Z with func_020adc90(component, divisor), preserving the vtable.
 * Returns nothing and has no direct SDK or hardware effects. The operation
 * inherits the shared signed Q20.12 divider's zero-divisor behavior.
 */
void VecFx32Object_DivideInPlaceByScalar(VecFx32Object *vector, fx32 divisor)
{
    vector->value.x = func_020adc90(vector->value.x, divisor);
    vector->value.y = func_020adc90(vector->value.y, divisor);
    vector->value.z = func_020adc90(vector->value.z, divisor);
}
