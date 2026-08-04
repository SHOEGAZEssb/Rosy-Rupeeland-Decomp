#ifndef TINGLE_UTIL_ANIMATION_RESOURCE_H
#define TINGLE_UTIL_ANIMATION_RESOURCE_H

#include "tingle/animation_binding.h"
#include "tingle/scene_touch.h"

typedef struct UtilAnimationResource UtilAnimationResource;

typedef struct UtilAnimationResourceVTable {
    UtilAnimationResource *(*destroy)(UtilAnimationResource *self);
    UtilAnimationResource *(*destroyAndFree)(UtilAnimationResource *self);
    void *unknown08;
    const void *rtti;
} UtilAnimationResourceVTable;

struct UtilAnimationResource {
    const UtilAnimationResourceVTable *vtable;
    AnimationBindingHandle *handles[2];
    u32 selector;
    s32 origin;
    TouchPoint position;
};

typedef char UtilAnimationResourceSizeCheck[
    sizeof(UtilAnimationResource) == 0x20 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern UtilAnimationResourceVTable data_020d4168;

UtilAnimationResource *func_0200572c(
    UtilAnimationResource *self, u32 selector, void *owner0, void *owner1,
    u32 variant, void *resource0, void *resource1, void *resource2, s32 origin);
TouchPoint *func_020057dc(TouchPoint *point);
UtilAnimationResource *func_020057f8(UtilAnimationResource *self);
UtilAnimationResource *func_020057fc(UtilAnimationResource *self);
void func_02005810(UtilAnimationResource *self, const TouchPoint *position);
void func_02005880(TouchPoint *difference, const TouchPoint *left,
                   const TouchPoint *right);
void func_020058b8(UtilAnimationResource *self,
                   AnimationBindingHandle *handle,
                   const TouchPoint *position);

#ifdef __cplusplus
}
#endif

#endif
