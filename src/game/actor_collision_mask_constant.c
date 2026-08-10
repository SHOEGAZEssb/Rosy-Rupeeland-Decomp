#include "tingle/types.h"

/* Supply a fixed actor collision/filter mask used by virtual mask queries. */

/*
 * Ignore the implied object input and return the constant mask 0x40000. No
 * state, hardware, or SDK service is touched.
 */
u32 Actor_GetDefaultCollisionMask(void)
{
    return 0x40000;
}
