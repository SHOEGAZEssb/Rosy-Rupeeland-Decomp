#include "tingle/types.h"

/* Recovered completion, manager notification, and neighborhood scan for an animation-sequenced impulse actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void ActorMotionJitter_EnsureMinimum(void *manager_field, s32 event, s32 argument);
extern void ActorCollection_QueueActorForRemoval(void *handle, void *actor);
extern void *Actor_GetOwningCollection(void *actor);
extern void TrackedResourceActor_EmitRecordEffects(void *actor);
extern void TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect(void *actor, ...);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a sequence actor. Obtains its recovered handle, notifies
 * ActorCollection_QueueActorForRemoval, invokes the recovered effect helper, and, if actor flag 4 is
 * set at offset 0x10, calls ActorMotionJitter_EnsureMinimum on manager field 0x2FBC with values
 * 0x14 and 3. It finally runs the recovered neighborhood scan TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect.
 * Returns nothing. These engine callbacks can mutate global and actor state;
 * the wrapper does not access hardware directly. Manager-field semantics and
 * numeric notification values are not yet confirmed.
 */
void TrackedResourceActorType27_Complete(void *actor)
{
    ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(actor), actor);
    TrackedResourceActor_EmitRecordEffects(actor);
    if ((FIELD(u32, actor, 0x10) & 4) != 0)
        ActorMotionJitter_EnsureMinimum((u8 *)data_021052fc + 0x2fbc, 0x14, 3);
    TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect(actor);
}
