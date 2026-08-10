#ifndef TINGLE_ANIMATION_BINDING_H
#define TINGLE_ANIMATION_BINDING_H

#include "tingle/types.h"

typedef struct AnimationBindingHandle {
    u8 unknown00[0x24];
    u16 flags24;
} AnimationBindingHandle;

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
