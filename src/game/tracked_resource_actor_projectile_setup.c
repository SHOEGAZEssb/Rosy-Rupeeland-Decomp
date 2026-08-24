#include "tingle/types.h"

/* Recovered transform and state setup for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_InitSum(void *destination, u32 transform, const void *vector);
extern void ActorRuntimeTriple_Assign(void *vector, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a projectile-like actor, its record, a transform argument, and an
 * unused fourth value. Stores the record at 0x1FC, transforms vector
 * (0, 0, 0x100000) through VecFx32Object_InitSum and copies the result to actor offset
 * 0x18, destroys both temporary vectors, and zeroes the vector at 0x38. It then
 * sets flag 0x2000 at 0xD0 and replaces the low half of 0x5C with 8. Returns
 * nothing; vector helpers can mutate engine state but hardware is not accessed.
 */
void TrackedResourceActorType24_SetupFromRecord(void *actor, const void *record, u32 transform, u32 unused)
{
    u8 position[16];
    u8 source[16];
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    VecFx32Object_InitComponents(source, 0, 0, 0x100000);
    VecFx32Object_InitSum(position, transform, source);
    VecFx32Object_Assign((u8 *)actor + 0x18, position);
    VecFx32Object_Destroy(position);
    VecFx32Object_Destroy(source);
    ActorRuntimeTriple_Assign((u8 *)actor + 0x38, 0, 0, 0);
    FIELD(u32, actor, 0xd0) |= 0x2000;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
}
