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

VecFx32Triple *VecFx32Triple_Init(VecFx32Triple *self);
void VecFx32Triple_Set(VecFx32Triple *self, const VecFx32Object *first,
                       const VecFx32Object *second,
                       const VecFx32Object *third);
VecFx32Triple *VecFx32Triple_Destroy(VecFx32Triple *self);
VecFx32Triple *VecFx32Triple_InitWithValues(VecFx32Triple *self,
                                            const VecFx32Object *first,
                                            const VecFx32Object *second,
                                            const VecFx32Object *third);
VecFx32Triple *VecFx32Triple_InitCopy(VecFx32Triple *self,
                                     const VecFx32Triple *source);
VecFx32Triple *VecFx32Triple_Assign(VecFx32Triple *self,
                                   const VecFx32Triple *source);
void VecFx32Bezier_Evaluate2D(VecFx32Object *result, const VecFx32Triple *points,
                              fx32 t);
void VecFx32Bezier_Evaluate3D(VecFx32Object *result, const VecFx32Triple *points,
                              fx32 t);

#ifdef __cplusplus
}
#endif

#endif
