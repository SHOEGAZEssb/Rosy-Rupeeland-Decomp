#include "tingle/types.h"

/* Clear shared sprite flags on a phase-90 title participant resource pair. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Clear every bit in `flags` from sprite halfword +0x24 on both bound sprites. */
void func_ov090_0221bc5c(void *self, u16 flags)
{
    FIELD(u16, FIELD(void *, self, 4), 0x24) &= ~flags;
    FIELD(u16, FIELD(void *, self, 8), 0x24) &= ~flags;
}
