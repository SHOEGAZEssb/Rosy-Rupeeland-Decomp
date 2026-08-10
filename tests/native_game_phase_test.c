/* Verifies host-safe decoding and presentation of fixed phase metadata. */
#include "tingle/native_game_phase.h"
#include "tingle/native_actor_factory.h"
#include "tingle/native_actor_runtime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void WriteU16(u8 *bytes, u16 value)
{
    bytes[0] = (u8)value;
    bytes[1] = (u8)(value >> 8);
}

static void WriteU32(u8 *bytes, u32 value)
{
    bytes[0] = (u8)value;
    bytes[1] = (u8)(value >> 8);
    bytes[2] = (u8)(value >> 16);
    bytes[3] = (u8)(value >> 24);
}

static int TestFactoryResolution(void)
{
    TingleNativeActorFactoryCatalog catalog = {{0}, {0}, 1};
    TingleNativeActorDescriptor descriptor = {0};
    TingleNativeActorFactorySpec spec;

    catalog.kind2_classes[7] = 18;
    catalog.kind9_classes[2] = 1;
    descriptor.kind = 2;
    descriptor.subtype = 7;
    if (!TingleNativeActorFactoryCatalog_Resolve(&catalog, &descriptor, &spec) ||
        spec.allocation_size != 0x30C || spec.factory_variant != 18)
        return 0;
    descriptor.kind = 4;
    descriptor.subtype = 113;
    if (!TingleNativeActorFactoryCatalog_Resolve(&catalog, &descriptor, &spec) ||
        spec.allocation_size != 0x20C || spec.factory_variant != 113)
        return 0;
    descriptor.kind = 6;
    descriptor.subtype = 3;
    if (!TingleNativeActorFactoryCatalog_Resolve(&catalog, &descriptor, &spec) ||
        spec.allocation_size != 0x2A4 || spec.factory_variant != 3)
        return 0;
    descriptor.kind = 9;
    descriptor.subtype = 2;
    if (!TingleNativeActorFactoryCatalog_Resolve(&catalog, &descriptor, &spec) ||
        spec.allocation_size != 0x274 || spec.factory_variant != 1)
        return 0;
    descriptor.kind = 4;
    descriptor.subtype = 23;
    return !TingleNativeActorFactoryCatalog_Resolve(&catalog, &descriptor, &spec);
}

static u32 ReadU32At(const u8 *bytes, u32 offset)
{
    return (u32)bytes[offset] | ((u32)bytes[offset + 1] << 8) |
           ((u32)bytes[offset + 2] << 16) |
           ((u32)bytes[offset + 3] << 24);
}

static int TestActorRuntime(void)
{
    TingleNativeActorDescriptor descriptors[2] = {{0}};
    TingleNativeActorRuntime *runtime;
    const TingleNativeActorImage *actor;

    descriptors[0].kind = 3;
    descriptors[0].subtype = 4;
    descriptors[0].half_width = 24;
    descriptors[0].half_height = 18;
    descriptors[0].bounds_offset_x = 2;
    descriptors[0].bounds_offset_y = 3;
    descriptors[0].position_x = -12;
    descriptors[0].position_y = 34;
    descriptors[0].position_z = -5;
    descriptors[0].flags_28 = 0x12345678;
    descriptors[0].selector_50 = 2;
    descriptors[0].value_52 = -9;
    descriptors[0].reference_58 = 0x02200170;
    descriptors[0].allocation_size = 0x208;
    descriptors[1] = descriptors[0];
    descriptors[1].selector_50 = -1;
    runtime = TingleNativeActorRuntime_Create(descriptors, 2, NULL, 0);
    actor = TingleNativeActorRuntime_GetActor(runtime, 0);
    if (runtime == NULL || runtime->actor_count != 1 ||
        runtime->allocated_bytes != 0x208 || actor == NULL || actor->category != 1 ||
        ReadU32At(actor->bytes, 0) != 0x020DEF7C ||
        actor->bytes[4] != (u8)-12 || actor->bytes[8] != (u8)-10 ||
        ReadU32At(actor->bytes, 0x0C) != 0x12345678 ||
        ReadU32At(actor->bytes, 0x1C) != (u32)(-12 * 0x1000) ||
        ReadU32At(actor->bytes, 0x20) != 34 * 0x1000 ||
        actor->bytes[0x4D] != 3 || actor->bytes[0x4E] != 4 ||
        actor->bytes[0xE4] != (u8)-9 || actor->bytes[0xE5] != 0xFF ||
        TingleNativeActorRuntime_GetActor(runtime, 1) != NULL) {
        TingleNativeActorRuntime_Destroy(runtime);
        return 0;
    }
    TingleNativeActorRuntime_Destroy(runtime);
    return 1;
}

