/*
 * Host-safe game-phase metadata boundary.
 *
 * GamePhase_Start indexes fixed 0x58-byte ARM9 records before constructing a
 * large runtime scene. This module decodes confirmed scalar fields without
 * treating embedded ARM addresses as callable host pointers.
 */
#include "tingle/native_game_phase.h"
#include "tingle/native_actor_factory.h"
#include "tingle/native_actor_runtime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum { PHASE_METADATA_ADDRESS = 0x020d8ae4 };

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

static u32 ReadU32(const u8 *bytes)
{
    return (u32)bytes[0] | ((u32)bytes[1] << 8) |
           ((u32)bytes[2] << 16) | ((u32)bytes[3] << 24);
}

static s32 AddressInOverlay(const TingleNativeOverlayImage *overlay, u32 address,
                            size_t size)
{
    size_t offset;

    if (address < overlay->load_address) return 0;
    offset = (size_t)(address - overlay->load_address);
    return offset <= overlay->size && size <= overlay->size - offset;
}

static s32 CatalogDescriptors(const TingleNativeOverlayImage *overlay, u32 address,
                              TingleNativePhaseOverlayRegistration *registration)
{
    const u8 *bytes = (const u8 *)overlay->bytes;
    size_t offset;
    u32 result = 0;

    if (!AddressInOverlay(overlay, address, 2)) return 0;
    offset = (size_t)(address - overlay->load_address);
    while (ReadU16(bytes + offset) != 0) {
        u16 descriptor_kind;

        if (!AddressInOverlay(overlay, address, 0x64)) return 0;
        descriptor_kind = ReadU16(bytes + offset);
        if (descriptor_kind > 9) return 0;
        registration->kind_counts[descriptor_kind]++;
        if ((s16)ReadU16(bytes + offset + 0x50) >= 0)
            registration->eligible_descriptor_count++;
        address += 0x64;
        offset += 0x64;
        result++;
    }
    registration->descriptor_count = result;
    return 1;
}

/* Decode confirmed common actor fields from one registration-owned record. */
s32 TingleNativeGamePhase_DecodeActorDescriptor(
    const TingleNativeOverlayImage *overlay,
    const TingleNativePhaseOverlayRegistration *registration, u32 index,
    TingleNativeActorDescriptor *descriptor)
{
    const u8 *bytes;
    u32 address;
    size_t offset;

    if (overlay == NULL || overlay->bytes == NULL || registration == NULL ||
        descriptor == NULL || index >= registration->descriptor_count)
        return 0;
    address = registration->descriptor_address + index * 0x64;
    if (!AddressInOverlay(overlay, address, 0x64)) return 0;
    offset = (size_t)(address - overlay->load_address);
    bytes = (const u8 *)overlay->bytes + offset;
    memset(descriptor, 0, sizeof(*descriptor));
    memcpy(descriptor->raw, bytes, sizeof(descriptor->raw));
    descriptor->address = address;
    descriptor->kind = ReadU16(bytes);
    descriptor->subtype = ReadU16(bytes + 2);
    descriptor->half_width = bytes[0x12];
    descriptor->half_height = bytes[0x13];
    descriptor->bounds_offset_x = bytes[0x14];
    descriptor->bounds_offset_y = bytes[0x15];
    descriptor->position_x = (s16)ReadU16(bytes + 0x22);
    descriptor->position_y = (s16)ReadU16(bytes + 0x24);
    descriptor->position_z = (s16)ReadU16(bytes + 0x26);
    descriptor->flags_28 = ReadU32(bytes + 0x28);
    descriptor->selector_50 = (s16)ReadU16(bytes + 0x50);
    descriptor->value_52 = (s16)ReadU16(bytes + 0x52);
    descriptor->reference_58 = ReadU32(bytes + 0x58);
    return descriptor->kind >= 1 && descriptor->kind <= 9;
}

