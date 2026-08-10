#ifndef TINGLE_VEC_FX32_STEPPER_H
#define TINGLE_VEC_FX32_STEPPER_H

#include "tingle/vec_fx32.h"

typedef struct VecFx32Stepper {
    VecFx32Object target;
    VecFx32Object current;
    VecFx32Object step;
    s32 remainingFrames;
} VecFx32Stepper;

typedef char VecFx32StepperSizeCheck[
    sizeof(VecFx32Stepper) == 0x34 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void VecFx32Stepper_CopyState(VecFx32Stepper *self, const VecFx32Stepper *source);
VecFx32Stepper *VecFx32Stepper_Init(VecFx32Stepper *self);
void VecFx32_Subtract(VecFx32Object *result, const VecFx32Object *left,
                      const VecFx32Object *right);
VecFx32Stepper *VecFx32Stepper_InitTransition(VecFx32Stepper *self,
                                               const VecFx32Object *target,
                                               const VecFx32Object *current,
                                               s32 duration);
VecFx32Stepper *VecFx32Stepper_Assign(VecFx32Stepper *self,
                                      const VecFx32Stepper *source);
VecFx32Stepper *VecFx32Stepper_Destroy(VecFx32Stepper *self);
s32 VecFx32Stepper_Update(VecFx32Stepper *self);
VecFx32Object *VecFx32Stepper_GetCurrent(VecFx32Stepper *self);
VecFx32Object *VecFx32Stepper_GetStep(VecFx32Stepper *self);
VecFx32Object *VecFx32Stepper_GetTarget(VecFx32Stepper *self);
s32 VecFx32Stepper_IsComplete(const VecFx32Stepper *self);
void VecFx32Stepper_Reset(VecFx32Stepper *self);

#ifdef __cplusplus
}
#endif

#endif
