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

void *func_020068ac(void *self);
SplineMover *func_020068b0(SplineMover *self);
SplineMover *func_020068e0(SplineMover *self);
SplineMover *func_020068f8(SplineMover *self);
VecFx32Triple *func_02006918(VecFx32Triple *self,
                             const VecFx32Object *first,
                             const VecFx32Object *second,
                             const VecFx32Object *third);
VecFx32Triple *func_0200696c(VecFx32Triple *self,
                             const VecFx32Triple *source);
SplineMover *func_020069b8(SplineMover *self,
                           const VecFx32Object *first,
                           const VecFx32Object *second,
                           const VecFx32Object *control, s32 duration);
VecFx32Triple *func_02006a2c(VecFx32Triple *self,
                             const VecFx32Triple *source);
SplineMover *func_02006a5c(SplineMover *self,
                           const SplineMover *source);
s32 func_02006a94(SplineMover *self);
void func_02006acc(VecFx32Object *result, const SplineMover *self);

#ifdef __cplusplus
}
#endif

#endif