static s32 DecodeDescriptorList(
    const TingleNativeOverlayImage *overlay,
    const TingleNativePhaseOverlayRegistration *registration,
    TingleNativeActorDescriptor **descriptors)
{
    TingleNativeActorDescriptor *result;
    u32 index;

    *descriptors = NULL;
    if (registration->descriptor_count == 0) return 1;
    result = (TingleNativeActorDescriptor *)calloc(
        registration->descriptor_count, sizeof(*result));
    if (result == NULL) return 0;
    for (index = 0; index < registration->descriptor_count; ++index) {
        if (!TingleNativeGamePhase_DecodeActorDescriptor(
                overlay, registration, index, &result[index])) {
            free(result);
            return 0;
        }
    }
    *descriptors = result;
    return 1;
}

static s32 ResolveDescriptorList(
    const TingleNativeActorFactoryCatalog *catalog,
    TingleNativeActorDescriptor *descriptors, u32 count)
{
    u32 index;

    for (index = 0; index < count; ++index) {
        TingleNativeActorFactorySpec spec;

        if (!TingleNativeActorFactoryCatalog_Resolve(
                catalog, &descriptors[index], &spec))
            return 0;
        descriptors[index].allocation_size = spec.allocation_size;
        descriptors[index].factory_variant = spec.factory_variant;
    }
    return 1;
}

static s32 WordsMatch(const u8 *bytes, const u32 *expected, size_t count,
                      size_t immediate_index)
{
    size_t index;

    for (index = 0; index < count; ++index) {
        u32 word = ReadU32(bytes + index * 4);
        if (index == immediate_index) {
            if ((word & 0xffffff00u) != 0xe3a01000u) return 0;
        } else if (word != expected[index]) {
            return 0;
        }
    }
    return 1;
}

s32 TingleNativeGamePhase_ParseOverlayRegistration(
    const TingleNativeOverlayImage *overlay, TingleNativePhaseOverlayKind kind,
    TingleNativePhaseOverlayRegistration *registration)
{
    static const u32 primary_words[] = {
        0xe92d4008, 0xe3500000, 0x18bd8008, 0xebf874fc,
        0xe59f0024, 0xe59f2024, 0, 0xebf8772a,
        0xe59f001c, 0xebf87530, 0xe59f0018, 0xebf7ae19,
        0xe59f0014, 0xebf8772c, 0xe8bd8008
    };
    static const u32 secondary_words[] = {
        0xe92d4008, 0xe59f001c, 0xe59f201c, 0,
        0xebf81dc9, 0xe59f0014, 0xebf81dcf, 0xe59f0010,
        0xebf77771, 0xe8bd8008
    };
    const u8 *bytes;
    size_t index;

    if (overlay == NULL || overlay->bytes == NULL || registration == NULL) return 0;
    memset(registration, 0, sizeof(*registration));
    bytes = (const u8 *)overlay->bytes;
    if (kind == TINGLE_NATIVE_PHASE_OVERLAY_SECONDARY && overlay->code_size == 32) {
        for (index = 0; index < overlay->code_size; ++index) {
            if (bytes[index] != 0) return 0;
        }
        registration->kind = TINGLE_NATIVE_PHASE_OVERLAY_EMPTY;
        return 1;
    }

    registration->kind = kind;
    if (kind == TINGLE_NATIVE_PHASE_OVERLAY_PRIMARY) {
        if (overlay->code_size < 0x50 ||
            !WordsMatch(bytes, primary_words,
                        sizeof(primary_words) / sizeof(primary_words[0]), 6)) return 0;
        registration->work_address_0 = ReadU32(bytes + 0x3c);
        registration->descriptor_address = ReadU32(bytes + 0x40);
        registration->work_address_1 = ReadU32(bytes + 0x44);
        registration->runtime_address = ReadU32(bytes + 0x48);
        registration->callback_address = ReadU32(bytes + 0x4c);
        if (!AddressInOverlay(overlay, registration->work_address_0, 4) ||
            !AddressInOverlay(overlay, registration->work_address_1, 4) ||
            !AddressInOverlay(overlay, registration->runtime_address, 1) ||
            !AddressInOverlay(overlay, registration->callback_address, 1)) return 0;
    } else if (kind == TINGLE_NATIVE_PHASE_OVERLAY_SECONDARY) {
        if (overlay->code_size < 0x38 ||
            !WordsMatch(bytes, secondary_words,
                        sizeof(secondary_words) / sizeof(secondary_words[0]), 3)) return 0;
        registration->work_address_0 = ReadU32(bytes + 0x28);
        registration->descriptor_address = ReadU32(bytes + 0x2c);
        registration->callback_address = ReadU32(bytes + 0x30);
        registration->runtime_address = ReadU32(bytes + 0x34);
        if (!AddressInOverlay(overlay, registration->work_address_0, 4) ||
            !AddressInOverlay(overlay, registration->callback_address, 1) ||
            !AddressInOverlay(overlay, registration->runtime_address, 4)) return 0;
    } else {
        return 0;
    }
    return CatalogDescriptors(overlay, registration->descriptor_address,
                              registration);
}

