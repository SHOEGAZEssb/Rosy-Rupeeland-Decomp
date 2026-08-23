#include "tingle/vec_fx32.h"

/* Divide a fixed-point vector into initialized output storage. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Initialize destination, then fixed-point-divide source X/Y/Z by divisor.
 * Returns no value. VecFx32Object_Init establishes the vector's runtime
 * metadata, while func_020adc90 supplies signed Q20.12 division and therefore
 * inherits its zero-divisor rules.
 */
void VecFx32Object_DivideByScalar(VecFx32Object *destination,
                                  const VecFx32Object *source, fx32 divisor)
{
    VecFx32Object_Init(destination);
    destination->value.x = func_020adc90(source->value.x, divisor);
    destination->value.y = func_020adc90(source->value.y, divisor);
    destination->value.z = func_020adc90(source->value.z, divisor);
}
