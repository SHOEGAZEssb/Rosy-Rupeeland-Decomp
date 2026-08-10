#include "tingle/types.h"

/* Provide compact state queries and a default virtual result for type-1 actors. */

/*
 * Return one when any of the low fifteen bits of halfword +0x1f0 are set.
 * The actor is not modified and no hardware or SDK operation is performed.
 */
s32 ActorDerivedType1_HasStatusBits(const void *actor)
{
    return (*(const u16 *)((const u8 *)actor + 0x1f0) & 0x7fff) != 0;
}

/*
 * Return one when actor flags +0xd0 bit 0x10000 or +0x230 mask 0x980000 are
 * set. The actor is not modified and no hardware or SDK operation occurs.
 */
s32 ActorDerivedType1_HasBlockingStateFlags(const void *actor)
{
    const u8 *bytes = (const u8 *)actor;
    return ((*(const u32 *)(bytes + 0xd0) & 0x10000) != 0 ||
            (*(const u32 *)(bytes + 0x230) & 0x980000) != 0);
}

/*
 * Return the type-1 default zero result. The input is unused, state is not
 * changed, and no hardware or SDK operation is performed.
 */
s32 ActorDerivedType1_ReturnZeroQuery(void *actor)
{
    (void)actor;
    return 0;
}
