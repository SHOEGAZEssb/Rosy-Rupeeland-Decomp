#include "tingle/software_canvas.h"

/*
 * Recovered SoftwareCanvas virtual dispatch table. It owns no storage and
 * points to the non-deleting and deleting destruction paths respectively.
 */

SoftwareCanvasVTable gSoftwareCanvasVTable = {
    SoftwareCanvas_Destroy,
    SoftwareCanvas_DestroyAndFree,
};
