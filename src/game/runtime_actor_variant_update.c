#include "tingle/types.h"

/*
 * Recovered frame update for the runtime actor variant. It advances the base,
 * services embedded state +0xec, and coordinates collection insertion/removal.
 */

extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0200af04(void *registry);
extern s32 func_0200b058(void *registry, void *actor);
extern void func_0201273c(void *state, s32 value);
extern void func_0201b180(void *state, void *value);
extern void func_0201b228(void *state);
extern s32 func_0201b23c(void *state);
extern void ActorCollection_QueueActorForRemoval(void *runtime, void *actor);
extern void ActorCollection_EndTrackedPair(void *runtime, void *anchor, void *actor);
extern void Actor_SetRuntimeFlag80(void *actor);
extern void *Actor_GetCollection(void *actor);
extern u8 *Actor_GetCollectionBySlot(void *actor, s32 category);
#ifdef __cplusplus
}
#endif

/*
 * Input is a runtime actor variant. Run base update Actor_SetRuntimeFlag80. Continue
 * only when embedded state +0xec passes func_0201b23c; then clear its recovered
 * value through func_0201273c and require actor +0x169 bit 0x01.
 *
 * When byte +0xe8 is nonzero, require func_0200b058 to accept the actor in
 * registry data_02105310. Values other than two additionally obtain category
 * one through Actor_GetCollectionBySlot and call ActorCollection_EndTrackedPair with its
 * +0x2e7c anchor, runtime from Actor_GetCollection, and the actor. Then clear +0xe8,
 * copy the registry
 * value from func_0200af04 into embedded state +0xec, and advance that state.
 * Finally, actor +0x14 bit 0x20 removes the actor through ActorCollection_QueueActorForRemoval.
 * No value is returned. Base, embedded state, registry, and collection
 * membership may change; there are no direct hardware effects.
 */
void func_0204d308(void *self)
{
    u8 *actor = (u8 *)self;
    void *state = actor + 0xec;
    Actor_SetRuntimeFlag80(actor);
    if (func_0201b23c(state) == 0)
        return;
    func_0201273c(state, 0);
    if ((actor[0x169] & 1) == 0)
        return;

    if (actor[0xe8] != 0) {
        if (func_0200b058(data_02105310, actor) == 0)
            return;
        if (actor[0xe8] != 2) {
            u8 *category = Actor_GetCollectionBySlot(actor, 1);
            void *runtime = Actor_GetCollection(actor);
            ActorCollection_EndTrackedPair(runtime, *(void **)(category + 0x2e7c), actor);
        }
        actor[0xe8] = 0;
        func_0201b180(state, func_0200af04(data_02105310));
        func_0201b228(state);
    }
    if ((*(u32 *)(actor + 0x14) & 0x20) != 0)
        ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
}
