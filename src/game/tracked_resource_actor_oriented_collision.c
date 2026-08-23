#include "tingle/types.h"

/* Recovered record-sensitive collision transition for an orientation-driven tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gActorRuntimeCollection;
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *state);
extern void ActorRuntimeTriple_Assign(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void ActorCollection_QueueActorForRemoval(void *handle, void *actor);
extern void func_020328d0(void *vector, s32 angle);
extern void *Actor_GetOwningCollection(void *actor);
extern void TrackedResourceActor_EmitRecordEffects(void *actor);
extern void TrackedResourceActor_DispatchTargetInteraction(void *actor, void *target, ...);
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
 * Inputs are an oriented actor, optional target, and two unused callback values.
 * When global state permits and a target exists, copy vector 0x38, clear its
 * fourth word, and rotate it by signed record halfword 0x2A shifted four bits.
 * Pass it to target slot 0xB8 with a boolean derived from whether record
 * halfword 0x0C is positive for target type 1, or halfword 0x0E is positive for
 * other types. Then zero actor vector 0x38, enter low state 2 while preserving
 * state bit 15, add flags 0x1F0000, reset timer 0x1F8, clear actor flag
 * 0x800000, and invoke notification, effect, and interaction helpers. Returns
 * nothing; callbacks mutate engine state without direct hardware access.
 */
void TrackedResourceActorType28_HandleCollision(void *actor, void *target, u32 unused1, u32 unused2)
{
    s32 vector[4];
    const void *record = FIELD(const void *, actor, 0x1fc);
    s16 value;
    (void)unused1;
    (void)unused2;
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(&gActorRuntimeCollection) == 0 && target != 0) {
        VecFx32Object_InitCopy(vector, (u8 *)actor + 0x38);
        vector[3] = 0;
        func_020328d0(vector, (s32)FIELD(s16, record, 0x2a) << 4);
        value = FIELD(u8, target, 0x4d) == 1
                    ? FIELD(s16, record, 0x0c)
                    : FIELD(s16, record, 0x0e);
        virtual_function(target, 0xb8)(target, vector, value > 0);
        VecFx32Object_Destroy(vector);
    }
    ActorRuntimeTriple_Assign((u8 *)actor + 0x38, 0, 0, 0);
    FIELD(u16, actor, 0x1f0) = (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u16, actor, 0x1f8) = 0;
    FIELD(u32, actor, 0x14) &= 0xff7fffff;
    ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(actor), actor);
    TrackedResourceActor_EmitRecordEffects(actor);
    TrackedResourceActor_DispatchTargetInteraction(actor, target);
}
