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
    ACTOR_COMMON_VTABLE_ADDRESS = 0x020DF040,
    ACTOR_SHARED_DERIVED_VTABLE_ADDRESS = 0x020DF510,
    VECTOR_VTABLE_ADDRESS = 0x020D405C,
    ACTOR_SCRIPT_VM_VTABLE_ADDRESS = 0x020D5B20,
    ANIMATION_RESOURCE_VTABLE_ADDRESS = 0x020D4178
};

static u16 ReadU16(const u8 *bytes, u32 offset)
{
    return (u16)bytes[offset] | (u16)((u16)bytes[offset + 1] << 8);
}

static s16 ReadS16(const u8 *bytes, u32 offset)
{
    return (s16)ReadU16(bytes, offset);
}

static u32 ReadU32(const u8 *bytes, u32 offset)
{
    return (u32)bytes[offset] | ((u32)bytes[offset + 1] << 8) |
           ((u32)bytes[offset + 2] << 16) |
           ((u32)bytes[offset + 3] << 24);
}

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

/* Reproduce the no-script actor VM constructor embedded at actor +0xec. */
static void InitializeActorScriptVm(u8 *bytes)
{
    WriteU32(bytes, 0xEC, ACTOR_SCRIPT_VM_VTABLE_ADDRESS);
    memset(bytes + 0xF0, 0, 0x7A);
    /* Retail intentionally does not write base byte +0x7e (actor +0x16a). */
    bytes[0x16B] = 0;
    WriteU32(bytes, 0x16C, 0);
    WriteU32(bytes, 0x170, 0);
    WriteU32(bytes, 0x174, 0);
    WriteU32(bytes, 0x178, ReadU32(bytes, 0x178) & ~3u);
    bytes[0x17C] = 0x80;
}

/* Reproduce the three-vector countdown object embedded at actor +0x198. */
static void InitializeVectorStepper(u8 *bytes)
{
    InitializeVector(bytes, 0x198, 0, 0, 0);
    InitializeVector(bytes, 0x1A8, 0, 0, 0);
    InitializeVector(bytes, 0x1B8, 0, 0, 0);
    WriteU32(bytes, 0x1C8, 0);
}

/*
 * Apply the byte-exact, host-independent portion of func_02030f98. The final
 * +0x78 vector payload comes from phase-global state and remains explicitly
 * pending; its object identity and zero-constructor state are still retained.
 */
static void InitializeCommonRuntime(TingleNativeActorImage *actor)
{
    const u8 *desc = actor->descriptor.raw;
    u8 *bytes = actor->bytes;
    s32 expand = ReadS16(desc, 0x3E);
    u32 offset;

    WriteU32(bytes, 0x00, ACTOR_COMMON_VTABLE_ADDRESS);
    WriteU32(bytes, 0x54, 0);
    WriteU32(bytes, 0x58, 0);
    WriteU32(bytes, 0x5C,
             (ReadU32(bytes, 0x5C) & 0xFF000000u) | ReadU16(desc, 0x60));
    for (offset = 0; offset < 4; ++offset)
        WriteU16(bytes, 0x60 + offset * 2,
                 (u16)(s16)(s8)desc[0x5C + offset]);
    for (offset = 0; offset < 4; ++offset)
        WriteU16(bytes, 0x68 + offset * 2, ReadU16(desc, 0x1A + offset * 2));
    InitializeVector(bytes, 0x78, 0, 0, 0);
    InitializeVector(bytes, 0x88, 0, 0, 0);
    InitializeVector(bytes, 0x98, 0, 0, 0);
    WriteU32(bytes, 0xA8, 0);
    WriteU16(bytes, 0xAC, 0xFF);
    WriteU16(bytes, 0xAE, 0);
    InitializeVector(bytes, 0xB0, 0, 0, 0);
    WriteU32(bytes, 0xC0, 0);
    WriteU32(bytes, 0xC4, 0);
    WriteU32(bytes, 0xC8, 0);
    WriteU32(bytes, 0xCC, 0);
    WriteU32(bytes, 0xD0, 0);
    bytes[0xD4] = bytes[0xD5] = 0;
    WriteU16(bytes, 0xD6, 0);
    WriteU16(bytes, 0xD8, 0);
    WriteU16(bytes, 0xDA, 0);
    WriteU16(bytes, 0xDC, 0);
    WriteU16(bytes, 0xDE, 0);
    WriteU16(bytes, 0xE4, 0);
    bytes[0xE6] = bytes[0xE7] = bytes[0xE8] = 0;
    InitializeActorScriptVm(bytes);
    for (offset = 0; offset < 5; ++offset)
        WriteU32(bytes, 0x180 + offset * 4, 0);
    memset(bytes + 0x194, 0, 4);
    InitializeVectorStepper(bytes);
    WriteU32(bytes, 0x1CC, ReadU32(desc, 0x48));
    WriteU32(bytes, 0x1D0, 0x1000);
    WriteU32(bytes, 0x1D4, 0x1000);
    WriteU32(bytes, 0x1D8, 0x1000);
    WriteU32(bytes, 0x1DC, 0);
    WriteU32(bytes, 0x1E0, 0);
    bytes[0x1E4] = bytes[0x1E5] = bytes[0x1E6] = 0;
    bytes[0x1E7] = 0x0C;
    WriteU16(bytes, 0x1E8, 0x100);
    WriteU16(bytes, 0x1EA, 0);

    /* func_02032228(actor, 0, 0x1000, 0x800) resolves to angle zero. */
    WriteU32(bytes, 0xC8, 0);
    WriteU32(bytes, 0xCC, 0);
    WriteU32(bytes, 0xD0, ReadU32(bytes, 0xD0) | 1u);
    bytes[0xD4] = bytes[0xD5] = 0;
    if (ReadS16(desc, 0x3C) >= 0 && ReadS16(desc, 0x3C) <= 3)
        WriteU32(bytes, 0x14, ReadU32(bytes, 0x14) | 0x80u);
    WriteU16(bytes, 0x70, (u16)((s8)bytes[0x08] - expand));
    WriteU16(bytes, 0x72, (u16)((s8)bytes[0x09] - expand));
    WriteU16(bytes, 0x74, (u16)((s8)bytes[0x0A] + expand));
    WriteU16(bytes, 0x76, (u16)((s8)bytes[0x0B] + expand));

    actor->initialization_stages |= TINGLE_NATIVE_ACTOR_STAGE_COMMON_RUNTIME;
    actor->pending_external_state |= TINGLE_NATIVE_ACTOR_PENDING_PHASE_VECTOR;
}

