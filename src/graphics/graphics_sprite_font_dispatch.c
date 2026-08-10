#include "tingle/graphics_sprite_renderer.h"

/*
 * Character-code dispatch for sprite-font drawing and metric lookup. The
 * shared mapper returns 0xffff for unsupported characters; valid results are
 * forwarded to the indexed glyph helpers without further range checking.
 */

enum { GRAPHICS_SPRITE_MISSING_GLYPH = 0xffff };

/*
 * Map characterCode to a glyph index and render it with the supplied
 * destination controls. Return zero for the 0xffff missing-glyph sentinel,
 * otherwise return GraphicsSpriteRenderer_DrawGlyph's result. Renderer
 * tile-buffer state may change through the glyph blitter; unsupported
 * characters have no effects.
 */
u32 GraphicsSpriteRenderer_DrawCharacter(GraphicsSpriteRenderer *renderer,
                                         u32 characterCode, u32 destinationX,
                                         u32 destinationY, u32 mode)
{
    u16 glyphIndex = GraphicsSpriteFont_MapCharacterToGlyph(characterCode);

    if (glyphIndex == GRAPHICS_SPRITE_MISSING_GLYPH) {
        return 0;
    }
    return GraphicsSpriteRenderer_DrawGlyph(renderer, glyphIndex, destinationX,
                                            destinationY, mode);
}

/*
 * Map characterCode and return byte 5 of its font record. Return zero for the
 * 0xffff missing-glyph sentinel or when the renderer/font is inactive through
 * GraphicsSpriteRenderer_GetGlyphMetric. No state or hardware changes occur.
 */
u8 GraphicsSpriteRenderer_GetCharacterMetric(
    GraphicsSpriteRenderer *renderer, u32 characterCode)
{
    u16 glyphIndex = GraphicsSpriteFont_MapCharacterToGlyph(characterCode);

    if (glyphIndex == GRAPHICS_SPRITE_MISSING_GLYPH) {
        return 0;
    }
    return GraphicsSpriteRenderer_GetGlyphMetric(renderer, glyphIndex);
}
