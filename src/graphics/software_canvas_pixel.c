#include "tingle/software_canvas.h"

/*
 * Primitive 16-bit pixel write for SoftwareCanvas. Higher-level rasterizers
 * call this method after performing their own clipping or endpoint handling.
 */

/*
 * Store color at pixels[y * stride + x]. The caller must supply valid
 * coordinates; no bounds check, return value, SDK call, or hardware access is
 * performed, and the borrowed pixel buffer is the only modified state.
 */
void SoftwareCanvas_SetPixel(SoftwareCanvas *self, s32 x, s32 y, u16 color)
{
    self->pixels[y * self->stride + x] = color;
}
