#include "tingle/types.h"

/* Overlay 30 scene rectangle and embedded coordinate initialization helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Stores rectangle edges `left`, `top`, `right`, and `bottom` at scene offsets
 * +0xA4..+0xB0. Returns void; only scene memory changes.
 */
extern "C" void func_ov030_021fd9fc(void *scene, s32 left, s32 top,
                                      s32 right, s32 bottom)
{
    FIELD(s32, scene, 0xa4) = left;
    FIELD(s32, scene, 0xa8) = top;
    FIELD(s32, scene, 0xac) = right;
    FIELD(s32, scene, 0xb0) = bottom;
}

/*
 * Initializes an embedded coordinate record with inputs `x` and `y` at +0x24
 * and +0x28 and clears its live coordinate words +4/+8. Returns void; only the
 * record changes, with no SDK or hardware effects.
 */
extern "C" void func_ov030_021fda14(void *record, s32 x, s32 y)
{
    FIELD(s32, record, 0x24) = x;
    FIELD(s32, record, 0x28) = y;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}
