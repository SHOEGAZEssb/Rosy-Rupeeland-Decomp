#include "tingle/types.h"

/* Overlay 25 saved-record row activity query. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Returns one when row field +0x74 is zero, otherwise zero; changes no state. */
extern "C" s32 func_ov025_021fdc4c(void *widget)
{
    return FIELD(s32, widget, 0x74) == 0;
}
