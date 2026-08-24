#include "tingle/types.h"

/*
 * Recovered target-acquisition helpers for the presentation-backed actor.
 * They gate interaction on actor and global state, choose between two nearby
 * global actor candidates, and preserve two thin inherited callback thunks.
 */

extern void *gGamePhaseRuntime;
extern const u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(const void *state);
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern s32 ActorContactState_AddContact(void *actor, void *other,
                                        s32 wasTracked);
extern s32 Type7Actor_GetStateCode(void *actor);
extern s32 PresentationBackedActor_CanAcquireTarget(void *actor);
extern void PresentationBackedActor_HandleInteraction(void *actor, void *target);
extern s32 func_020adcac(const void *point0, const void *point1);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor. If PresentationBackedActor_CanAcquireTarget permits acquisition, compare its point
 * at 0x1C with the global primary actor at gGamePhaseRuntime+0x2EA4 and trigger
 * PresentationBackedActor_HandleInteraction inside 0x10000 units. Otherwise consider the secondary actor
 * at +0x2EA8 when it exists, passes Type7Actor_GetStateCode, and is inside 0x18000 units.
 * Returns nothing; the chosen handler may mutate actor and global engine state.
 */
void PresentationBackedActor_AcquireNearbyTarget(void *actor)
{
    void *primary;
    void *secondary;

    if (!PresentationBackedActor_CanAcquireTarget(actor))
        return;

    primary = FIELD(void *, gGamePhaseRuntime, 0x2ea4);
    if (func_020adcac((u8 *)primary + 0x1c, (u8 *)actor + 0x1c) < 0x10000) {
        PresentationBackedActor_HandleInteraction(actor, primary);
        return;
    }

    secondary = FIELD(void *, gGamePhaseRuntime, 0x2ea8);
    if (secondary == 0 || Type7Actor_GetStateCode(secondary) != 0)
        return;
    if (func_020adcac((u8 *)secondary + 0x1c, (u8 *)actor + 0x1c) <
        0x18000) {
        PresentationBackedActor_HandleInteraction(actor, secondary);
    }
}

/*
 * Forward all register inputs to ActorContactState_AddContact and propagate its return value.
 * This recovered tail-call thunk has only the callee's engine-side effects.
 */
void PresentationBackedActor_ForwardPairInteraction(void *actor, void *other, s32 mode)
{
    ActorContactState_AddContact(actor, other, mode);
}

/*
 * Forward all register inputs to Actor_UpdatePresentation.
 * This recovered tail-call thunk has only the callee's engine-side effects.
 */
void PresentationBackedActor_BuildTargetTransform(void *screenPosition,
                                                  void *actor,
                                                  const void *viewPosition)
{
    Actor_UpdatePresentation(screenPosition, actor, viewPosition);
}

/*
 * Input is an actor. Return one only when state 0x1EC is 1, the global gate
 * queried with gActorRuntimeCollection is clear, and bit 0x100 is absent from the primary
 * actor's word at 0xD0; otherwise return zero. No state or hardware is changed.
 */
s32 PresentationBackedActor_CanAcquireTarget(void *actor)
{
    if (FIELD(u16, actor, 0x1ec) == 1 &&
        ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0) {
        void *primary = FIELD(void *, gGamePhaseRuntime, 0x2ea4);
        if ((FIELD(u32, primary, 0xd0) & 0x100) == 0)
            return 1;
    }
    return 0;
}