s32 TingleNativeGamePhase_DecodeMetadata(s32 phase_id, const void *record,
                                         size_t size,
                                         TingleNativeGamePhaseMetadata *metadata)
{
    const u8 *bytes = (const u8 *)record;

    if (phase_id < 1 || phase_id > TINGLE_NATIVE_PHASE_COUNT ||
        bytes == NULL || size != TINGLE_NATIVE_PHASE_METADATA_SIZE ||
        metadata == NULL) return 0;
    memset(metadata, 0, sizeof(*metadata));
    metadata->phase_id = phase_id;
    metadata->field_00 = (s32)ReadU32(bytes + 0x00);
    metadata->field_12 = (s16)ReadU16(bytes + 0x12);
    metadata->primary_overlay_id_1c = ReadU32(bytes + 0x1c);
    metadata->secondary_overlay_id_20 = ReadU32(bytes + 0x20);
    metadata->callback_24 = ReadU32(bytes + 0x24);
    metadata->callback_28 = ReadU32(bytes + 0x28);
    metadata->field_2c = (s32)ReadU32(bytes + 0x2c);
    metadata->field_30 = (s32)ReadU32(bytes + 0x30);
    metadata->flags_40 = ReadU32(bytes + 0x40);
    metadata->field_44 = (s32)ReadU32(bytes + 0x44);
    metadata->field_48 = (s32)ReadU32(bytes + 0x48);
    metadata->variant_4c = (s8)bytes[0x4c];
    metadata->field_4d = (s8)bytes[0x4d];
    metadata->coordinate_x_4e = (s8)bytes[0x4e];
    metadata->coordinate_y_4f = (s8)bytes[0x4f];
    metadata->field_54 = (s16)ReadU16(bytes + 0x54);
    metadata->field_56 = (s16)ReadU16(bytes + 0x56);
    return 1;
}

