#include "tingle/graphics_sprite_renderer.h"

/*
 * Formatted-text front ends for the renderer's low-level glyph blitter. Both
 * variants format into a fixed stack buffer and differ only in whether the
 * glyph expansion mode is fixed at zero or supplied by the caller.
 */

enum { GRAPHICS_SPRITE_FORMAT_BUFFER_SIZE = 0x104 };

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020b3598(char *destination, const char *format, void *args);

#ifdef __cplusplus
}
#endif

/*
 * If renderer field_30 is active, format the variadic arguments into a
 * 0x104-byte stack buffer, append a terminator at the returned length, and
 * draw that many characters at (x,y) with expansion mode zero. Returns no
 * value. Retail performs no length clamp, so callers must keep formatted text
 * within the buffer; the renderer's tile buffer and VRAM transfer state may
 * change through func_020756b4.
 */
void GraphicsSpriteRenderer_Printf(GraphicsSpriteRenderer *renderer, s32 x, s32 y,
                   const char *format, ...)
{
    char buffer[GRAPHICS_SPRITE_FORMAT_BUFFER_SIZE];
    if (renderer->field_30 != 0) {
        void *args = (void *)(((u32)&format & ~3) + sizeof(format));
        s32 length = func_020b3598(buffer, format, args);

        buffer[length] = '\0';
        func_020756b4(renderer, x, y, buffer, length, 0);
    }
}

/*
 * Mode-selecting formatted-text entry point used by the debug UI. It has the
 * same active-renderer and unchecked fixed-buffer contract as GraphicsSpriteRenderer_Printf,
 * but forwards mode to the glyph blitter. Returns no value and may update the
 * renderer's text buffer and graphics transfers.
 */
void DebugText_Printf(GraphicsSpriteRenderer *renderer, s32 x, s32 y,
                      u32 mode, const char *format, ...)
{
    char buffer[GRAPHICS_SPRITE_FORMAT_BUFFER_SIZE];
    if (renderer->field_30 != 0) {
        void *args = (void *)(((u32)&format & ~3) + sizeof(format));
        s32 length = func_020b3598(buffer, format, args);

        buffer[length] = '\0';
        func_020756b4(renderer, x, y, buffer, length, mode);
    }
}
