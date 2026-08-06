#include "tingle/types.h"

/* Recovered collision and participation flag setup for a tracked-resource actor. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a tracked-resource actor. Adds the confirmed 0x1F0000 mask to the
 * actor flags at 0x10 and sets bit 0 of the word at 0x1F4 while preserving all
 * other bits. Returns nothing and does not directly access hardware or the SDK.
 */
void func_020505d0(void *actor)
{
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u32, actor, 0x1f4) = (FIELD(u32, actor, 0x1f4) & ~1) | 1;
}
