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

UtilAnimationResource *UtilAnimationResource_Init(
    UtilAnimationResource *self, u32 selector, void *owner0, void *owner1,
    u32 variant, void *resource0, void *resource1, void *resource2, s32 origin);
TouchPoint *TouchPoint_InitZero(TouchPoint *point);
UtilAnimationResource *UtilAnimationResource_Destroy(UtilAnimationResource *self);
UtilAnimationResource *UtilAnimationResource_DestroyAndFree(UtilAnimationResource *self);
void UtilAnimationResource_UpdatePosition(UtilAnimationResource *self, const TouchPoint *position);
void TouchPoint_Subtract(TouchPoint *difference, const TouchPoint *left,
                   const TouchPoint *right);
void UtilAnimationResource_ApplyHandlePosition(UtilAnimationResource *self,
                   AnimationBindingHandle *handle,
                   const TouchPoint *position);

#ifdef __cplusplus
}
#endif

#endif
