#ifndef TINGLE_NATIVE_GRAPHICS_H
#define TINGLE_NATIVE_GRAPHICS_H

#include "tingle/native_data.h"
#include "tingle/native_render.h"

#include <stddef.h>

typedef struct TingleNativeGraphicsResourceSet {
    u8 *character;
    size_t character_size;
    u8 *palette;
    size_t palette_size;
    u8 *layout;
    size_t layout_size;
} TingleNativeGraphicsResourceSet;

/* Expands one validated Nintendo LZ10 stream into caller-owned storage. */
s32 TingleNativeGraphics_DecodeLz10(const void *source, size_t source_size,
                                    void **result, size_t *result_size);

/* Loads and decompresses a VCG/VCL/layout triplet from one retail archive. */
s32 TingleNativeGraphics_LoadResourceSet(
    TingleNativeData *data, const char *archive_name,
    u32 character_id, u32 palette_id, u32 layout_id,
    TingleNativeGraphicsResourceSet *resources);

/* Releases every archive entry owned by a native graphics resource set. */
void TingleNativeGraphics_DestroyResourceSet(
    TingleNativeGraphicsResourceSet *resources);

/* Draws a VCS text background through the host equivalent of the DS BG layer. */
s32 TingleNativeGraphics_DrawTextBackground(
    const TingleNativeGraphicsResourceSet *resources,
    TingleNativeCanvas *canvas, s32 destination_y);

/* Draws VCE cell zero through the host equivalent of one-dimensional OBJ VRAM. */
s32 TingleNativeGraphics_DrawSpriteCell(
    const TingleNativeGraphicsResourceSet *resources,
    TingleNativeCanvas *canvas, s32 anchor_x, s32 anchor_y,
    s32 destination_y);

#endif
