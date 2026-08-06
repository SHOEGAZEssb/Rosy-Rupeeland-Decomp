#include "tingle/types.h"

/*
 * Overlay 3 randomized stamping. This recovered helper advances through the
 * shuffled offset table and paints a center pixel plus four direct neighbors.
 */

typedef struct Overlay003StampOffset {
    s32 x;
    s32 y;
} Overlay003StampOffset;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 data_ov003_021fbce0;
extern Overlay003StampOffset data_ov003_021fbb40[50];
#ifdef __cplusplus
}
#endif

/* Return a pointer to the 32-bit word holding (x,y) in the confirmed 256x192,
 * 4-bpp, 8x8-tiled buffer, or null when the coordinate is outside its bounds. */
static u32 *overlay003_pixel_word(u8 *pixels, s32 x, s32 y)
{
    if (x < 0 || x >= 0x100 || y < 0 || y >= 0xc0) {
        return 0;
    }
    return (u32 *)(pixels + (y & ~7) * 0x80 + (y & 7) * 4 +
                   (x & ~7) * 4);
}

static void overlay003_set_pixel(u8 *pixels, s32 x, s32 y, u32 color,
                                  s32 onlyIfNonzero)
{
    u32 *word = overlay003_pixel_word(pixels, x, y);
    u32 shift;
    u32 mask;

    if (word == 0) {
        return;
    }
    shift = (x & 7) * 4;
    mask = 0xf << shift;
    if (onlyIfNonzero != 0 && (*word & mask) == 0) {
        return;
    }
    *word = (*word & ~mask) | ((color & 0xf) << shift);
}

/*
 * Inputs are the tiled pixel buffer, a base coordinate, and center/neighbor
 * color nibbles. Increment the shared offset cursor with wrap at 50, add the
 * selected shuffled offset to the coordinate, set the center pixel, then
 * recolor its left/right/up/down neighbors only when they are already nonzero.
 * Returns no value. The matching implementation passes the two colors in
 * compiler-reserved registers shared with the line rasterizer; this portable
 * form expresses their recovered semantics explicitly. No hardware is touched.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov003_021fbaa0(void *pixels, s32 x, s32 y, u32 centerColor,
                          u32 neighborColor)
{
    Overlay003StampOffset *offset;

    data_ov003_021fbce0++;
    if (data_ov003_021fbce0 >= 50) {
        data_ov003_021fbce0 = 0;
    }
    offset = &data_ov003_021fbb40[data_ov003_021fbce0];
    x += offset->x;
    y += offset->y;
    overlay003_set_pixel((u8 *)pixels, x, y, centerColor, 0);
    overlay003_set_pixel((u8 *)pixels, x - 1, y, neighborColor, 1);
    overlay003_set_pixel((u8 *)pixels, x + 1, y, neighborColor, 1);
    overlay003_set_pixel((u8 *)pixels, x, y - 1, neighborColor, 1);
    overlay003_set_pixel((u8 *)pixels, x, y + 1, neighborColor, 1);
}
