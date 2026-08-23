#include "tingle/graphics_bg_map_resource.h"

/* Palette-bank mutation for loaded background screen-map resources. */

/*
 * Add value to the palette-bank nibble of every map entry, preserving its
 * low 12-bit tile and transform fields. Arithmetic wraps to four bits; the
 * decoded map buffer changes in place and no hardware copy occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
void GraphicsBgMapResource_AddPaletteBankOffset(
    GraphicsBgMapResource *resource, s32 paletteBankOffset)
{
    u16 *entry = resource->entries;
    s32 entryIndex;

    for (entryIndex = 0;
         entryIndex < resource->descriptor->entryColumnCount *
                          resource->descriptor->entryRowCount;
         entryIndex++) {
        u16 currentEntry = *entry;
        u16 adjustedPaletteBank =
            (u16)(paletteBankOffset + ((u32)currentEntry >> 12));

        currentEntry &= ~0xf000;
        currentEntry |= (u16)((adjustedPaletteBank & 0xf) << 12);
        *entry = currentEntry;
        entry++;
    }
}
