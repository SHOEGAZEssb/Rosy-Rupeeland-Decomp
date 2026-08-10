#include "tingle/actor_runtime_grid_canvas.h"

/* Initialize the software canvas used by an actor-runtime grid display. */

/* Initialize the SoftwareCanvas base, select cell zero, and return self. */
ActorRuntimeGridCanvas *ActorRuntimeGridCanvas_Init(ActorRuntimeGridCanvas *self)
{
    SoftwareCanvas_Init(&self->base);
    self->pageIndex = 0;
    return self;
}
