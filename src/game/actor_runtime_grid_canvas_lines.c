#include "tingle/actor_runtime_grid_canvas.h"

/* Draw the frame lines of the actor-runtime grid software canvas. */

/*
 * Clear the 256x192 visible canvas, draw eleven horizontal and ten vertical
 * grid lines in RGB555 white, and return no value. Only the software pixel
 * buffer is changed; no hardware registers are accessed directly.
 */
void func_0200c178(ActorRuntimeGridCanvas *self)
{
    s32 index;

    func_02005eb8(&self->base, 0, 0, 0x100, 0xc0, 0);
    for (index = 0; index < 11; index++) {
        s32 y = index * 24 + 9;
        func_02005dfc(&self->base, 6, y, y, 0xba, 0x7fff);
    }
    for (index = 0; index < 10; index++) {
        s32 x = index * 20 + 6;
        func_02005dfc(&self->base, 9, x, 0xf9, x, 0x7fff);
    }
}
