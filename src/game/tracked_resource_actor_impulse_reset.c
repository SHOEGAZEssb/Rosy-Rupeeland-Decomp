#include "tingle/types.h"

/* Recovered motion and participation reset for an impulse-oriented tracked-resource actor. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an impulse actor. Zeros fields 0x3C and 0x40, sets field 0x44 to
 * 0x1000, clears actor flag bits 0x00800040, adds flags 0x1F0000 at 0x10, and
 * sets bit 0 of field 0x1F4 while preserving other bits. Returns nothing and
 * has no direct SDK or hardware effects. Motion-field semantics are inferred.
 */
void func_0205206c(void *actor)
{
    FIELD(s32, actor, 0x40) = 0;
    FIELD(s32, actor, 0x3c) = 0;
    FIELD(s32, actor, 0x44) = 0x1000;
    FIELD(u32, actor, 0x14) &= 0xff7fffbf;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u32, actor, 0x1f4) = (FIELD(u32, actor, 0x1f4) & ~1) | 1;
}