s32 TingleNativeGamePhaseBoundary_Init(TingleNativeGamePhaseBoundary *boundary,
                                       TingleNativeData *data, s32 phase_id)
{
    TingleNativeActorFactoryCatalog factory_catalog;
    void *record = NULL;
    u32 address;

    memset(boundary, 0, sizeof(*boundary));
    boundary->metadata.phase_id = phase_id;
    if (phase_id < 1 || phase_id > TINGLE_NATIVE_PHASE_COUNT) return 0;
    address = PHASE_METADATA_ADDRESS +
              (u32)(phase_id - 1) * TINGLE_NATIVE_PHASE_METADATA_SIZE;
    if (!TingleNativeData_ReadArm9(data, address, TINGLE_NATIVE_PHASE_METADATA_SIZE,
                                   &record)) return 0;
    boundary->metadata_loaded = TingleNativeGamePhase_DecodeMetadata(
        phase_id, record, TINGLE_NATIVE_PHASE_METADATA_SIZE, &boundary->metadata);
    free(record);
    if (!boundary->metadata_loaded) return 0;
    boundary->primary_overlay_loaded = TingleNativeData_ReadOverlay(
        data, boundary->metadata.primary_overlay_id_1c, &boundary->primary_overlay);
    boundary->secondary_overlay_loaded = TingleNativeData_ReadOverlay(
        data, boundary->metadata.secondary_overlay_id_20, &boundary->secondary_overlay);
    if (boundary->primary_overlay_loaded) {
        u32 end = boundary->primary_overlay.load_address +
                  boundary->primary_overlay.code_size;
        boundary->primary_callback_valid =
            boundary->metadata.callback_24 >= boundary->primary_overlay.load_address &&
            boundary->metadata.callback_24 < end;
    }
    if (boundary->secondary_overlay_loaded) {
        u32 end = boundary->secondary_overlay.load_address +
                  boundary->secondary_overlay.code_size;
        boundary->secondary_callback_valid =
            boundary->metadata.callback_28 >= boundary->secondary_overlay.load_address &&
            boundary->metadata.callback_28 < end;
    }
    if (boundary->primary_callback_valid) {
        boundary->primary_callback_valid =
            TingleNativeGamePhase_ParseOverlayRegistration(
                &boundary->primary_overlay, TINGLE_NATIVE_PHASE_OVERLAY_PRIMARY,
                &boundary->primary_registration);
        if (boundary->primary_callback_valid)
            boundary->primary_descriptors_decoded = DecodeDescriptorList(
                &boundary->primary_overlay, &boundary->primary_registration,
                &boundary->primary_descriptors);
    }
    if (boundary->secondary_callback_valid) {
        boundary->secondary_callback_valid =
            TingleNativeGamePhase_ParseOverlayRegistration(
                &boundary->secondary_overlay, TINGLE_NATIVE_PHASE_OVERLAY_SECONDARY,
                &boundary->secondary_registration);
        if (boundary->secondary_callback_valid)
            boundary->secondary_descriptors_decoded = DecodeDescriptorList(
                &boundary->secondary_overlay, &boundary->secondary_registration,
                &boundary->secondary_descriptors);
    }
    if (boundary->primary_descriptors_decoded &&
        boundary->secondary_descriptors_decoded &&
        TingleNativeActorFactoryCatalog_Init(&factory_catalog, data)) {
        boundary->primary_factories_resolved = ResolveDescriptorList(
            &factory_catalog, boundary->primary_descriptors,
            boundary->primary_registration.descriptor_count);
        boundary->secondary_factories_resolved = ResolveDescriptorList(
            &factory_catalog, boundary->secondary_descriptors,
            boundary->secondary_registration.descriptor_count);
        if (boundary->primary_factories_resolved &&
            boundary->secondary_factories_resolved) {
            boundary->actor_runtime = TingleNativeActorRuntime_CreateForPhase(
                boundary->primary_descriptors,
                boundary->primary_registration.descriptor_count,
                boundary->secondary_descriptors,
                boundary->secondary_registration.descriptor_count,
                boundary->metadata.field_2c, boundary->metadata.field_30);
            boundary->actor_runtime_built = boundary->actor_runtime != NULL;
        }
    }
    return boundary->metadata_loaded;
}

/* Attach the companion scene behavior which sets flag 0x3F3 at construction. */
s32 TingleNativeGamePhaseBoundary_Start(TingleNativeGamePhaseBoundary *boundary,
                                        TingleNativeData *data,
                                        TingleNativeGameWork *game_work,
                                        s32 phase_id)
{
    if (!TingleNativeGamePhaseBoundary_Init(boundary, data, phase_id)) return 0;
    boundary->game_work = game_work;
    if (game_work != NULL) {
        (void)TingleNativeGameWork_SetFlag(game_work, 0x3F3);
        boundary->resume_active = 1;
    }
    return 1;
}

void TingleNativeGamePhaseBoundary_Destroy(TingleNativeGamePhaseBoundary *boundary)
{
    if (boundary == NULL) return;
    if (boundary->game_work != NULL)
        (void)TingleNativeGameWork_ClearFlag(boundary->game_work, 0x3F3);
    TingleNativeActorRuntime_Destroy(boundary->actor_runtime);
    free(boundary->secondary_descriptors);
    free(boundary->primary_descriptors);
    TingleNativeData_CloseOverlay(&boundary->secondary_overlay);
    TingleNativeData_CloseOverlay(&boundary->primary_overlay);
    memset(boundary, 0, sizeof(*boundary));
}

