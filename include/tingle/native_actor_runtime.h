#ifndef TINGLE_NATIVE_ACTOR_RUNTIME_H
#define TINGLE_NATIVE_ACTOR_RUNTIME_H

#include "tingle/native_game_phase.h"

typedef struct TingleNativeActorImage {
    TingleNativeActorDescriptor descriptor;
    u8 *bytes;
    u32 size;
    u32 category;
    u32 initialization_stages;
    u32 pending_external_state;
    s32 synthetic;
} TingleNativeActorImage;

enum {
    TINGLE_NATIVE_ACTOR_STAGE_GEOMETRY = 1u << 0,
    TINGLE_NATIVE_ACTOR_STAGE_COMMON_RUNTIME = 1u << 1,
    TINGLE_NATIVE_ACTOR_STAGE_SHARED_DERIVED = 1u << 2,
    TINGLE_NATIVE_ACTOR_STAGE_TYPE1_DERIVED = 1u << 3,
    TINGLE_NATIVE_ACTOR_STAGE_SINGLETON_TRACKER = 1u << 4,
    TINGLE_NATIVE_ACTOR_STAGE_RUNTIME_VARIANT = 1u << 5,
    TINGLE_NATIVE_ACTOR_STAGE_KIND3_DERIVED = 1u << 6
};

enum {
    TINGLE_NATIVE_ACTOR_PENDING_DERIVED_CONSTRUCTOR = 1u << 0,
    TINGLE_NATIVE_ACTOR_PENDING_MARKER_PRESENTATION = 1u << 1,
    TINGLE_NATIVE_ACTOR_PENDING_DESCRIPTOR_HOOK = 1u << 2
};

typedef struct TingleNativeActorRuntime {
    TingleNativeActorImage *actors;
    u32 actor_count;
    u32 allocated_bytes;
} TingleNativeActorRuntime;

/* Builds partial retail-layout images for initially eligible descriptors. */
TingleNativeActorRuntime *TingleNativeActorRuntime_Create(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count);

/* Adds both recovered category bootstraps and their common actor descriptors. */
TingleNativeActorRuntime *TingleNativeActorRuntime_CreateForPhase(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count,
    s32 phase_value_2c, s32 phase_value_30);

/* Releases all descriptor-backed actor images and their owning array. */
void TingleNativeActorRuntime_Destroy(TingleNativeActorRuntime *runtime);

/* Returns one actor image, or null when index is outside the built set. */
const TingleNativeActorImage *TingleNativeActorRuntime_GetActor(
    const TingleNativeActorRuntime *runtime, u32 index);

#endif
