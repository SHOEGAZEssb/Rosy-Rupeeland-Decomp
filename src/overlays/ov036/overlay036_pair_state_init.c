#include "tingle/types.h"

/* Overlay 36 small pair-state initialization used by the following graphics subsystem. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Stores the two caller values at +0x24/+0x28 and clears words +4/+8. Returns
 * nothing; only those four fields change and there are no hardware/SDK effects.
 */
extern "C" void func_ov036_022045ac(void *state, s32 value24, s32 value28)
{
    FIELD(s32, state, 0x24) = value24;
    FIELD(s32, state, 0x28) = value28;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}
