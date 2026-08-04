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

extern VecFx32VTable data_020d405c;

VecFx32Object *func_02004fe0(VecFx32Object *self);
VecFx32Object *func_0200500c(VecFx32Object *self, fx32 x, fx32 y, fx32 z);
VecFx32Object *func_02005030(VecFx32Object *self,
                             const VecFx32Object *source);
VecFx32Object *func_02005058(VecFx32Object *self);
VecFx32Object *func_0200505c(VecFx32Object *self);
fx32 func_02005070(const VecFx32Object *self);
void func_02005084(VecFx32Object *self);
VecFx32Object *func_020050a4(VecFx32Object *self,
                             const VecFx32Object *source);
void func_020050c8(VecFx32Object *self, const VecFx32Object *other);
void func_020050f0(VecFx32Object *self, const VecFx32Object *other);

#ifdef __cplusplus
}
#endif

#endif
