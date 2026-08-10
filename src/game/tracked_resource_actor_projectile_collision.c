#include "tingle/types.h"

/* Recovered randomized collision response for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_02105310;
extern u32 genrand_int32(void);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *state);
extern void ActorCollection_QueueActorForRemoval(void *handle, void *actor);
extern void *Actor_GetCollection(void *actor);
extern void func_02050260(void *actor);
extern void func_02050560(void *actor, void *target, ...);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef s32 (*VirtualFunction)(void *, ...);

static VirtualFunction virtual_function(void *actor, u32 offset)
{
    return *(VirtualFunction *)((u8 *)FIELD(void *, actor, 0) + offset);
}

/*
 * Inputs are a projectile-like actor and optional target. Initializes a vector
 * and assigns its first two recovered components pseudorandom values in
 * [-0x1000, 0x0FFF], using separate bit ranges of one genrand_int32 result. If
 * global state permits, sends that vector and value 1 to target virtual slot
 * 0xB8. Negates the two components and copies the vector to actor offset 0x38,
 * enters low state 2 while preserving state bit 15, enables flags 0x1F0000,
 * resets timer 0x1F8, clears flag 0x800000, and invokes notification, effect,
 * and interaction helpers. Destroys the temporary and returns nothing. Random
 * generation and engine callbacks may cross SDK boundaries; no hardware is
 * accessed directly. The vector component semantics remain inferred.
 */
void func_020515fc(void *actor, void *target)
{
    s32 vector[4];
    u32 random;

    VecFx32Object_Init(vector);
    random = genrand_int32();
    vector[1] = func_020ada8c((s32)(random & 0x7fffffff), 0x2000) - 0x1000;
    vector[2] = func_020ada8c((s32)((random & 0x7fffffff) >> 4), 0x2000) - 0x1000;
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(&data_02105310) == 0 && target != 0)
        virtual_function(target, 0xb8)(target, vector, 1);
    vector[1] = -vector[1];
    vector[2] = -vector[2];
    VecFx32Object_Assign((u8 *)actor + 0x38, vector);
    FIELD(u16, actor, 0x1f0) = (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u16, actor, 0x1f8) = 0;
    FIELD(u32, actor, 0x14) &= 0xff7fffff;
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
    func_02050260(actor);
    func_02050560(actor, target);
    VecFx32Object_Destroy(vector);
}
