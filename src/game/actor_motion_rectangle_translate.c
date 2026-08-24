#include "tingle/actor_motion.h"
#include "tingle/touch_region.h"

/* Translation helper for four-short actor collision rectangles. */

/*
 * Add X to rectangle elements 0/2 and Y to elements 1/3, truncating each
 * result to s16 like retail. Returns no value and changes no external state.
 */
void RectS16_Translate(RectS16 *rectangle, s32 x, s32 y)
{
    rectangle->left = (s16)(rectangle->left + x);
    rectangle->top = (s16)(rectangle->top + y);
    rectangle->right = (s16)(rectangle->right + x);
    rectangle->bottom = (s16)(rectangle->bottom + y);
}
