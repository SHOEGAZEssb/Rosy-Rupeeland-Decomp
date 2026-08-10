#include "tingle/types.h"

/* Provide a default actor query and shared interaction-input controls. */
extern u16 data_02105680[2];

/* Ignore the implied actor input and return zero without changing state. */
s32 func_02030f7c(void)
{
    return 0;
}

/*
 * Store the direction-table index and magnitude in the adjacent shared
 * interaction halfwords at data_02105680. Returns no value and performs no
 * hardware or SDK calls.
 */
void ActorInteraction_SetDirectionAndMagnitude(u16 directionIndex, u16 magnitude)
{
    data_02105680[0] = directionIndex;
    data_02105680[1] = magnitude;
}
