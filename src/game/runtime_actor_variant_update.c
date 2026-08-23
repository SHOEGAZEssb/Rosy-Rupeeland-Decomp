#include "tingle/actor_pair_state.h"

/*
 * Recovered frame update for the runtime actor variant. It advances the base,
 * services embedded state +0xec, and coordinates collection insertion/removal.
 */

extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorRuntimeCollection_GetPrimaryContainer(void *registry);
extern s32 ActorRuntimeCollection_TryCompleteAttachment(void *registry, void *actor);
extern void GamePhaseScriptVm_Execute(void *state, s32 value);
extern void GamePhaseActorScriptVm_Assign(void *state, void *value);
extern void GamePhaseActorScriptVm_Activate(void *state);
extern s32 GamePhaseActorScriptVm_IsActive(void *state);
extern void ActorCollection_QueueActorForRemoval(void *runtime, void *actor);
extern void Actor_MarkFrameUpdateStarted(void *actor);
extern void *Actor_GetOwningCollection(void *actor);
extern void *Actor_GetGlobalCollectionBySlot(void *actor, u32 slot);
#ifdef __cplusplus
}
#endif

/*
 * Input is a runtime actor variant. Run base update
 * Actor_MarkFrameUpdateStarted. Continue only when embedded state +0xec is
 * active; then execute it and require actor +0x169 bit 0x01.
 *
 * When byte +0xe8 is nonzero, require ActorRuntimeCollection_TryCompleteAttachment to accept the actor in
 * registry gActorRuntimeCollection. Values other than two additionally obtain category
 * one through Actor_GetGlobalCollectionBySlot and call ActorCollection_EndTrackedPair with its
 * +0x2e7c anchor, runtime from Actor_GetOwningCollection, and the actor. Then clear +0xe8,
 * copy the registry
 * value from ActorRuntimeCollection_GetPrimaryContainer into embedded state +0xec, and activate that state.
 * Finally, actor +0x14 bit 0x20 removes the actor through ActorCollection_QueueActorForRemoval.
 * No value is returned. Base, embedded state, registry, and collection
 * membership may change; there are no direct hardware effects.
 */
void func_0204d308(void *self)
{
    u8 *actor = (u8 *)self;
    void *state = actor + 0xec;
    Actor_MarkFrameUpdateStarted(actor);
    if (GamePhaseActorScriptVm_IsActive(state) == 0)
        return;
    GamePhaseScriptVm_Execute(state, 0);
    if ((actor[0x169] & 1) == 0)
        return;

    if (actor[0xe8] != 0) {
        if (ActorRuntimeCollection_TryCompleteAttachment(gActorRuntimeCollection, actor) == 0)
            return;
        if (actor[0xe8] != 2) {
            u8 *collection = (u8 *)Actor_GetGlobalCollectionBySlot(actor, 1);
            void *runtime = Actor_GetOwningCollection(actor);
            ActorCollection_EndTrackedPair(
                (ActorPairCollection *)runtime,
                *(ActorPairActor **)(collection + 0x2e7c),
                (ActorPairActor *)actor);
        }
        actor[0xe8] = 0;
        GamePhaseActorScriptVm_Assign(state, ActorRuntimeCollection_GetPrimaryContainer(gActorRuntimeCollection));
        GamePhaseActorScriptVm_Activate(state);
    }
    if ((*(u32 *)(actor + 0x14) & 0x20) != 0)
        ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(actor), actor);
}
