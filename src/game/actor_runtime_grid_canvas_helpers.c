#include "tingle/actor_runtime_grid_canvas.h"

/* Translate rectangles used by the actor-runtime grid renderer. */

/* Add deltaX/deltaY to both corners of a four-word rectangle; return no value. */
void func_0200c144(s32 *rectangle, s32 deltaX, s32 deltaY)
{
    rectangle[0] += deltaX;
    rectangle[1] += deltaY;
    rectangle[2] += deltaX;
    rectangle[3] += deltaY;
}
