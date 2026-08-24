#include "tingle/actor_runtime_grid_canvas.h"

/* Initialize the software canvas used by the debug phase-selection grid. */

/* Initialize the SoftwareCanvas base, select cell zero, and return self. */
DebugPhaseGridCanvas *DebugPhaseGridCanvas_Init(DebugPhaseGridCanvas *self)
{
    SoftwareCanvas_Init(&self->base);
    self->pageIndex = 0;
    return self;
}
