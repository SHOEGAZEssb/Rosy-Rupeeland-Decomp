#ifndef TINGLE_ANIMATION_RESOURCE_H
#define TINGLE_ANIMATION_RESOURCE_H

#include "tingle/types.h"

typedef struct AnimationResource AnimationResource;

typedef struct AnimationResourceVTable {
    AnimationResource *(*destroy)(AnimationResource *self);
    AnimationResource *(*destroyAndFree)(AnimationResource *self);
} AnimationResourceVTable;

typedef struct AnimationResourceEntry {
    u8 unknown00[0x10];
    void *payload10;
} AnimationResourceEntry;

struct AnimationResource {
    const AnimationResourceVTable *vtable;
    AnimationResourceEntry *entries[3];
};

typedef char AnimationResourceSizeCheck[
    sizeof(AnimationResource) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern AnimationResourceVTable data_020d4178;

AnimationResource *AnimationResource_Init(AnimationResource *self, void *resource0,
                                 void *resource1, void *resource2);
AnimationResource *AnimationResource_InitEmpty(AnimationResource *self);
AnimationResource *AnimationResource_Destroy(AnimationResource *self);
AnimationResource *AnimationResource_DestroyAndFree(AnimationResource *self);
void AnimationResource_RebindFrom(AnimationResource *self,
                   const AnimationResource *source);
AnimationResource *AnimationResource_Assign(AnimationResource *self,
                                 const AnimationResource *source);

#ifdef __cplusplus
}
#endif

#endif
