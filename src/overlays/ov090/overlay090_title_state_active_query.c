#include "tingle/types.h"

/* Query the two active-play states in the overlay-90 boss-stage controller. */

/* Return true only while controller state is 0x0b or 0x1e. */
s32 func_ov090_0221ab2c(const void *self)
{
    u8 state = *(const u8 *)((const u8 *)self + 0x1ec);
    if (state == 0x0b)
        return 1;
    return state == 0x1e;
}
