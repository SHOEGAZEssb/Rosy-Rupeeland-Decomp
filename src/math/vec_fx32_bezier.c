#include "tingle/vec_fx32_triple.h"

/*
 * Fixed-point quadratic Bézier evaluation over a VecFx32Triple. The recovered
 * member order is first endpoint, second endpoint, then control point.
 */

#define FX32_ONE 0x1000
#define FX32_MUL(left, right) \
    ((fx32)(((s64)(left) * (s64)(right) + 0x800) >> 12))

/*
 * Construct result and evaluate only x/y at parameter t. The constructor
 * leaves z at zero. Inputs and output use 20.12 fixed point, each product is
 * rounded independently, no external state changes, and no value is returned.
 */
void VecFx32Bezier_Evaluate2D(VecFx32Object *result, const VecFx32Triple *points,
                   fx32 t)
{
    fx32 inverse = FX32_ONE - t;
    fx32 firstWeight;
    fx32 controlWeight;
    fx32 secondWeight;

    VecFx32Object_Init(result);
    firstWeight = FX32_MUL(inverse, inverse);
    controlWeight = FX32_MUL(t * 2, inverse);
    secondWeight = FX32_MUL(t, t);

    result->value.x = FX32_MUL(firstWeight, points->first.value.x);
    result->value.x += FX32_MUL(controlWeight, points->third.value.x);
    result->value.x += FX32_MUL(secondWeight, points->second.value.x);
    result->value.y = FX32_MUL(firstWeight, points->first.value.y);
    result->value.y += FX32_MUL(controlWeight, points->third.value.y);
    result->value.y += FX32_MUL(secondWeight, points->second.value.y);
}

/*
 * Construct result and evaluate x/y/z with the same independently rounded
 * quadratic weights. Only result changes and no value is returned.
 */
void VecFx32Bezier_Evaluate3D(VecFx32Object *result, const VecFx32Triple *points,
                   fx32 t)
{
    fx32 inverse = FX32_ONE - t;
    fx32 firstWeight;
    fx32 controlWeight;
    fx32 secondWeight;

    VecFx32Object_Init(result);
    firstWeight = FX32_MUL(inverse, inverse);
    controlWeight = FX32_MUL(t * 2, inverse);
    secondWeight = FX32_MUL(t, t);

    result->value.x = FX32_MUL(firstWeight, points->first.value.x);
    result->value.x += FX32_MUL(controlWeight, points->third.value.x);
    result->value.x += FX32_MUL(secondWeight, points->second.value.x);
    result->value.y = FX32_MUL(firstWeight, points->first.value.y);
    result->value.y += FX32_MUL(controlWeight, points->third.value.y);
    result->value.y += FX32_MUL(secondWeight, points->second.value.y);
    result->value.z = FX32_MUL(firstWeight, points->first.value.z);
    result->value.z += FX32_MUL(controlWeight, points->third.value.z);
    result->value.z += FX32_MUL(secondWeight, points->second.value.z);
}

#undef FX32_MUL
#undef FX32_ONE
