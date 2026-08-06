#include "tingle/graphics_sprite_renderer.h"

/*
 * Overlay 0 numeric-glyph placement helper. The recovered routine centers a
 * one- or two-digit glyph value within the three-digit space used by this
 * overlay before delegating the actual drawing to the shared sprite renderer.
 */

/*
 * Render glyphIndex at the supplied destination, adding eight pixels for a
 * one-digit value or four for a two-digit value. The renderer and destination
 * buffer may change through func_02075e48; its result is returned unchanged.
 * The input is narrowed to 16 bits as in retail. No hardware is touched
 * directly, although the renderer may update sprite-backed graphics state.
 */
#ifdef __cplusplus
extern "C"
#endif
u32 func_ov000_021fb6e0(GraphicsSpriteRenderer *renderer, s32 glyphIndex,
                        u32 destinationX, u32 destinationY, u32 mode)
{
    if (glyphIndex < 10) {
        destinationX += 8;
    } else if (glyphIndex < 100) {
        destinationX += 4;
    }

    return func_02075e48(renderer, (u16)glyphIndex, destinationX,
                         destinationY, mode);
}
