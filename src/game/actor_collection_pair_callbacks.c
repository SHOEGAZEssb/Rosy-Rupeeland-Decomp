#include "tingle/actor_pair_state.h"

/* Route actor-pair lifecycle notifications and clear tracked pair state. */
typedef struct ActorPairCallbackVTable {
    u8 methodsBeforePairCallbacks_00[0x28];
    ActorPairActiveCallback dispatchPairActive_28;
    ActorPairEndedCallback dispatchPairEnded_2c;
} ActorPairCallbackVTable;

struct ActorPairActor {
    ActorPairCallbackVTable *vtable_00;
    u8 baseStateBeforeFlags_04[0x0c];
    u32 flags_10;
    u8 baseStateBeforeCollectionSlot_14[0x34];
    s8 collectionSlot_48;
    u8 contactEdges_49;
    u8 pairStateBytes_4a[2];
    u8 activeContactCount_4c;
    u8 type_4d;
};

struct ActorPairCollection {
    u8 collectionStateBeforePairMatrix_0000[0xe34];
    ActorPairStateMatrix pairStateMatrix_0e34;
};

/*
 * Deliver an active/contact notification from actor to other. When actor flag
 * 0x01000000 is set, types one, two, and seven use
 * ActorDerivedRuntime_HandlePairActive; all other cases use vtable offset
 * 0x28. wasTracked is forwarded unchanged. Return the selected handler's
 * integer result; no hardware or SDK state is touched here.
 */
s32 ActorCollection_DispatchPairActive(ActorPairCollection *collection,
                                       ActorPairActor *actor,
                                       ActorPairActor *other, s32 wasTracked)
{
    (void)collection;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 7 || actor->type_4d == 1))
        return ActorDerivedRuntime_HandlePairActive(actor, other, wasTracked);
    return actor->vtable_00->dispatchPairActive_28(actor, other, wasTracked);
}

/*
 * Deliver a pair-ended notification from actor to other. With actor flag
 * 0x01000000 set, types one and two use
 * ActorDerivedRuntime_HandlePairEnded; other cases call vtable offset 0x2c.
 * Returns no value; the selected handler owns state changes.
 */
void ActorCollection_DispatchPairEnded(ActorPairCollection *collection,
                                       ActorPairActor *actor,
                                       ActorPairActor *other)
{
    (void)collection;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 1))
        ActorDerivedRuntime_HandlePairEnded(actor, other);
    else
        actor->vtable_00->dispatchPairEnded_2c(actor, other);
}

/*
 * Query the pair-state matrix at offset 0x0e34 using the actors' signed keys at
 * 0x48. If active, send ended notifications in both directions, then always
 * clear the matrix entry through ActorPairStateMatrix_ClearPair. Returns no value.
 */
void ActorCollection_EndTrackedPair(ActorPairCollection *collection,
                                    ActorPairActor *actor,
                                    ActorPairActor *other)
{
    s8 actorSlot = actor->collectionSlot_48;
    s8 otherSlot = other->collectionSlot_48;

    if (ActorPairStateMatrix_IsTracked(&collection->pairStateMatrix_0e34,
                                       actorSlot, otherSlot)) {
        ActorCollection_DispatchPairEnded(collection, actor, other);
        ActorCollection_DispatchPairEnded(collection, other, actor);
    }
    ActorPairStateMatrix_ClearPair(&collection->pairStateMatrix_0e34,
                                   actorSlot, otherSlot);
}
