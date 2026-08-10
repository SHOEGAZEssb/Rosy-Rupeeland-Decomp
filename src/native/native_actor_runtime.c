/*
 * Native ownership for descriptor-backed actor memory images. The recovered
 * common geometry initializer is represented byte-for-byte; derived ARM
 * constructors and vtable behavior remain a later runtime boundary.
 */
#include "tingle/native_actor_runtime.h"

#include <stdlib.h>
#include <string.h>

enum {
    ACTOR_BASE_VTABLE_ADDRESS = 0x020DEF7C,
    VECTOR_VTABLE_ADDRESS = 0x020D405C
};

static void WriteU16(u8 *bytes, u32 offset, u16 value)
{
    bytes[offset] = (u8)value;
    bytes[offset + 1] = (u8)(value >> 8);
}

static void WriteU32(u8 *bytes, u32 offset, u32 value)
{
    bytes[offset] = (u8)value;
    bytes[offset + 1] = (u8)(value >> 8);
    bytes[offset + 2] = (u8)(value >> 16);
    bytes[offset + 3] = (u8)(value >> 24);
}

static void InitializeVector(u8 *bytes, u32 offset, s32 x, s32 y, s32 z)
{
    WriteU32(bytes, offset, VECTOR_VTABLE_ADDRESS);
    WriteU32(bytes, offset + 4, (u32)x);
    WriteU32(bytes, offset + 8, (u32)y);
    WriteU32(bytes, offset + 12, (u32)z);
}

static s32 InitializeActor(TingleNativeActorImage *actor,
                           const TingleNativeActorDescriptor *descriptor,
                           u32 category)
{
    s32 half_width = descriptor->half_width >> 1;
    s32 half_height = descriptor->half_height >> 1;
    s32 x = (s32)descriptor->position_x * 0x1000;
    s32 y = (s32)descriptor->position_y * 0x1000;
    s32 z = (s32)descriptor->position_z * 0x1000;

    memset(actor, 0, sizeof(*actor));
    actor->descriptor = *descriptor;
    actor->size = descriptor->allocation_size;
    actor->category = category;
    if (actor->size <= 0xE5) return 0;
    actor->bytes = (u8 *)calloc(actor->size, 1);
    if (actor->bytes == NULL) return 0;

    WriteU32(actor->bytes, 0x00, ACTOR_BASE_VTABLE_ADDRESS);
    actor->bytes[0x04] = (u8)(s8)-half_width;
    actor->bytes[0x05] = (u8)(s8)-half_height;
    actor->bytes[0x06] = (u8)(s8)half_width;
    actor->bytes[0x07] = (u8)(s8)half_height;
    actor->bytes[0x08] =
        (u8)(s8)(-half_width + descriptor->bounds_offset_x);
    actor->bytes[0x09] =
        (u8)(s8)(-half_height + descriptor->bounds_offset_y);
    actor->bytes[0x0A] =
        (u8)(s8)(half_width + descriptor->bounds_offset_x);
    actor->bytes[0x0B] =
        (u8)(s8)(half_height + descriptor->bounds_offset_y);
    WriteU32(actor->bytes, 0x0C, descriptor->flags_28);
    WriteU32(actor->bytes, 0x10, descriptor->reference_58);
    WriteU32(actor->bytes, 0x14, descriptor->flags_28);
    InitializeVector(actor->bytes, 0x18, x, y, z);
    InitializeVector(actor->bytes, 0x28, x, y, z);
    InitializeVector(actor->bytes, 0x38, 0, 0, 0);
    actor->bytes[0x4D] = (u8)descriptor->kind;
    WriteU16(actor->bytes, 0x4E, descriptor->subtype);
    WriteU16(actor->bytes, 0x50, (u16)descriptor->selector_50);
    /* The factory copies descriptor +0x52 after the derived initializer. */
    WriteU16(actor->bytes, 0xE4, (u16)descriptor->value_52);
    return 1;
}

static s32 AddEligibleActors(TingleNativeActorRuntime *runtime, u32 *next,
                             const TingleNativeActorDescriptor *descriptors,
                             u32 count, u32 category)
{
    u32 index;

    for (index = 0; index < count; ++index) {
        if (descriptors[index].selector_50 < 0) continue;
        if (!InitializeActor(&runtime->actors[*next], &descriptors[index], category))
            return 0;
        runtime->allocated_bytes += runtime->actors[*next].size;
        ++*next;
    }
    return 1;
}

/* Allocate common actor images in the same primary-then-secondary list order. */
TingleNativeActorRuntime *TingleNativeActorRuntime_Create(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count)
{
    TingleNativeActorRuntime *runtime;
    u32 eligible = 0;
    u32 index;
    u32 next = 0;

    if ((primary_count != 0 && primary == NULL) ||
        (secondary_count != 0 && secondary == NULL))
        return NULL;
    for (index = 0; index < primary_count; ++index)
        if (primary[index].selector_50 >= 0) ++eligible;
    for (index = 0; index < secondary_count; ++index)
        if (secondary[index].selector_50 >= 0) ++eligible;

    runtime = (TingleNativeActorRuntime *)calloc(1, sizeof(*runtime));
    if (runtime == NULL) return NULL;
    if (eligible != 0) {
        runtime->actors =
            (TingleNativeActorImage *)calloc(eligible, sizeof(*runtime->actors));
        if (runtime->actors == NULL) {
            free(runtime);
            return NULL;
        }
    }
    runtime->actor_count = eligible;
    if (!AddEligibleActors(runtime, &next, primary, primary_count, 1) ||
        !AddEligibleActors(runtime, &next, secondary, secondary_count, 2)) {
        TingleNativeActorRuntime_Destroy(runtime);
        return NULL;
    }
    return runtime;
}

/* Release each independent raw image, the image table, and the runtime. */
void TingleNativeActorRuntime_Destroy(TingleNativeActorRuntime *runtime)
{
    u32 index;

    if (runtime == NULL) return;
    for (index = 0; index < runtime->actor_count; ++index)
        free(runtime->actors[index].bytes);
    free(runtime->actors);
    free(runtime);
}

/* Provide read-only inspection without exposing invalid indexes. */
const TingleNativeActorImage *TingleNativeActorRuntime_GetActor(
    const TingleNativeActorRuntime *runtime, u32 index)
{
    if (runtime == NULL || index >= runtime->actor_count) return NULL;
    return &runtime->actors[index];
}
