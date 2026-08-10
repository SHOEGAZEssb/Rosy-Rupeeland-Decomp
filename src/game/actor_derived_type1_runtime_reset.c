#include "tingle/types.h"

/* Restore the type-1 actor's base position, motion, orientation, and state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *VecFx32Object_Assign(void *destination, const void *source);
extern void ActorRuntimeTriple_Assign(void *value, s32 x, s32 y, s32 z);
extern void Actor_SetDirectionFromVector(void *actor, s32 x, s32 y);
extern void ActorDerivedType1_ResetToBaseState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Copy current position +0x18 to previous position +0x28; zero vectors +0x38,
 * +0x88, and +0x98; request orientation zero with step 0x1000; and enter the
 * base reset through ActorDerivedType1_ResetToBaseState. Then clear actor
 * +0xd0 bit 0x10000 and halfwords +0x204/+0x264. Returns no value; vector,
 * orientation, and reset helpers change actor-owned runtime and presentation
 * state.
 */
void ActorDerivedType1_ResetRuntimeState(void *self)
{
    u8 *actor = (u8 *)self;
    VecFx32Object_Assign(actor + 0x28, actor + 0x18);
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
    Actor_SetDirectionFromVector(actor, 0, 0x1000);
    ActorDerivedType1_ResetToBaseState(actor);
    *(u32 *)(actor + 0xd0) &= ~0x10000;
    *(u16 *)(actor + 0x204) = 0;
    *(u16 *)(actor + 0x264) = 0;
}