static s32 UsesSharedDerivedConstructor(const TingleNativeActorDescriptor *desc)
{
    return desc->kind == 3 &&
           (desc->subtype == 0 || desc->subtype == 2 || desc->subtype == 4 ||
            desc->subtype == 23 || desc->subtype == 24);
}

/* Reproduce func_0203b554 after its common-base constructor has returned. */
static void InitializeSharedDerived(TingleNativeActorImage *actor)
{
    u8 *bytes = actor->bytes;

    WriteU32(bytes, 0x00, ACTOR_SHARED_DERIVED_VTABLE_ADDRESS);
    WriteU32(bytes, 0x1EC, ANIMATION_RESOURCE_VTABLE_ADDRESS);
    WriteU32(bytes, 0x1F0, 0);
    WriteU32(bytes, 0x1F4, 0);
    WriteU32(bytes, 0x1F8, 0);
    WriteU32(bytes, 0x1FC, 0xFFFFFFFFu);
    WriteU32(bytes, 0x200, 0xFFFFFFFFu);
    WriteU16(bytes, 0x204, 0);
    actor->initialization_stages |= TINGLE_NATIVE_ACTOR_STAGE_SHARED_DERIVED;
}

static s32 InitializeActor(TingleNativeActorImage *actor,
                           const TingleNativeActorDescriptor *descriptor,
                           u32 category, s32 synthetic)
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
    actor->synthetic = synthetic;
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
    actor->initialization_stages = TINGLE_NATIVE_ACTOR_STAGE_GEOMETRY;
    if (actor->size >= 0x1EC) InitializeCommonRuntime(actor);
    if (actor->size >= 0x208 && UsesSharedDerivedConstructor(descriptor))
        InitializeSharedDerived(actor);
    else
        actor->pending_external_state |=
            TINGLE_NATIVE_ACTOR_PENDING_DERIVED_CONSTRUCTOR;
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
        if (!InitializeActor(&runtime->actors[*next], &descriptors[index], category,
                             0))
            return 0;
        runtime->allocated_bytes += runtime->actors[*next].size;
        ++*next;
    }
    return 1;
}

static u32 CountEligible(const TingleNativeActorDescriptor *descriptors,
                         u32 count)
{
    u32 eligible = 0;
    u32 index;

    for (index = 0; index < count; ++index)
        if (descriptors[index].selector_50 >= 0) ++eligible;
    return eligible;
}

static TingleNativeActorRuntime *AllocateRuntime(u32 actor_count)
{
    TingleNativeActorRuntime *runtime =
        (TingleNativeActorRuntime *)calloc(1, sizeof(*runtime));

    if (runtime == NULL) return NULL;
    if (actor_count != 0) {
        runtime->actors =
            (TingleNativeActorImage *)calloc(actor_count, sizeof(*runtime->actors));
        if (runtime->actors == NULL) {
            free(runtime);
            return NULL;
        }
    }
    runtime->actor_count = actor_count;
    return runtime;
}

/* Allocate common actor images in the same primary-then-secondary list order. */
TingleNativeActorRuntime *TingleNativeActorRuntime_Create(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count)
{
    TingleNativeActorRuntime *runtime;
    u32 eligible;
    u32 next = 0;

    if ((primary_count != 0 && primary == NULL) ||
        (secondary_count != 0 && secondary == NULL))
        return NULL;
    eligible = CountEligible(primary, primary_count) +
               CountEligible(secondary, secondary_count);
    runtime = AllocateRuntime(eligible);
    if (runtime == NULL) return NULL;
    if (!AddEligibleActors(runtime, &next, primary, primary_count, 1) ||
        !AddEligibleActors(runtime, &next, secondary, secondary_count, 2)) {
        TingleNativeActorRuntime_Destroy(runtime);
        return NULL;
    }
    return runtime;
}

