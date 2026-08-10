#ifndef TINGLE_VEC_FX32_H
#define TINGLE_VEC_FX32_H

#include "tingle/types.h"

typedef s32 fx32;

typedef struct VecFx32Value {
    fx32 x;
    fx32 y;
    fx32 z;
} VecFx32Value;

typedef struct VecFx32Object VecFx32Object;

typedef struct VecFx32VTable {
    VecFx32Object *(*destroy)(VecFx32Object *self);
    VecFx32Object *(*destroyAndFree)(VecFx32Object *self);
} VecFx32VTable;

struct VecFx32Object {
    const VecFx32VTable *vtable;
    VecFx32Value value;
};

typedef char VecFx32ValueSizeCheck[sizeof(VecFx32Value) == 0xc ? 1 : -1];
typedef char VecFx32ObjectSizeCheck[sizeof(VecFx32Object) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern VecFx32VTable gVecFx32ObjectVTable;

VecFx32Object *VecFx32Object_Init(VecFx32Object *self);
VecFx32Object *VecFx32Object_InitComponents(VecFx32Object *self, fx32 x,
                                            fx32 y, fx32 z);
VecFx32Object *VecFx32Object_InitCopy(VecFx32Object *self,
                                      const VecFx32Object *source);
VecFx32Object *VecFx32Object_Destroy(VecFx32Object *self);
VecFx32Object *VecFx32Object_DestroyAndFree(VecFx32Object *self);
fx32 VecFx32Object_GetMagnitude(const VecFx32Object *self);
void VecFx32Object_Normalize(VecFx32Object *self);
VecFx32Object *VecFx32Object_Assign(VecFx32Object *self,
                                    const VecFx32Object *source);
void VecFx32Object_Add(VecFx32Object *self, const VecFx32Object *other);
void VecFx32Object_Subtract(VecFx32Object *self, const VecFx32Object *other);
void VecFx32Object_ScaleRounded(VecFx32Object *destination,
                                const VecFx32Object *source, fx32 scale);

#ifdef __cplusplus
}
#endif

#endif
