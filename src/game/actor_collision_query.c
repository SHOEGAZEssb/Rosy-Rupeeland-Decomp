#include "tingle/actor_motion.h"

/* Collision predicate combining height and virtual tile/material queries. */

typedef u32 (*ActorCollisionVirtualQuery)(void *context, s32 x, s32 y);

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0202baec(void *context, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Query collision height at X/Y/Z, then invoke the context vtable entry at
 * offset 0x2c for X/Y. Return one when height exceeds Z, or when virtual-result
 * bits 5..9 equal 7 and height equals actorHeight; otherwise return zero.
 * Both external queries may have observable context effects; no hardware is
 * touched. The virtual result's broader encoding remains unrecovered.
 */
s32 func_0200a63c(void *context, s32 x, s32 y, s32 z,
                  s32 actorHeight)
{
    ActorCollisionVirtualQuery query =
        *(ActorCollisionVirtualQuery *)((u8 *)*(void **)context + 0x2c);
    s32 height = func_0202baec(context, x, y, z);
    u32 value = query(context, x, y);
    u32 retainedValues[2];

    /* Retail materializes two identical stack words before testing the value. */
    retainedValues[0] = value;
    retainedValues[1] = value;
    if (height > z)
        return 1;
    if (((retainedValues[0] >> 5) & 0x1f) == 7 && height == actorHeight)
        return 1;
    return 0;
}
