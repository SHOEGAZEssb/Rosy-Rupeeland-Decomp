#include "tingle/actor_motion.h"

/* Translation helper for four-short actor collision rectangles. */

/*
 * Add X to rectangle elements 0/2 and Y to elements 1/3, truncating each
 * result to s16 like retail. Returns no value and changes no external state.
 */
void S16Rectangle_Translate(s16 *rectangle, s32 x, s32 y)
{
    rectangle[0] = (s16)(rectangle[0] + x);
    rectangle[1] = (s16)(rectangle[1] + y);
    rectangle[2] = (s16)(rectangle[2] + x);
    rectangle[3] = (s16)(rectangle[3] + y);
}
