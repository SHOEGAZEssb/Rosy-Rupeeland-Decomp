#include "tingle/types.h"

/* Supply the type-1 actor's default negative index virtual result. */

/* Ignore self and return -1; no state, hardware, or SDK object is modified. */
s32 Type1Actor_GetDefaultIndex(void *self)
{
    (void)self;
    return -1;
}
