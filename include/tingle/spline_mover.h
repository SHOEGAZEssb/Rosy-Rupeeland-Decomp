#ifndef TINGLE_SPLINE_MOVER_H
#define TINGLE_SPLINE_MOVER_H

#include "tingle/vec_fx32_triple.h"

typedef struct SplineMover {
    const void *vtable;
    VecFx32Triple points;
    fx32 parameter;
    fx32 parameterStep;
} SplineMover;

typedef char SplineMoverSizeCheck[sizeof(SplineMover) == 0x3c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

SplineMover *SplineMover_Init(SplineMover *self);
SplineMover *SplineMover_Destroy(SplineMover *self);
SplineMover *SplineMover_DestroyAndFree(SplineMover *self);
SplineMover *SplineMover_InitTransition(SplineMover *self,
                                        const VecFx32Object *target,
                                        const VecFx32Object *current,
                                        const VecFx32Object *control,
                                        s32 duration);
SplineMover *SplineMover_Assign(SplineMover *self,
                                const SplineMover *source);
s32 SplineMover_Update(SplineMover *self);
void SplineMover_Evaluate2D(VecFx32Object *result, const SplineMover *self);

#ifdef __cplusplus
}
#endif

#endif
