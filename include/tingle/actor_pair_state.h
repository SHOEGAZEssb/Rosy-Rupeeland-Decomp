#ifndef TINGLE_ACTOR_PAIR_STATE_H
#define TINGLE_ACTOR_PAIR_STATE_H

#include "tingle/types.h"

enum {
    ACTOR_PAIR_SLOT_COUNT = 128,
    ACTOR_PAIR_STATE_ENTRY_COUNT = 0x2040,
    ACTOR_PAIR_ACTIVE_CONTACT_FLAG = 0x00000001,
    ACTOR_PAIR_STEPPER_ACTIVE_FLAG = 0x00000040,
    ACTOR_PAIR_OTHER_MOTION_GATE = 0x00000010,
    ACTOR_PAIR_STEPPER_CANCEL_ALLOWED = 0x40000000
};

/* Packed upper-triangular tracked-state bytes for every unordered pair of
 * actor collection slots, including the diagonal. Valid retail callers pass
 * registered slot indices in the range 0..127; these operations do not
 * perform bounds checks. */
typedef struct ActorPairStateMatrix {
    u8 entries[ACTOR_PAIR_STATE_ENTRY_COUNT];
} ActorPairStateMatrix;

typedef char ActorPairStateMatrixSizeCheck[
    sizeof(ActorPairStateMatrix) == 0x2040 ? 1 : -1];

/* Actor and collection layouts are recovered independently by their owners;
 * the pair-state API only borrows both objects for the duration of a call. */
typedef struct ActorPairActor ActorPairActor;
typedef struct ActorPairCollection ActorPairCollection;

typedef s32 (*ActorPairActiveCallback)(ActorPairActor *actor,
                                       ActorPairActor *other,
                                       s32 wasTracked);
typedef void (*ActorPairEndedCallback)(ActorPairActor *actor,
                                       ActorPairActor *other);

/* Verified actor-state view used by the pair lifecycle. Bytes not consumed by
 * this family remain carry-through state rather than being assigned a
 * speculative purpose. */
typedef struct ActorPairContactStateView {
    u8 stateBeforeFlags_00[0x10];
    u32 flags_10;
    u32 motionFlags_14;
    u8 stateBeforeCollectionSlot_18[0x30];
    s8 collectionSlot_48;
    u8 contactEdges_49;
    u8 carryThroughState_4a[2];
    u8 activeContactCount_4c;
    u8 type_4d;
} ActorPairContactStateView;

typedef char ActorPairContactStateViewSizeCheck[
    sizeof(ActorPairContactStateView) == 0x50 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void ActorPairStateMatrix_ClearAll(ActorPairStateMatrix *matrix);
u8 ActorPairStateMatrix_IsTracked(const ActorPairStateMatrix *matrix,
                                  s32 firstSlot, s32 secondSlot);
void ActorPairStateMatrix_ClearPair(ActorPairStateMatrix *matrix,
                                    s32 firstSlot, s32 secondSlot);

void ActorCollection_EndTrackedPair(ActorPairCollection *collection,
                                    ActorPairActor *actor,
                                    ActorPairActor *other);
s32 ActorCollection_DispatchPairActive(ActorPairCollection *collection,
                                       ActorPairActor *actor,
                                       ActorPairActor *other,
                                       s32 wasTracked);
void ActorCollection_DispatchPairEnded(ActorPairCollection *collection,
                                       ActorPairActor *actor,
                                       ActorPairActor *other);

s32 ActorContactState_AddContact(ActorPairActor *actor,
                                 ActorPairActor *other,
                                 s32 wasTracked);
void ActorContactState_RemoveContact(ActorPairActor *actor);
s32 ActorDerivedRuntime_HandlePairActive(ActorPairActor *actor,
                                         ActorPairActor *other,
                                         s32 wasTracked);
void ActorDerivedRuntime_HandlePairEnded(ActorPairActor *actor,
                                         ActorPairActor *other);

#ifdef __cplusplus
}
#endif

#endif
