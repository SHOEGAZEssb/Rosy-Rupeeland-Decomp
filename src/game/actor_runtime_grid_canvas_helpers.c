#include "tingle/actor_runtime_grid_canvas.h"

/* Translate signed 32-bit rectangles used by software renderers. */

/* Add deltaX/deltaY to both corners of a four-word rectangle; return no value. */
void RectS32_Translate(RectS32 *rectangle, s32 deltaX, s32 deltaY)
{
    rectangle->left += deltaX;
    rectangle->top += deltaY;
    rectangle->right += deltaX;
    rectangle->bottom += deltaY;
}
