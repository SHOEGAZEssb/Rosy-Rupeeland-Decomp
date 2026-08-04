#ifndef TINGLE_VEC_FX32_STEPPER_H
#define TINGLE_VEC_FX32_STEPPER_H

#include "tingle/vec_fx32.h"

typedef struct VecFx32Stepper {
    VecFx32Object first;
    VecFx32Object second;
    VecFx32Object delta;
    s32 remaining;
} VecFx32Stepper;

typedef char VecFx32StepperSizeCheck[
    sizeof(VecFx32Stepper) == 0x34 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void func_02006644(VecFx32Stepper *self, const VecFx32Stepper *source);
VecFx32Stepper *func_02006678(VecFx32Stepper *self);
void func_020066a4(VecFx32Object *result, const VecFx32Object *left,
                   const VecFx32Object *right);
VecFx32Stepper *func_020066dc(VecFx32Stepper *self,
                              const VecFx32Object *first,
                              const VecFx32Object *second, s32 duration);
VecFx32Stepper *func_0200676c(VecFx32Stepper *self,
                              const VecFx32Stepper *source);
VecFx32Stepper *func_02006788(VecFx32Stepper *self);
s32 func_020067b0(VecFx32Stepper *self);
VecFx32Object *func_020067f4(VecFx32Stepper *self);
VecFx32Object *func_020067fc(VecFx32Stepper *self);
s32 func_02006804(const VecFx32Stepper *self);
void func_02006818(VecFx32Stepper *self);

#ifdef __cplusplus
}
#endif

#endif
