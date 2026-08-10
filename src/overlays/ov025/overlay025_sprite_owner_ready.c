#include "tingle/types.h"

/* Overlay 25 sprite-owner readiness propagation used by the title effects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Marks both sprite owners referenced at object +0xE0/+0xE4 ready by storing
 * one at owner +0x20. The pointed-to owners change; no value is returned.
 */
extern "C" void func_ov025_021ff140(void *object)
{
    FIELD(s32, FIELD(void *, object, 0xe0), 0x20) = 1;
    FIELD(s32, FIELD(void *, object, 0xe4), 0x20) = 1;
}
