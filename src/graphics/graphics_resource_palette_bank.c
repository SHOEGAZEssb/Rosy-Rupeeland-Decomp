/*
 * Recovered tile-map palette-bank mutation for prepared graphics resources.
 * The routine edits caller-owned map entries and performs no allocation or
 * graphics hardware upload.
 */
#include "tingle/types.h"

typedef struct GraphicsMapDimensions {
    u8 padding_00[0x0c];
    s32 width;
    s32 height;
} GraphicsMapDimensions;

typedef struct GraphicsMapResource {
    u8 padding_00[0x20];
    GraphicsMapDimensions *dimensions;
    u16 *entries;
} GraphicsMapResource;

/* Replaces the high palette-bank nibble in every map entry while preserving
 * the low 12 tile/flip bits. */
void func_02070f34(GraphicsMapResource *resource, s32 paletteBank)
{
    s32 count = resource->dimensions->width * resource->dimensions->height;
    s32 index;
    u16 bank = (u16)((u32)paletteBank << 12);

    for (index = 0; index < count; ++index) {
        resource->entries[index] =
            (u16)((resource->entries[index] & 0x0fffU) | bank);
    }
}
