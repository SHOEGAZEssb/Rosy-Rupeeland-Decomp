#include "tingle/types.h"

/* Overlay 25 animation-effect wait completion query. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Returns one when elapsed +0x80 has reached duration +0x7C, otherwise zero. */
extern "C" s32 func_ov025_021ff0b0(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}