static void InitializeSyntheticDescriptor(TingleNativeActorDescriptor *descriptor,
                                          u16 kind, u16 subtype, s32 resource_04,
                                          s32 resource_08, s32 resource_0c,
                                          u8 field_10, u8 field_11, s16 x, s16 y,
                                          s16 z, u8 width, u8 height, u32 flags,
                                          u16 field_3c, s16 value, u16 size)
{
    memset(descriptor, 0, sizeof(*descriptor));
    descriptor->kind = kind;
    descriptor->subtype = subtype;
    descriptor->position_x = x;
    descriptor->position_y = y;
    descriptor->position_z = z;
    descriptor->half_width = width;
    descriptor->half_height = height;
    descriptor->flags_28 = flags;
    descriptor->value_52 = value;
    descriptor->allocation_size = size;
    descriptor->factory_variant = (s16)subtype;
    WriteU16(descriptor->raw, 0x00, kind);
    WriteU16(descriptor->raw, 0x02, subtype);
    WriteU32(descriptor->raw, 0x04, (u32)resource_04);
    WriteU32(descriptor->raw, 0x08, (u32)resource_08);
    WriteU32(descriptor->raw, 0x0C, (u32)resource_0c);
    descriptor->raw[0x10] = field_10;
    descriptor->raw[0x11] = field_11;
    descriptor->raw[0x12] = width;
    descriptor->raw[0x13] = height;
    WriteU16(descriptor->raw, 0x1A, (u16)-16);
    WriteU16(descriptor->raw, 0x1C, (u16)-49);
    WriteU16(descriptor->raw, 0x1E, 16);
    WriteU16(descriptor->raw, 0x20, 7);
    WriteU16(descriptor->raw, 0x22, (u16)x);
    WriteU16(descriptor->raw, 0x24, (u16)y);
    WriteU16(descriptor->raw, 0x26, (u16)z);
    WriteU32(descriptor->raw, 0x28, flags);
    WriteU16(descriptor->raw, 0x3C, field_3c);
    WriteU16(descriptor->raw, 0x4C, (u16)-1);
    WriteU16(descriptor->raw, 0x4E, (u16)-1);
    WriteU16(descriptor->raw, 0x52, (u16)value);
    descriptor->raw[0x5C] = (u8)-12;
    descriptor->raw[0x5D] = (u8)-40;
    descriptor->raw[0x5E] = 12;
}

static s32 AddSyntheticActor(TingleNativeActorRuntime *runtime, u32 *next,
                             const TingleNativeActorDescriptor *descriptor,
                             u32 category)
{
    if (!InitializeActor(&runtime->actors[*next], descriptor, category, 1)) return 0;
    runtime->allocated_bytes += runtime->actors[*next].size;
    ++*next;
    return 1;
}

/* Build the complete initial descriptor-backed order used by both wrappers. */
TingleNativeActorRuntime *TingleNativeActorRuntime_CreateForPhase(
    const TingleNativeActorDescriptor *primary, u32 primary_count,
    const TingleNativeActorDescriptor *secondary, u32 secondary_count,
    s32 phase_value_2c, s32 phase_value_30)
{
    TingleNativeActorRuntime *runtime;
    TingleNativeActorDescriptor category_actor;
    TingleNativeActorDescriptor common_actor;
    u32 eligible;
    u32 next = 0;

    if ((primary_count != 0 && primary == NULL) ||
        (secondary_count != 0 && secondary == NULL))
        return NULL;
    eligible = CountEligible(primary, primary_count) +
               CountEligible(secondary, secondary_count);
    runtime = AllocateRuntime(eligible + 4);
    if (runtime == NULL) return NULL;

    InitializeSyntheticDescriptor(
        &category_actor, 1, 0, -1, -1, 2, 0, 0,
        (s16)phase_value_2c, (s16)phase_value_30, 0,
        24, 8, 0x02000008, 255, 0, 0x2B8);
    InitializeSyntheticDescriptor(
        &common_actor, 3, 4, -1, -1, -1, 0, (u8)-100, -100, 0, 0,
        0, 0, 8, 255, 2, 0x208);
    if (!AddSyntheticActor(runtime, &next, &category_actor, 1) ||
        !AddSyntheticActor(runtime, &next, &common_actor, 1) ||
        !AddEligibleActors(runtime, &next, primary, primary_count, 1))
        goto failure;

    InitializeSyntheticDescriptor(
        &category_actor, 3, 3, 0x138A, 0x1078, 0x138B, 2, 0x1D,
        0, 0, 0, 0, 0, 0x04088008, 1, 0, 0x218);
    if (!AddSyntheticActor(runtime, &next, &category_actor, 2) ||
        !AddSyntheticActor(runtime, &next, &common_actor, 2) ||
        !AddEligibleActors(runtime, &next, secondary, secondary_count, 2))
        goto failure;
    return runtime;

failure:
    TingleNativeActorRuntime_Destroy(runtime);
    return NULL;
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