s32 TingleNativeGamePhaseBoundary_Update(TingleNativeGamePhaseBoundary *boundary,
                                         const TingleNativeInput *input)
{
    if (boundary->resume_active) {
        if (boundary->resume_state == 0) {
            /* Retail states zero and one fall through during the first update. */
            boundary->resume_state = 2;
        } else if (boundary->resume_state == 2) {
            if (TingleNativeGameWork_TestFlag(boundary->game_work, 0x386) == 1)
                (void)TingleNativeGameWork_ClearFlag(boundary->game_work, 0x386);
            (void)TingleNativeGameWork_ClearFlag(boundary->game_work, 0x3F3);
            boundary->resume_active = 0;
            boundary->resume_state = 3;
        }
    }
    return (input->pressed & TINGLE_KEY_B) != 0;
}

static void DrawField(TingleNativeCanvas *canvas, s32 y, const char *label,
                      s32 value)
{
    char text[48];

    (void)snprintf(text, sizeof(text), "%s: %d", label, value);
    TingleNativeCanvas_DrawText(canvas, 12, y, text, 0x00d8e0d0u, 1);
}

static void DrawActorMap(const TingleNativeActorRuntime *runtime,
                         TingleNativeCanvas *canvas)
{
    enum { LEFT = 136, TOP = 54, WIDTH = 108, HEIGHT = 112 };
    s32 minimum_x;
    s32 maximum_x;
    s32 minimum_y;
    s32 maximum_y;
    u32 index;

    TingleNativeCanvas_DrawText(canvas, LEFT, 42, "SPAWN MAP", 0x00a0b0b8u, 1);
    TingleNativeCanvas_FillRect(canvas, LEFT, TOP, WIDTH, 1, 0x00485860u);
    TingleNativeCanvas_FillRect(canvas, LEFT, TOP + HEIGHT - 1, WIDTH, 1,
                                0x00485860u);
    TingleNativeCanvas_FillRect(canvas, LEFT, TOP, 1, HEIGHT, 0x00485860u);
    TingleNativeCanvas_FillRect(canvas, LEFT + WIDTH - 1, TOP, 1, HEIGHT,
                                0x00485860u);
    if (runtime == NULL || runtime->actor_count == 0) return;

    minimum_x = maximum_x = runtime->actors[0].descriptor.position_x;
    minimum_y = maximum_y = runtime->actors[0].descriptor.position_y;
    for (index = 1; index < runtime->actor_count; ++index) {
        s32 x = runtime->actors[index].descriptor.position_x;
        s32 y = runtime->actors[index].descriptor.position_y;

        if (x < minimum_x) minimum_x = x;
        if (x > maximum_x) maximum_x = x;
        if (y < minimum_y) minimum_y = y;
        if (y > maximum_y) maximum_y = y;
    }
    for (index = 0; index < runtime->actor_count; ++index) {
        const TingleNativeActorImage *actor = &runtime->actors[index];
        s32 x = LEFT + 2;
        s32 y = TOP + 2;
        u32 color = actor->category == 1 ? 0x0068d878u : 0x00e0a050u;

        if (maximum_x == minimum_x)
            x += (WIDTH - 5) / 2;
        else
            x += (s32)(((s64)actor->descriptor.position_x - minimum_x) *
                       (WIDTH - 5) / (maximum_x - minimum_x));
        if (maximum_y == minimum_y)
            y += (HEIGHT - 5) / 2;
        else
            y += (s32)(((s64)actor->descriptor.position_y - minimum_y) *
                       (HEIGHT - 5) / (maximum_y - minimum_y));
        TingleNativeCanvas_FillRect(canvas, x - 1, y - 1, 3, 3, color);
    }
}

