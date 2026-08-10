#include "tingle/actor_runtime_grid_canvas.h"

/* Control which Nintendo DS engine is routed to the upper/lower display. */

/*
 * Replace POWCNT1 bit 15 with displaySelect bit 0, preserving all other bits.
 * Returns no value and directly controls the Nintendo DS LCD screen swap at
 * hardware register 0x04000304.
 */
void NdsDisplay_SetScreenSwap(s32 displaySelect)
{
    volatile u16 *powerControl = (volatile u16 *)0x04000304;
    *powerControl = (*powerControl & ~0x8000) | (displaySelect << 15);
}
