#include "tingle/types.h"

/*
 * Runtime-state value setter recovered from ARM9 0x020983C0.
 *
 * The owning subsystem remains unidentified.  The function stores the signed
 * script-provided word at offset 0x464 of a borrowed resident state object and
 * has no return value or direct hardware effect.
 */

/* Store one script-controlled word in the resident runtime state. */
void func_020983c0(void *state, s32 value)
{
    *(s32 *)((u8 *)state + 0x464) = value;
}
