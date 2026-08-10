#include "tingle/types.h"

/* Overlay 25 animation-effect duration initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Stores the signed low halfword of `duration` at +0x7C and clears elapsed
 * counter +0x80. No animation or hardware state changes; returns no value.
 */
extern "C" void func_ov025_021fe904(void *object, s32 duration)
{
    FIELD(s32, object, 0x7c) = (s16)duration;
    FIELD(s32, object, 0x80) = 0;
}
