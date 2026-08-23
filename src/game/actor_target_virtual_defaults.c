#include "tingle/types.h"

/* Provide default target-position and distance-threshold virtual results. */

/* Return a pointer to the actor position object at actor+0x18 without changes. */
void *Actor_GetTargetSelectionPosition(void *actor)
{
    return (u8 *)actor + 0x18;
}

/* Ignore actor and return the Q20.12 selection threshold 0xc0000 (192 units). */
s32 Actor_GetTargetSelectionDistanceThreshold(void *actor)
{
    (void)actor;
    return 0xc0000;
}
