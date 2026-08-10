#include "tingle/software_canvas.h"

/*
 * Fixed-size software-canvas glyph rasterization. The recovered routine draws
 * one 8x8, 4-bpp glyph through a shared palette at a shared cursor position.
 */

extern const u16 data_020c17f0[];
extern const u32 data_020c19f0[];
extern s32 gSoftwareCanvasTextCursor[2];

/*
 * Draw glyphIndex at the shared x/y cursor. Each nonzero low-first nibble is
 * looked up in palette entries starting at byte offset 0x20, forced opaque,
 * and written to the borrowed pixel buffer; zero nibbles remain transparent.
 * The retail routine assumes a fixed 256-pixel row pitch, does no clipping,
 * changes only destination pixels, and returns no value.
 */
void SoftwareCanvas_DrawGlyph(SoftwareCanvas *self, s32 glyphIndex)
{
    const u32 *glyph = data_020c19f0 + glyphIndex * 8;
    const u16 *palette = data_020c17f0 + 16;
    s32 y;

    for (y = 0; y < 8; y++) {
        u16 *dst = self->pixels + (gSoftwareCanvasTextCursor[0] + y) * 256
                   + gSoftwareCanvasTextCursor[1];
        u32 row = glyph[y];
        s32 x;

        for (x = 0; x < 8; x++, dst++) {
            u32 index = (row >> (x * 4)) & 0xf;
            if (index != 0)
                *dst = palette[index] | 0x8000;
        }
    }
}
