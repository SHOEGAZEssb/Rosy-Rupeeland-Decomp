#include "tingle/types.h"

/* Provide default target-position and distance-threshold virtual results. */

/* Return a pointer to the actor position object at self+0x18 without changes. */
void *func_02035050(void *self)
{
    return (u8 *)self + 0x18;
}

/* Ignore self and return the confirmed fixed-point threshold 0xc0000. */
s32 func_02035058(void *self)
{
    (void)self;
    return 0xc0000;
}
