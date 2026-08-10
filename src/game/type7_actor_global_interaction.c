#include "tingle/types.h"

/*
 * Recovered global interaction callback for the type-seven actor. It updates
 * the global object against the active type-seven actor and conditionally
 * forwards the triggering object into the actor's interaction handler.
 */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_TrySetStateVector(void *globalObject, const void *transform,
                          s32 distance, s32 mode);
extern void Type7Actor_HandleObjectInteraction(void *actor, void *trigger);
extern s32 Type7Actor_GetStateCode(void *actor);
extern s32 Type7Actor_IsInteractionSceneActive(void);
#ifdef __cplusplus
}
#endif

/*
 * Input is an interaction trigger. Return immediately unless Type7Actor_IsInteractionSceneActive
 * permits processing and the global actor at data_021052fc+0x2ea8 exists.
 * Update the global object at +0x2ea4 from that actor's transform +0x18 with
 * recovered distance 20 and mode zero. Continue only when descriptor +0x29c
 * halfword +0x38 has bit three set and Type7Actor_GetStateCode returns zero or one; then
 * call Type7Actor_HandleObjectInteraction with the global actor and input trigger. Global object,
 * actor interaction, and callback state may change. No value is returned and
 * no direct SDK or hardware effects occur.
 */
void Type7Actor_ProcessGlobalInteractionTrigger(void *trigger)
{
    u8 *state;
    u8 *actor;

    if (Type7Actor_IsInteractionSceneActive() == 0)
        return;
    state = data_021052fc;
    actor = *(u8 **)(state + 0x2ea8);
    if (actor == 0)
        return;
    ActorDerivedType1_TrySetStateVector(*(void **)(state + 0x2ea4), actor + 0x18, 20, 0);
    if ((*(u16 *)(*(u8 **)(actor + 0x29c) + 0x38) & 8) == 0)
        return;
    if (Type7Actor_GetStateCode(actor) < 2)
        Type7Actor_HandleObjectInteraction(actor, trigger);
}
