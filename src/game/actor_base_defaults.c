#include "tingle/types.h"

/* Provide a default actor query and shared interaction-input controls. */
extern u16 gActorInteractionDirectionIndex[2];

/* Ignore the implied actor input and return zero without changing state. */
s32 func_02030f7c(void)
{
    return 0;
}

/*
 * Store the direction-table index and magnitude in the adjacent shared
 * interaction halfwords at gActorInteractionDirectionIndex. Returns no value and performs no
 * hardware or SDK calls.
 */
void ActorInteraction_SetDirectionAndMagnitude(u16 directionIndex, u16 magnitude)
{
    gActorInteractionDirectionIndex[0] = directionIndex;
    gActorInteractionDirectionIndex[1] = magnitude;
}
