/*
 * Recovered tile-map palette-bank mutation for prepared graphics resources.
 * The routine edits caller-owned map entries and performs no allocation or
 * graphics hardware upload.
 */
#include "tingle/graphics_bg_map_resource.h"

/* Replaces the high palette-bank nibble in every map entry while preserving
 * the low 12 tile/flip bits. */
void GraphicsBgMapResource_SetPaletteBank(
    GraphicsBgMapResource *resource, s32 paletteBank)
{
    s32 entryCount = resource->descriptor->entryColumnCount *
                     resource->descriptor->entryRowCount;
    s32 entryIndex;
    u16 paletteBits = (u16)((u32)paletteBank << 12);

    for (entryIndex = 0; entryIndex < entryCount; ++entryIndex) {
        resource->entries[entryIndex] =
            (u16)((resource->entries[entryIndex] & 0x0fffU) | paletteBits);
    }
}
