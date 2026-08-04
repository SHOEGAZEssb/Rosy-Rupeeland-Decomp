#ifndef TINGLE_VEC_FX32_TRIPLE_H
#define TINGLE_VEC_FX32_TRIPLE_H

#include "tingle/vec_fx32.h"

typedef struct VecFx32Triple {
    VecFx32Object first;
    VecFx32Object second;
    VecFx32Object third;
} VecFx32Triple;

typedef char VecFx32TripleSizeCheck[
    sizeof(VecFx32Triple) == 0x30 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

VecFx32Triple *func_02006328(VecFx32Triple *self);
void func_0200634c(VecFx32Triple *self, const VecFx32Object *first,
                   const VecFx32Object *second, const VecFx32Object *third);
VecFx32Triple *func_0200637c(VecFx32Triple *self);
void func_020063a4(VecFx32Object *result, const VecFx32Triple *points,
                   fx32 t);
void func_020064b8(VecFx32Object *result, const VecFx32Triple *points,
                   fx32 t);

#ifdef __cplusplus
}
#endif

#endif
