#include "tingle/graphics_sprite_renderer.h"

/*
 * Font-record lookup helpers used by the sprite text renderer. A font at
 * renderer offset 0x18 owns fixed eight-byte glyph records and a separate
 * bitmap blob addressed by the record's low-bit-tagged offset.
 */

typedef struct GraphicsSpriteFontGlyph {
    u32 bitmapOffsetAndFlags;
    u8 field_04;
    u8 field_05;
    u8 field_06;
    u8 field_07;
} GraphicsSpriteFontGlyph;

typedef struct GraphicsSpriteFontResource {
    u8 padding_00[0x24];
    GraphicsSpriteFontGlyph *glyphs;
    u8 *bitmapData;
} GraphicsSpriteFontResource;

typedef char GraphicsSpriteFontGlyphSizeCheck[
    sizeof(GraphicsSpriteFontGlyph) == 8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern u32 func_02075ad4(const GraphicsSpriteFontGlyph *glyph,
                         const u8 *bitmap, void *destination,
                         u32 destinationX, u32 destinationY, u32 mode);

#ifdef __cplusplus
}
#endif

/*
 * Render glyphIndex through func_02075ad4 when both the text OAM block at
 * field_0c and font at field_18 exist. Clear the low two tag bits from the
 * glyph's bitmap offset, add it to the font bitmap blob, and pass field_00 as
 * the destination plus the three caller controls. Return the blitter result,
 * or zero while inactive. Glyph bounds are trusted and destination contents
 * may change; the precise meanings of the three controls remain unconfirmed.
 */
u32 GraphicsSpriteRenderer_DrawGlyph(GraphicsSpriteRenderer *renderer,
                                     s32 glyphIndex, u32 destinationX,
                                     u32 destinationY, u32 mode)
{
    GraphicsSpriteFontResource *font;

    if (renderer->field_0c == 0 || renderer->field_18 == 0) {
        return 0;
    }
    font = (GraphicsSpriteFontResource *)renderer->field_18;
    return func_02075ad4(
        &font->glyphs[glyphIndex],
        font->bitmapData +
            (font->glyphs[glyphIndex].bitmapOffsetAndFlags & ~3),
        renderer->field_00, destinationX, destinationY, mode);
}

/*
 * Return byte 5 from glyphIndex's eight-byte font record when the renderer is
 * active and has a font, otherwise return zero. The byte is likely a glyph
 * metric, but its exact role is not yet confirmed. No state or hardware is
 * changed, and the retail caller must provide an in-range glyph index.
 */
u8 GraphicsSpriteRenderer_GetGlyphMetric(GraphicsSpriteRenderer *renderer,
                                         s32 glyphIndex)
{
    GraphicsSpriteFontResource *font;

    if (renderer->field_0c == 0 || renderer->field_18 == 0) {
        return 0;
    }
    font = (GraphicsSpriteFontResource *)renderer->field_18;
    return font->glyphs[glyphIndex].field_05;
}
