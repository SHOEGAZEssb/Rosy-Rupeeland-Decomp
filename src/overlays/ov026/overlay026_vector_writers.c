#include "tingle/types.h"

/* Overlay 26 compact three-component vector writers used by end-sequence setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Stores `x`/`y`/`z` at +0x1C/+0x20/+0x24 and returns void. */
extern "C" void func_ov026_02203168(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0x1c) = x;
    FIELD(s32, object, 0x20) = y;
    FIELD(s32, object, 0x24) = z;
}

/* Stores `x`/`y`/`z` at +0x18/+0x1C/+0x20 and returns void. */
extern "C" void func_ov026_02203178(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0x18) = x;
    FIELD(s32, object, 0x1c) = y;
    FIELD(s32, object, 0x20) = z;
}

/* Initializes the +0x1C/+0x20/+0x24 vector to (0,0x1000,0). */
extern "C" void func_ov026_02203580(void *object)
{
    FIELD(s32, object, 0x24) = 0;
    FIELD(s32, object, 0x1c) = 0;
    FIELD(s32, object, 0x20) = 0x1000;
}
