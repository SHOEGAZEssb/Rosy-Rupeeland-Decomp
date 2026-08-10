/* Verifies host-safe decoding and presentation of fixed phase metadata. */
#include "tingle/native_game_phase.h"

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

static int ProbeMetadata(const char *kind, const char *source, const char *phase_text)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    TingleNativeGamePhaseBoundary boundary = {{0}, 0};
    s32 phase_id = (s32)strtol(phase_text, NULL, 0);
    int ok;

    if (data != NULL && strcmp(phase_text, "all") == 0) {
        for (phase_id = 1; phase_id <= TINGLE_NATIVE_PHASE_COUNT; ++phase_id) {
            ok = TingleNativeGamePhaseBoundary_Init(&boundary, data, phase_id) &&
                 boundary.primary_overlay_loaded && boundary.secondary_overlay_loaded &&
                 boundary.primary_callback_valid && boundary.secondary_callback_valid;
            TingleNativeGamePhaseBoundary_Destroy(&boundary);
            if (!ok) {
                TingleNativeData_Close(data);
                return EXIT_FAILURE;
            }
        }
        (void)printf("validated %d phase overlay pairs\n", TINGLE_NATIVE_PHASE_COUNT);
        TingleNativeData_Close(data);
        return EXIT_SUCCESS;
    }
    ok = data != NULL && TingleNativeGamePhaseBoundary_Init(&boundary, data, phase_id) &&
             boundary.primary_overlay_loaded && boundary.secondary_overlay_loaded &&
             boundary.primary_callback_valid && boundary.secondary_callback_valid;

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
    u32 *pixels;

    if (argc == 4 && (strcmp(argv[1], "--rom") == 0 ||
                      strcmp(argv[1], "--data") == 0))
        return ProbeMetadata(argv[1], argv[2], argv[3]);

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
    input.pressed = TINGLE_KEY_B;
    if (!TingleNativeGamePhaseBoundary_Update(&boundary, &input)) return EXIT_FAILURE;
    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH *
                           TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) return EXIT_FAILURE;
    canvas.pixels = pixels;
    canvas.width = TINGLE_SCREEN_WIDTH;
    canvas.height = TINGLE_FRAMEBUFFER_HEIGHT;
    canvas.stride = TINGLE_SCREEN_WIDTH;
    TingleNativeGamePhaseBoundary_Draw(&boundary, &canvas);
    if (pixels[0] != 0x000b1118u ||
        pixels[TINGLE_SCREEN_HEIGHT * TINGLE_SCREEN_WIDTH] != 0x00141b20u ||
        pixels[14 * TINGLE_SCREEN_WIDTH + 14] != 0x0078d878u) {
        free(pixels);
        return EXIT_FAILURE;
    }
    free(pixels);
    TingleNativeGamePhaseBoundary_Destroy(&boundary);
    return EXIT_SUCCESS;
}
