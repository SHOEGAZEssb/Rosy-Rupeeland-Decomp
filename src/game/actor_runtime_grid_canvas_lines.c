#include "tingle/actor_runtime_grid_canvas.h"

/* Draw the frame lines of the actor-runtime grid software canvas. */

/*
 * Clear the 256x192 visible canvas, draw eleven horizontal and ten vertical
 * grid lines in RGB555 white, and return no value. Only the software pixel
 * buffer is changed; no hardware registers are accessed directly.
 */
void ActorRuntimeGridCanvas_DrawGrid(ActorRuntimeGridCanvas *self)
{
    s32 index;

    SoftwareCanvas_FillRect(&self->base, 0, 0, 0x100, 0xc0, 0);
    for (index = 0; index < 11; index++) {
        s32 y = index * 24 + 9;
        SoftwareCanvas_DrawLine(&self->base, 6, y, y, 0xba, 0x7fff);
    }
    for (index = 0; index < 10; index++) {
        s32 x = index * 20 + 6;
        SoftwareCanvas_DrawLine(&self->base, 9, x, 0xf9, x, 0x7fff);
    }
}
