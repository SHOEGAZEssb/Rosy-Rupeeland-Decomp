#include "tingle/util_animation_resource.h"

/*
 * Coordinate-difference helper for CUtilAnmRes positioning. It constructs a
 * normal TouchPoint result and subtracts two confirmed 32-bit coordinate pairs.
 */

/*
 * Initialize difference as a TouchPoint and store left.x-right.x and
 * left.y-right.y. Only difference changes, no SDK or hardware call occurs,
 * and no value is returned.
 */
void TouchPoint_Subtract(TouchPoint *difference, const TouchPoint *left,
                   const TouchPoint *right)
{
    TouchPoint_InitZero(difference);
    difference->x = left->x - right->x;
    difference->y = left->y - right->y;
}
