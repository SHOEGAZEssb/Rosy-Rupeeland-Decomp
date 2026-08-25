#include "tingle/types.h"

/*
 * Overlay 3 line rasterization. This recovered helper walks an integer line
 * through the subsystem pixel buffer and applies a randomized brush repeatedly.
 */

typedef struct Overlay003LineState {
    void *pixels_000;
} Overlay003LineState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay003_DrawRandomizedStamp(void *pixels, s32 x, s32 y, s32 delta,
                                s32 yEnd, u32 value, u32 blend);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are state, start X/Y, end X/Y, and two brush parameters whose exact
 * meanings remain unconfirmed. Walk the inclusive line using the confirmed
 * signed integer Bresenham error update. At every coordinate, invoke the
 * randomized brush five times before advancing along the dominant axis. The
 * brush modifies pixels_000 and internally consumes the trailing parameters;
 * this routine returns no value and performs no direct hardware access.
 *
 * The matching fallback also contains compiler-emitted private pixel-blending
 * helpers in the address gap following this public function.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay003_RasterizeLine(Overlay003LineState *state, s32 x0, s32 y0, s32 x1,
                          s32 y1, u32 value, u32 blend)
{
    s32 dx = x1 - x0;
    s32 dy = y1 - y0;
    s32 stepX = 1;
    s32 stepY = 1;
    s32 count;
    s32 error;

    if (dx < 0) {
        dx = -dx;
        stepX = -1;
    }
    if (dy < 0) {
        dy = -dy;
        stepY = -1;
    }
    if (dx > dy) {
        error = -dx;
        count = dx + 1;
        while (count-- != 0) {
            s32 i;
            for (i = 0; i < 5; i++) {
                Overlay003_DrawRandomizedStamp(state->pixels_000, x0, y0, dx, y1,
                                    value, blend);
            }
            x0 += stepX;
            error += dy * 2;
            if (error >= 0) {
                error -= dx * 2;
                y0 += stepY;
            }
        }
    } else {
        error = -dy;
        count = dy + 1;
        while (count-- != 0) {
            s32 i;
            for (i = 0; i < 5; i++) {
                Overlay003_DrawRandomizedStamp(state->pixels_000, x0, y0, dx, y1,
                                    value, blend);
            }
            y0 += stepY;
            error += dx * 2;
            if (error >= 0) {
                error -= dy * 2;
                x0 += stepX;
            }
        }
    }
}
