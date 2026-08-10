/*
 * Host-safe game-phase metadata boundary.
 *
 * GamePhase_Start indexes fixed 0x58-byte ARM9 records before constructing a
 * large runtime scene. This module decodes confirmed scalar fields without
 * treating embedded ARM addresses as callable host pointers.
 */
#include "tingle/native_game_phase.h"

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
    return boundary->metadata_loaded;
}

void TingleNativeGamePhaseBoundary_Destroy(TingleNativeGamePhaseBoundary *boundary)
{
    if (boundary == NULL) return;
    TingleNativeData_CloseOverlay(&boundary->secondary_overlay);
    TingleNativeData_CloseOverlay(&boundary->primary_overlay);
    memset(boundary, 0, sizeof(*boundary));
}

s32 TingleNativeGamePhaseBoundary_Update(TingleNativeGamePhaseBoundary *boundary,
                                         const TingleNativeInput *input)
{
    (void)boundary;
    return (input->pressed & TINGLE_KEY_B) != 0;
}

static void DrawField(TingleNativeCanvas *canvas, s32 y, const char *label,
                      s32 value)
{
    char text[48];

    (void)snprintf(text, sizeof(text), "%s: %d", label, value);
    TingleNativeCanvas_DrawText(canvas, 12, y, text, 0x00d8e0d0u, 1);
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
