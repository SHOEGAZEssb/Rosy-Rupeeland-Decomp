
/*
 * Portable reconstruction of the assembly-selected 4bpp font blitter at
 * 0x02075AD4. Wide glyphs encode two eight-pixel strips in each row word;
 * narrow glyphs encode two consecutive eight-pixel rows in each word. The
 * destination is the recovered renderer's 256x192 OBJ-tiled text buffer;
 * callers retain all storage.
 */
#include "tingle/types.h"

typedef struct GraphicsSpriteFontGlyph {
    u32 bitmapOffsetAndFlags;
    u8 wide;
    u8 advance;
    u8 top;
    u8 height;
} GraphicsSpriteFontGlyph;

/* Return the byte offset of a pixel in the retail 64x64-block tiled canvas. */
static u32 FontCanvasByteOffset(s32 x, s32 y)
{
    return ((u32)y >> 6) * 0x2000U + ((u32)(y & 0x38) << 5) +
           ((u32)(y & 7) << 2) + ((u32)x >> 6) * 0x800U +
           ((u32)((x & 0x3f) >> 3) << 5) + (u32)((x & 7) >> 1);
}

/*
 * Draw one glyph using the exact source-bit/nibble merge rules. Destination
 * coordinates are screen pixels, mode contributes the low four-bit ink
 * value, and the glyph's advance byte is returned even when clipped.
 */
u32 GraphicsSpriteFont_BlitGlyph(const GraphicsSpriteFontGlyph *glyph,
                                 const u8 *bitmap, u8 *destination,
                                 s32 destinationX, s32 destinationY, u32 mode)
{
    s32 width = glyph->wide != 0 ? 16 : 8;
    s32 y;

    if (glyph->advance == 0)
        return 0;
    destinationY += glyph->top;
    if (destinationX < 0 || destinationX + glyph->advance > 256 ||
        destinationY < 0 || destinationY + glyph->height > 192)
        return glyph->advance;

    for (y = 0; y < glyph->height; ++y) {
        u32 packed = ((const u32 *)(const void *)bitmap)[
            glyph->wide != 0 ? y : y >> 1];
        s32 x;

        for (x = 0; x < width; ++x) {
            u32 shift;
            u32 source;
            u32 byteOffset;
            u8 nibbleShift;
            u8 mask;
            u8 color;

            if (glyph->wide != 0)
                shift = x < 8 ? (u32)x * 4U
                              : (u32)(x - 8) * 4U + 2U;
            else
                shift = (u32)x * 4U + ((u32)y & 1U) * 2U;
            source = (packed >> shift) & 3U;

            if (source == 0)
                continue;
            byteOffset = FontCanvasByteOffset(destinationX + x,
                                              destinationY + y);
            nibbleShift = (u8)(((destinationX + x) & 1) << 2);
            mask = (u8)(0x0fU << nibbleShift);
            color = (u8)(((mode & 0x0fU) * (source & 1U) +
                          ((source >> 1) & 1U)) << nibbleShift);
            if ((source & 1U) != 0)
                destination[byteOffset] =
                    (u8)((destination[byteOffset] & ~mask) | color);
            else
                destination[byteOffset] |= color;
        }
    }
    return glyph->advance;
}
