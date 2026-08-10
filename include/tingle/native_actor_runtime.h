#ifndef TINGLE_NATIVE_ACTOR_RUNTIME_H
#define TINGLE_NATIVE_ACTOR_RUNTIME_H

#include "tingle/native_game_phase.h"

typedef struct TingleNativeActorImage {
    TingleNativeActorDescriptor descriptor;
    u8 *bytes;
    u32 size;
    u32 category;
} TingleNativeActorImage;

typedef struct TingleNativeActorRuntime {
    TingleNativeActorImage *actors;
    u32 actor_count;
    u32 allocated_bytes;
} TingleNativeActorRuntime;

/* Builds partial retail-layout images for initially eligible descriptors. */
TingleNativeActorRuntime *TingleNativeActorRuntime_Create(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count);

/* Releases all descriptor-backed actor images and their owning array. */
void TingleNativeActorRuntime_Destroy(TingleNativeActorRuntime *runtime);

/* Returns one actor image, or null when index is outside the built set. */
const TingleNativeActorImage *TingleNativeActorRuntime_GetActor(
    const TingleNativeActorRuntime *runtime, u32 index);

#endif
