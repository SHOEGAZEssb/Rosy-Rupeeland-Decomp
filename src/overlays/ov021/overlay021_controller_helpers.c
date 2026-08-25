#include "tingle/types.h"

/* Overlay 21 lightweight controller initialization and callback-storage helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Empty controller destructor; reads no input, changes no state, and returns void. */
extern "C" void Overlay021_Controller_DestroyNoOp(void *state)
{
    (void)state;
}

/*
 * Clear controller words +0/+4/+8. The caller-owned object changes, the
 * function returns void, and no SDK or hardware effects occur.
 */
extern "C" void Overlay021_Snapshot_Init(void *state)
{
    FIELD(s32, state, 8) = 0;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 0) = 0;
}

/*
 * Store four caller-supplied callback/context words at +0xA4..+0xB0. The
 * controller changes, the function returns void, and no SDK/MMIO occurs.
 */
extern "C" void Overlay021_Dialog_SetLayout(void *state, void *a, void *b,
                                     void *c, void *d)
{
    FIELD(void *, state, 0xa4) = a;
    FIELD(void *, state, 0xa8) = b;
    FIELD(void *, state, 0xac) = c;
    FIELD(void *, state, 0xb0) = d;
}

/*
 * Store caller words at +0x24/+0x28 and reset substate +4 and timer +8. The
 * controller changes, returns void, and has no SDK or hardware effects.
 */
extern "C" void Overlay021_SetTransition(void *state, void *arg1, void *arg2)
{
    FIELD(void *, state, 0x24) = arg1;
    FIELD(void *, state, 0x28) = arg2;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}
