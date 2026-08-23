#include "tingle/actor_pair_state.h"
#include "tingle/scene_touch.h"
#include "tingle/types.h"

/* Forward touch points and process derived-actor contact/cancellation callbacks. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern void ActorAttachment_CopyTouchState(void *actor, const TouchPoint *point);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Stepper_Reset(void *track);
extern s32 Actor_TryDispatchActivationMode2(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pass the writable screen-position record, actor, and borrowed view position
 * through Actor_UpdatePresentation. Copy screen-position words +0x04/+0x08
 * into a stack TouchPoint using gSceneTouchInitialData's point vtable and
 * forward that point to the actor through ActorAttachment_CopyTouchState.
 * Returns no value; both helpers can mutate presentation/actor state.
 */
void ActorDerivedRuntime_ForwardTouchPoint(void *screenPosition, void *actor,
                                           const void *viewPosition)
{
    u8 *screenPositionBytes = (u8 *)screenPosition;
    TouchPoint point;
    Actor_UpdatePresentation(screenPosition, actor, viewPosition);
    point.vtable = &gSceneTouchInitialData.pointVTable;
    point.x = *(u32 *)(screenPositionBytes + 4);
    point.y = *(u32 *)(screenPositionBytes + 8);
    ActorAttachment_CopyTouchState(actor, &point);
}

/*
 * Invoke ActorContactState_AddContact(actor,other,wasTracked). For a newly
 * tracked pair, clear actor motion +0x38; if actor +0x10 bit 0x40 and +0x14
 * bit 0x40000000 are set while other
 * +0x14 bit 0x10 is clear, also clear bit 0x40 and cancel track +0x198.
 * Finally, when other subtype byte +0x4d is one, its virtual +0xa8 returns
 * zero, the pair was not already tracked, and actor +0x188 is nonnull, invoke
 * Actor_TryDispatchActivationMode2(actor).
 * Return one. Base contact, vector, track, virtual, and follow-up helpers have
 * observable actor state effects.
 */
s32 ActorDerivedRuntime_HandlePairActive(ActorPairActor *actor,
                                         ActorPairActor *other,
                                         s32 wasTracked)
{
    u8 *actorBytes = (u8 *)actor;
    u8 *otherBytes = (u8 *)other;
    ActorContactState_AddContact(actor, other, wasTracked);
    if (wasTracked == 0) {
        s32 zero[4];
        VecFx32Object_InitComponents(zero, 0, 0, 0);
        VecFx32Object_Assign(actorBytes + 0x38, zero);
        VecFx32Object_Destroy(zero);
        if ((*(u32 *)(actorBytes + 0x10) & ACTOR_PAIR_STEPPER_ACTIVE_FLAG) != 0 &&
            (*(u32 *)(actorBytes + 0x14) & ACTOR_PAIR_STEPPER_CANCEL_ALLOWED) != 0 &&
            (*(u32 *)(otherBytes + 0x14) & ACTOR_PAIR_OTHER_MOTION_GATE) == 0) {
            *(u32 *)(actorBytes + 0x10) &= ~ACTOR_PAIR_STEPPER_ACTIVE_FLAG;
            VecFx32Stepper_Reset(actorBytes + 0x198);
        }
    }
    if (otherBytes[0x4d] == 1 &&
        (*(s32 (**)(void *))(*(u8 **)otherBytes + 0xa8))(other) == 0 &&
        wasTracked == 0 && *(void **)(actorBytes + 0x188) != 0)
        Actor_TryDispatchActivationMode2(actorBytes);
    return 1;
}
