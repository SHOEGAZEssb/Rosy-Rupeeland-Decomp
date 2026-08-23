#ifndef TINGLE_ACTOR_COLLECTION_H
#define TINGLE_ACTOR_COLLECTION_H

#include "tingle/actor_pair_state.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/overlay_manager.h"
#include "tingle/types.h"

enum {
    ACTOR_COLLECTION_SLOT_COUNT = ACTOR_PAIR_SLOT_COUNT,
    ACTOR_COLLECTION_CATEGORY_COUNT = 5,
    ACTOR_COLLECTION_TYPE_ONE_SLOT = 0,
    ACTOR_COLLECTION_TYPE_SEVEN_SLOT = 1,
    ACTOR_COLLECTION_FIRST_ORDINARY_SLOT = 2,
    ACTOR_COLLECTION_RESERVED_TYPE_ONE = 1,
    ACTOR_COLLECTION_RESERVED_TYPE_SEVEN = 7,
    ACTOR_COLLECTION_TYPE_SEVEN_RESERVED_RUNTIME_ID = 1,
    ACTOR_COLLECTION_PROCESS_REMOVAL_QUEUE_FLAG = 0x00000001,
    ACTOR_COLLECTION_STATE_FLAG_BIT_ONE = 0x00000002,
    ACTOR_COLLECTION_ORDINARY_RETAIN_DURING_PRUNE_FLAG = 0x00100000,
    ACTOR_COLLECTION_TYPE_SEVEN_HAS_TARGET_FLAG = 0x00000010,
    ACTOR_COLLECTION_DEFAULT_SCALE = 0x1000,
    ACTOR_COLLECTION_SENTINEL_INDEX_COUNT = 4
};

typedef struct ActorCollectionActor ActorCollectionActor;
typedef ActorCollectionActor *(*ActorCollectionActorDestructor)(
    ActorCollectionActor *self);

/* The first two vtable entries perform the same teardown, but only the second
 * frees the actor allocation. Both return the actor's former address. */
typedef struct ActorCollectionActorVTable {
    ActorCollectionActorDestructor destroyWithoutFree;
    ActorCollectionActorDestructor destroyAndFree;
} ActorCollectionActorVTable;

/* Verified actor fields shared by registration, pair teardown, retention
 * pruning, and deferred removal. Unconsumed bytes remain carry-through state
 * so this view does not assign them speculative semantics. */
struct ActorCollectionActor {
    ActorCollectionActorVTable *vtable;
    u8 stateBeforeFlags[0x0c];
    u32 flags;
    u32 motionFlags;
    u8 stateBeforeCollectionSlot[0x30];
    s8 collectionSlot;
    u8 contactEdges;
    u8 pairStateBytes[2];
    u8 activeContactCount;
    u8 type;
    u16 subtype;
    s16 groupId;
    u8 stateBeforeRuntimeFlags[0x7e];
    u32 runtimeFlags;
    u8 stateBeforeRuntimeId[0x10];
    s16 runtimeId;
    u8 carryThroughAfterRuntimeId[2];
};

/* Only type-seven actors are known to extend through targetStateFlags. Keep
 * this separate from the heterogeneous base view because other collection
 * actor allocations end before offset 0x268. */
typedef struct ActorCollectionType7ActorView {
    ActorCollectionActor base;
    u8 type7StateBeforeTargetFlags[0x180];
    u32 targetStateFlags;
} ActorCollectionType7ActorView;

/* Resident actor registry. Slots zero and one are reserved for selected type
 * one and type seven actors; ordinary actors occupy slots 2..127. The five
 * category arrays and their counts are rebuilt by the collection update
 * families. removalQueue is borrowed until the deferred drain destroys its
 * entries. Embedded overlay slots and the optional sprite group are owned by
 * the collection and released by Deinit/Destructor. actorScale uses Q12 units. */
typedef struct ActorCollection {
    ActorCollectionActor *actors[ACTOR_COLLECTION_SLOT_COUNT];
    ActorCollectionActor
        *categories[ACTOR_COLLECTION_CATEGORY_COUNT][ACTOR_COLLECTION_SLOT_COUNT];
    ActorCollectionActor *removalQueue[ACTOR_COLLECTION_SLOT_COUNT];
    GraphicsSpriteGroup *spriteGroup;
    OverlaySlot firstOverlaySlot;
    OverlaySlot secondOverlaySlot;
    /* Initialized with a two-reserved-slot baseline; ordinary registration
     * increments it and every successful unregistration decrements it. */
    s32 actorCount;
    s32 categoryCounts[ACTOR_COLLECTION_CATEGORY_COUNT];
    ActorPairStateMatrix pairStateMatrix;
    s32 slotLimit;
    u32 flags;
    ActorCollectionActor *reservedTypeOneActor;
    ActorCollectionActor *reservedTypeSevenActor;
    s32 spriteGroupDisplayMode;
    s32 actorScale;
    u8 carryThroughState[4];
    /* Purpose unknown; Init writes -1 to all four entries. */
    s32 sentinelIndices[ACTOR_COLLECTION_SENTINEL_INDEX_COUNT];
} ActorCollection;

typedef char ActorCollectionActorVTableSizeCheck[
    sizeof(ActorCollectionActorVTable) == 0x08 ? 1 : -1];
typedef char ActorCollectionActorSizeCheck[
    sizeof(ActorCollectionActor) == 0x0e8 ? 1 : -1];
typedef char ActorCollectionType7ActorViewSizeCheck[
    sizeof(ActorCollectionType7ActorView) == 0x26c ? 1 : -1];
typedef char ActorCollectionSizeCheck[
    sizeof(ActorCollection) == 0x2ea0 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorCollection *ActorCollection_Init(ActorCollection *self);
void ActorCollection_CreateSpriteGroupForDisplayMode(ActorCollection *self,
                                                     s32 displayMode);
ActorCollection *ActorCollection_Destructor(ActorCollection *self);
void ActorCollection_Deinit(ActorCollection *self);
void ActorCollection_RegisterActor(ActorCollection *self,
                                   ActorCollectionActor *actor);
void ActorCollection_UnregisterActor(ActorCollection *self,
                                     ActorCollectionActor *actor);
void ActorCollection_UnregisterAndDestroyActor(ActorCollection *self,
                                               ActorCollectionActor *actor);
void ActorCollection_UnregisterAndDestroyAllActors(ActorCollection *self);
void ActorCollection_DestroyUnretainedActors(ActorCollection *self);
void ActorCollection_QueueActorForRemoval(ActorCollection *self,
                                          ActorCollectionActor *actor);
void ActorCollection_QueueGroupForRemoval(ActorCollection *self, s32 groupId);
void ActorCollection_DrainRemovalQueue(ActorCollection *self);

#ifdef __cplusplus
}
#endif

#endif
