#include "tingle/actor_runtime_grid_canvas.h"

/* Initialize the software canvas used by an actor-runtime grid display. */

/* Initialize the SoftwareCanvas base, select cell zero, and return self. */
ActorRuntimeGridCanvas *func_0200bf04(ActorRuntimeGridCanvas *self)
{
    SoftwareCanvas_Init(&self->base);
    self->selectedCell = 0;
    return self;
}
