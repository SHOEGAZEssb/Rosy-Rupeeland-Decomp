#include "tingle/types.h"

/* Overlay 32 no-op callbacks and scene rectangle assignment helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* No-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov032_021fce00(void *object)
{
    (void)object;
}

/* Second no-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov032_021fce04(void *object)
{
    (void)object;
}

/*
 * Stores rectangle edges `left`, `top`, `right`, and `bottom` at offsets
 * +0xA4..+0xB0 of `object`. Returns void; only object memory changes.
 */
extern "C" void func_ov032_021fce08(void *object, s32 left, s32 top,
                                      s32 right, s32 bottom)
{
    FIELD(s32, object, 0xa4) = left;
    FIELD(s32, object, 0xa8) = top;
    FIELD(s32, object, 0xac) = right;
    FIELD(s32, object, 0xb0) = bottom;
}