static int TestOverlayRegistration(void)
{
    static const u32 words[] = {
        0xe92d4008, 0xe3500000, 0x18bd8008, 0xebf874fc,
        0xe59f0024, 0xe59f2024, 0xe3a01003, 0xebf8772a,
        0xe59f001c, 0xebf87530, 0xe59f0018, 0xebf7ae19,
        0xe59f0014, 0xebf8772c, 0xe8bd8008
    };
    u8 bytes[0x180] = {0};
    TingleNativeOverlayImage overlay = {0};
    TingleNativePhaseOverlayRegistration registration;
    TingleNativeActorDescriptor descriptor;
    size_t index;

    overlay.load_address = 0x02200000;
    overlay.code_size = 0x100;
    overlay.bss_size = 0x80;
    overlay.bytes = bytes;
    overlay.size = sizeof(bytes);
    for (index = 0; index < sizeof(words) / sizeof(words[0]); ++index)
        WriteU32(bytes + index * 4, words[index]);
    WriteU32(bytes + 0x3c, 0x02200170);
    WriteU32(bytes + 0x40, 0x02200100);
    WriteU32(bytes + 0x44, 0x02200174);
    WriteU32(bytes + 0x48, 0x02200080);
    WriteU32(bytes + 0x4c, 0x02200090);
    WriteU16(bytes + 0x100, 1);
    WriteU16(bytes + 0x102, 7);
    bytes[0x112] = 24;
    bytes[0x113] = 18;
    WriteU16(bytes + 0x122, (u16)-12);
    WriteU16(bytes + 0x124, 34);
    WriteU16(bytes + 0x126, (u16)-5);
    WriteU32(bytes + 0x128, 0x12345678);
    WriteU16(bytes + 0x150, 2);
    WriteU16(bytes + 0x152, (u16)-9);
    WriteU32(bytes + 0x158, 0x02200170);
    if (!TingleNativeGamePhase_ParseOverlayRegistration(
            &overlay, TINGLE_NATIVE_PHASE_OVERLAY_PRIMARY, &registration) ||
        registration.kind != TINGLE_NATIVE_PHASE_OVERLAY_PRIMARY ||
        registration.descriptor_count != 1 ||
        registration.eligible_descriptor_count != 1 ||
        registration.kind_counts[1] != 1 ||
        registration.descriptor_address != 0x02200100 ||
        registration.callback_address != 0x02200090 ||
        !TingleNativeGamePhase_DecodeActorDescriptor(
            &overlay, &registration, 0, &descriptor) ||
        descriptor.address != 0x02200100 || descriptor.kind != 1 ||
        descriptor.subtype != 7 || descriptor.half_width != 24 ||
        descriptor.half_height != 18 || descriptor.position_x != -12 ||
        descriptor.position_y != 34 || descriptor.position_z != -5 ||
        descriptor.flags_28 != 0x12345678 || descriptor.selector_50 != 2 ||
        descriptor.value_52 != -9 || descriptor.reference_58 != 0x02200170)
        return 0;
    bytes[0] = 0;
    if (TingleNativeGamePhase_ParseOverlayRegistration(
            &overlay, TINGLE_NATIVE_PHASE_OVERLAY_PRIMARY, &registration)) return 0;
    memset(bytes, 0, 32);
    overlay.code_size = 32;
    overlay.bss_size = 0;
    overlay.size = 32;
    return TingleNativeGamePhase_ParseOverlayRegistration(
               &overlay, TINGLE_NATIVE_PHASE_OVERLAY_SECONDARY, &registration) &&
           registration.kind == TINGLE_NATIVE_PHASE_OVERLAY_EMPTY;
}

