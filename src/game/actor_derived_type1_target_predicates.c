#include "tingle/types.h"

/* Provide target-state predicates used by type-1 auxiliary interactions. */

/*
 * Return one only when target +0x260 bits 3 and 1 are both set and virtual
 * query +0xa8 returns zero. The target is not directly modified; the virtual
 * query may have observable engine effects. Otherwise return zero.
 */
s32 ActorDerivedType1_IsTargetInteractionReady(void *target)
{
    u8 *object = (u8 *)target;
    u32 flags = *(u32 *)(object + 0x260);
    if ((flags & 8) == 0 || (flags & 2) == 0) return 0;
    return (*(s32 (**)(void *))(*(u8 **)object + 0xa8))(object) == 0;
}

/*
 * Return one when byte +0x27e is one of the confirmed values 1, 2, 3, 29,
 * or 32; return zero otherwise. State is not changed and no hardware or SDK
 * operation is performed. The bit mask mirrors the retail range check.
 */
s32 ActorDerivedType1_IsTargetStateEligible(const void *target)
{
    u32 index = (u8)(((const u8 *)target)[0x27e] - 1);
    if (index > 31) return 0;
    return ((1u << index) & 0x90000007) != 0;
}
