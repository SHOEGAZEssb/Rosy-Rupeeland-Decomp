#include "tingle/types.h"

/* Classify terminal states used by the overlay-90 boss-stage controller. */

/* Return 1 for state 0x1a, 3 for state 0x20, and zero otherwise. */
s32 func_ov090_0221aa98(const void *self)
{
    u8 state = *(const u8 *)((const u8 *)self + 0x1ec);
    if (state == 0x1a)
        return 1;
    if (state == 0x20)
        return 3;
    return 0;
}