static int ProbeMetadata(const char *kind, const char *source, const char *phase_text)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    TingleNativeGamePhaseBoundary boundary = {{0}, 0};
    TingleNativeGameWork game_work;
    s32 phase_id = (s32)strtol(phase_text, NULL, 0);
    int ok;

    TingleNativeGameWork_Init(&game_work);
    if (data != NULL && strcmp(phase_text, "all") == 0) {
        u32 primary_descriptors = 0;
        u32 secondary_descriptors = 0;
        u32 primary_eligible = 0;
        u32 secondary_eligible = 0;

        for (phase_id = 1; phase_id <= TINGLE_NATIVE_PHASE_COUNT; ++phase_id) {
            ok = TingleNativeGamePhaseBoundary_Start(
                     &boundary, data, &game_work, phase_id) &&
                 boundary.primary_overlay_loaded && boundary.secondary_overlay_loaded &&
                 boundary.primary_callback_valid && boundary.secondary_callback_valid &&
                 boundary.primary_descriptors_decoded &&
                 boundary.secondary_descriptors_decoded &&
                 boundary.primary_factories_resolved &&
                 boundary.secondary_factories_resolved &&
                 boundary.actor_runtime_built &&
                 TingleNativeGameWork_TestFlag(&game_work, 0x3F3) == 1;
            if (!ok) {
                TingleNativeGamePhaseBoundary_Destroy(&boundary);
                TingleNativeData_Close(data);
                return EXIT_FAILURE;
            }
            primary_descriptors += boundary.primary_registration.descriptor_count;
            secondary_descriptors += boundary.secondary_registration.descriptor_count;
            primary_eligible += boundary.primary_registration.eligible_descriptor_count;
            secondary_eligible += boundary.secondary_registration.eligible_descriptor_count;
            TingleNativeGamePhaseBoundary_Destroy(&boundary);
            if (TingleNativeGameWork_TestFlag(&game_work, 0x3F3) != 0) {
                TingleNativeData_Close(data);
                return EXIT_FAILURE;
            }
        }
        (void)printf("validated %d phase overlay pairs: %u+%u descriptors, %u+%u eligible\n",
                     TINGLE_NATIVE_PHASE_COUNT, primary_descriptors,
                     secondary_descriptors, primary_eligible, secondary_eligible);
        TingleNativeData_Close(data);
        return EXIT_SUCCESS;
    }
    ok = data != NULL && TingleNativeGamePhaseBoundary_Start(
             &boundary, data, &game_work, phase_id) &&
             boundary.primary_overlay_loaded && boundary.secondary_overlay_loaded &&
             boundary.primary_callback_valid && boundary.secondary_callback_valid &&
             boundary.primary_factories_resolved &&
             boundary.secondary_factories_resolved && boundary.actor_runtime_built &&
             TingleNativeGameWork_TestFlag(&game_work, 0x3F3) == 1;

    if (ok) {
        (void)printf("phase %d: ov1=%u cb1=%08X ov2=%u cb2=%08X flags40=%08X\n",
                     phase_id, boundary.metadata.primary_overlay_id_1c,
                     boundary.metadata.callback_24,
                     boundary.metadata.secondary_overlay_id_20,
                     boundary.metadata.callback_28, boundary.metadata.flags_40);
    }
    TingleNativeGamePhaseBoundary_Destroy(&boundary);
    TingleNativeData_Close(data);
    return ok ? EXIT_SUCCESS : EXIT_FAILURE;
}

