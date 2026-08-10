#include "tingle/types.h"

/* Snapshot and reset transient actor state at frame boundaries. */

/*
 * Copy byte 0xd4 to 0xd5, word 0xc8 to 0xcc, halfwords 0xd6/0xda to 0xd8/0xdc,
 * and mask word 0xd0 with 0x801f37ee. Returns no value and calls no hardware or
 * SDK services.
 */
void Actor_SnapshotTransientState(void *self)
{
    u8 *actor = (u8 *)self;
    actor[0xd5] = actor[0xd4];
    *(u32 *)(actor + 0xcc) = *(u32 *)(actor + 0xc8);
    *(u32 *)(actor + 0xd0) &= 0x801f37ee;
    *(s16 *)(actor + 0xd8) = *(s16 *)(actor + 0xd6);
    *(s16 *)(actor + 0xdc) = *(s16 *)(actor + 0xda);
}

/*
 * Clear transient contact bytes 0x49-0x4b and mirror actor flag 0x2000 into
 * flag 0x4000, preserving all other flag bits. Returns no value.
 */
void Actor_ClearTransientContactState(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags;

    actor[0x49] = actor[0x4a] = actor[0x4b] = 0;
    flags = *(u32 *)(actor + 0x10);
    if (flags & 0x2000)
        flags |= 0x4000;
    else
        flags &= ~0x4000;
    *(u32 *)(actor + 0x10) = flags;
}

/* Set transient actor flag 0x80 at offset 0x10 and return no value. */
void Actor_SetRuntimeFlag80(void *self)
{
    *(u32 *)((u8 *)self + 0x10) |= 0x80;
}
