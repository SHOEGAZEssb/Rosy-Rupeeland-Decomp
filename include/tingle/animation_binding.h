#ifndef TINGLE_ANIMATION_BINDING_H
#define TINGLE_ANIMATION_BINDING_H

#include "tingle/types.h"

typedef struct AnimationBindingHandle {
    u8 opaque00[0x24];
    u16 flags24;
    u8 opaque26[6];
    s16 x2c;
    s16 y2e;
} AnimationBindingHandle;

typedef char AnimationBindingHandleSizeCheck[
    sizeof(AnimationBindingHandle) == 0x30 ? 1 : -1];

typedef struct AnimationBinding {
    AnimationBindingHandle *handle;
    void *resources[3];
    void *owner;
} AnimationBinding;

typedef char AnimationBindingSizeCheck[
    sizeof(AnimationBinding) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

AnimationBinding *AnimationBinding_Init(AnimationBinding *self, void *owner,
                                void *resource0, void *resource1,
                                void *resource2, u8 variant);
AnimationBinding *AnimationBinding_Destroy(AnimationBinding *self);

#ifdef __cplusplus
}
#endif

#endif