void TingleNativeGamePhaseBoundary_Draw(
    const TingleNativeGamePhaseBoundary *boundary, TingleNativeCanvas *canvas)
{
    char text[48];

    TingleNativeCanvas_FillRect(canvas, 0, 0, canvas->width, canvas->height, 0x000b1118u);
    TingleNativeCanvas_FillRect(canvas, 0, TINGLE_SCREEN_HEIGHT, canvas->width,
                               TINGLE_SCREEN_HEIGHT, 0x00141b20u);
    (void)snprintf(text, sizeof(text), "GAME PHASE %03d", boundary->metadata.phase_id);
    TingleNativeCanvas_DrawText(canvas, 12, 14, text, 0x0078d878u, 2);
    TingleNativeCanvas_DrawText(canvas, 12, 44,
        boundary->metadata_loaded ? "ARM9 METADATA: READY" : "ARM9 METADATA: UNAVAILABLE",
        boundary->metadata_loaded ? 0x0078d878u : 0x00e07070u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 66, "X: RETURN TO SELECTOR",
                                0x00a0b0b8u, 1);
    DrawActorMap(boundary->actor_runtime, canvas);

    if (boundary->metadata_loaded) {
        (void)snprintf(text, sizeof(text), "OV 1C %03u: %s",
                       boundary->metadata.primary_overlay_id_1c,
                       boundary->primary_overlay_loaded ? "READY" : "UNAVAILABLE");
        TingleNativeCanvas_DrawText(canvas, 12, 208, text, 0x00d8e0d0u, 1);
        (void)snprintf(text, sizeof(text), "CALLBACK 24 %08X: %s",
                       boundary->metadata.callback_24,
                       boundary->primary_callback_valid ? "VALID" : "INVALID");
        TingleNativeCanvas_DrawText(canvas, 12, 222, text, 0x00d8e0d0u, 1);
        (void)snprintf(text, sizeof(text), "OV 20 %03u: %s",
                       boundary->metadata.secondary_overlay_id_20,
                       boundary->secondary_overlay_loaded ? "READY" : "UNAVAILABLE");
        TingleNativeCanvas_DrawText(canvas, 12, 236, text, 0x00d8e0d0u, 1);
        (void)snprintf(text, sizeof(text), "CALLBACK 28 %08X: %s",
                       boundary->metadata.callback_28,
                       boundary->secondary_callback_valid ? "VALID" : "INVALID");
        TingleNativeCanvas_DrawText(canvas, 12, 250, text, 0x00d8e0d0u, 1);
        (void)snprintf(text, sizeof(text), "ACTORS: %u + %u",
                       boundary->primary_registration.descriptor_count,
                       boundary->secondary_registration.descriptor_count);
        TingleNativeCanvas_DrawText(canvas, 12, 180, text, 0x00e0b060u, 1);
        (void)snprintf(text, sizeof(text), "ELIGIBLE: %u + %u",
                       boundary->primary_registration.eligible_descriptor_count,
                       boundary->secondary_registration.eligible_descriptor_count);
        TingleNativeCanvas_DrawText(canvas, 12, 194, text, 0x00e0b060u, 1);
        (void)snprintf(text, sizeof(text), "FACTORIES: %s",
                       boundary->primary_descriptors_decoded &&
                               boundary->secondary_descriptors_decoded &&
                               boundary->primary_factories_resolved &&
                               boundary->secondary_factories_resolved
                           ? "RESOLVED"
                           : "UNAVAILABLE");
        TingleNativeCanvas_DrawText(canvas, 132, 180, text,
                                    0x00e0b060u, 1);
        if (boundary->actor_runtime_built) {
            (void)snprintf(text, sizeof(text), "HOST ACTORS: %u",
                           boundary->actor_runtime->actor_count);
            TingleNativeCanvas_DrawText(canvas, 132, 194, text,
                                        0x00e0b060u, 1);
        }
        (void)snprintf(text, sizeof(text), "FLAGS 40: %08X", boundary->metadata.flags_40);
        TingleNativeCanvas_DrawText(canvas, 12, 264, text, 0x00d8e0d0u, 1);
        DrawField(canvas, 278, "FIELD 2C", boundary->metadata.field_2c);
        DrawField(canvas, 292, "FIELD 30", boundary->metadata.field_30);
        DrawField(canvas, 306, "VARIANT 4C", boundary->metadata.variant_4c);
        DrawField(canvas, 320, "FIELD 4D", boundary->metadata.field_4d);
        DrawField(canvas, 334, "COORD X 4E", boundary->metadata.coordinate_x_4e);
        DrawField(canvas, 348, "COORD Y 4F", boundary->metadata.coordinate_y_4f);
        DrawField(canvas, 362, "FIELD 12", boundary->metadata.field_12);
    }
    TingleNativeCanvas_DrawText(canvas, 12, 104, "NEXT: GAME PHASE RUNTIME",
                                0x00e0b060u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 118, "ARM CALLBACKS ARE NOT HOST CALLABLE",
                                0x00e07070u, 1);
}
