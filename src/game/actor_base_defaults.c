#include "tingle/types.h"

/* Provide small default actor query and shared halfword-state helpers. */
extern u16 data_02105680[2];

/* Ignore the implied actor input and return zero without changing state. */
s32 func_02030f7c(void)
{
    return 0;
}

/*
 * Store first and second into the two halfwords at data_02105680. Return no
 * value and perform no hardware or SDK calls.
 */
void func_02030f84(u16 first, u16 second)
{
    data_02105680[0] = first;
    data_02105680[1] = second;
}