int main(int argc, char **argv)
{
    u8 record[TINGLE_NATIVE_PHASE_METADATA_SIZE] = {0};
    TingleNativeGamePhaseBoundary boundary;
    TingleNativeGamePhaseMetadata metadata;
    TingleNativeInput input = {0};
    TingleNativeCanvas canvas;
    TingleNativeGameWork game_work;
    TingleNativeActorDescriptor map_descriptor = {0};
    u32 *pixels;

    if (argc == 4 && (strcmp(argv[1], "--rom") == 0 ||
                      strcmp(argv[1], "--data") == 0))
        return ProbeMetadata(argv[1], argv[2], argv[3]);
    if (!TestOverlayRegistration() || !TestFactoryResolution() ||
        !TestActorRuntime()) return EXIT_FAILURE;

    WriteU32(record + 0x00, 7);
    WriteU16(record + 0x12, (u16)-2);
    WriteU32(record + 0x1c, 106);
    WriteU32(record + 0x20, 377);
    WriteU32(record + 0x24, 0x02001234);
    WriteU32(record + 0x28, 0x02005678);
    WriteU32(record + 0x2c, (u32)-100);
    WriteU32(record + 0x30, 200);
    WriteU32(record + 0x40, 0xa5a55a5a);
    WriteU32(record + 0x44, (u32)-1);
    WriteU32(record + 0x48, 42);
    record[0x4c] = 3;
    record[0x4d] = (u8)-4;
    record[0x4e] = (u8)-5;
    record[0x4f] = 6;
    WriteU16(record + 0x54, 155);
    WriteU16(record + 0x56, 270);
    if (!TingleNativeGamePhase_DecodeMetadata(9, record, sizeof(record), &metadata) ||
        metadata.phase_id != 9 || metadata.field_00 != 7 || metadata.field_12 != -2 ||
        metadata.primary_overlay_id_1c != 106 || metadata.secondary_overlay_id_20 != 377 ||
        metadata.callback_24 != 0x02001234 || metadata.callback_28 != 0x02005678 ||
        metadata.field_2c != -100 ||
        metadata.field_30 != 200 || metadata.flags_40 != 0xa5a55a5a ||
        metadata.field_44 != -1 || metadata.field_48 != 42 ||
        metadata.variant_4c != 3 || metadata.field_4d != -4 ||
        metadata.coordinate_x_4e != -5 || metadata.coordinate_y_4f != 6 ||
        metadata.field_54 != 155 || metadata.field_56 != 270) return EXIT_FAILURE;
    if (TingleNativeGamePhase_DecodeMetadata(0, record, sizeof(record), &metadata) ||
        TingleNativeGamePhase_DecodeMetadata(271, record, sizeof(record), &metadata) ||
        TingleNativeGamePhase_DecodeMetadata(1, record, sizeof(record) - 1, &metadata))
        return EXIT_FAILURE;

    memset(&boundary, 0, sizeof(boundary));
    boundary.metadata = metadata;
    boundary.metadata.phase_id = 9;
    boundary.metadata_loaded = 1;
    TingleNativeGameWork_Init(&game_work);
    (void)TingleNativeGameWork_SetFlag(&game_work, 0x3F3);
    (void)TingleNativeGameWork_SetFlag(&game_work, 0x386);
    boundary.game_work = &game_work;
    boundary.resume_active = 1;
    input.pressed = TINGLE_KEY_B;
    if (!TingleNativeGamePhaseBoundary_Update(&boundary, &input)) return EXIT_FAILURE;
    if (boundary.resume_state != 2 ||
        TingleNativeGameWork_TestFlag(&game_work, 0x3F3) != 1)
        return EXIT_FAILURE;
    input.pressed = 0;
    (void)TingleNativeGamePhaseBoundary_Update(&boundary, &input);
    if (boundary.resume_active ||
        TingleNativeGameWork_TestFlag(&game_work, 0x3F3) != 0 ||
        TingleNativeGameWork_TestFlag(&game_work, 0x386) != 0)
        return EXIT_FAILURE;
    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH *
                           TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) return EXIT_FAILURE;
    canvas.pixels = pixels;
    canvas.width = TINGLE_SCREEN_WIDTH;
    canvas.height = TINGLE_FRAMEBUFFER_HEIGHT;
    canvas.stride = TINGLE_SCREEN_WIDTH;
    map_descriptor.kind = 3;
    map_descriptor.allocation_size = 0x208;
    boundary.actor_runtime =
        TingleNativeActorRuntime_Create(&map_descriptor, 1, NULL, 0);
    boundary.actor_runtime_built = boundary.actor_runtime != NULL;
    TingleNativeGamePhaseBoundary_Draw(&boundary, &canvas);
    if (pixels[0] != 0x000b1118u ||
        pixels[TINGLE_SCREEN_HEIGHT * TINGLE_SCREEN_WIDTH] != 0x00141b20u ||
        pixels[14 * TINGLE_SCREEN_WIDTH + 14] != 0x0078d878u ||
        pixels[54 * TINGLE_SCREEN_WIDTH + 136] != 0x00485860u ||
        pixels[109 * TINGLE_SCREEN_WIDTH + 189] != 0x0068d878u) {
        free(pixels);
        return EXIT_FAILURE;
    }
    free(pixels);
    TingleNativeGamePhaseBoundary_Destroy(&boundary);
    return EXIT_SUCCESS;
}
