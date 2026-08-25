#include "tingle/actor_pair_state.h"

/*
 * Process potentially overlapping pairs from actor collection categories one
 * and two. The routine performs mask and sweep-order rejection, constructs
 * collision shapes, separates intersecting actors, maintains a pair-state
 * matrix, dispatches pair callbacks, and performs per-actor follow-up work.
 */
typedef struct ActorPairProcessingActor ActorPairProcessingActor;

typedef struct ActorPairFilterVTable {
    u8 methodsBeforePairFilter_00[0x0c];
    u32 (*getPairFilterMask_0c)(ActorPairProcessingActor *);
} ActorPairFilterVTable;

struct ActorPairProcessingActor {
    ActorPairFilterVTable *vtable_00;
    u8 baseStateBeforeFlags_04[0x0c];
    u32 flags_10;
    u32 flags_14;
    s32 positionState_18;
    s32 positionX_1c;
    s32 positionY_20;
    s32 positionZ_24;
    s32 previousPositionState_28;
    s32 previousX_2c;
    s32 previousY_30;
    u8 baseStateBeforeCollectionSlot_34[0x14];
    s8 collectionSlot_48;
    u8 contactEdges_49;
    u8 pairStateBytes_4a[2];
    u8 activeContactCount_4c;
    u8 type_4d;
    u8 baseStateBeforeCollisionFollowUp_4e[6];
    void *collisionFollowUpState_54;
};

typedef struct ActorPairProcessingCollection {
    ActorPairProcessingActor *actors_0000[128];
    ActorPairProcessingActor *categories_0200[5][128];
    u8 collectionStateBeforeCategoryCounts_0c00[0x220];
    s32 categoryCounts_0e20[5];
    ActorPairStateMatrix pairStateMatrix_0e34;
} ActorPairProcessingCollection;

typedef struct CollisionWords {
    s32 word[4];
} CollisionWords;

extern void *gGamePhaseRuntime;
extern u8 gActorRuntimeCollection[];
extern u8 gActorRuntimeFlags[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(CollisionWords *, const void *);
extern void VecFx32Object_Destroy(CollisionWords *);
extern void Actor_BuildCollisionRect(CollisionWords *, ActorPairProcessingActor *,
                                     CollisionWords *);
extern s32 RectS32_IntersectAndClassifyContact(
    CollisionWords *, const CollisionWords *, const CollisionWords *, u32 *);
extern s32 func_020adc90(s32, s32);
extern s32 SignedAbsoluteValue(s32);
extern s32 ActorRuntimeFlags_Test(void *, s32);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern void ActorCollision_ResolveCornerContacts(ActorPairProcessingActor *, void *);
extern void ActorCollision_ResolveSweptMovement(ActorPairProcessingActor *, void *);
#ifdef __cplusplus
}
#endif

static s32 multiplyFx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Split one axis of an overlap according to the actors' movement deltas, then
 * apply only corrections permitted by their recovered contact-edge bits.
 * This is an inferred extraction of the duplicated X/Y code in the retail
 * function; func_020adc90 performs the fixed-point division.
 */
static void resolvePairAxis(s32 overlap, s32 deltaA, s32 deltaB,
                            s32 *positionA, s32 *positionB, u8 edgesA,
                            u8 edgesB, u8 negativeEdge, u8 positiveEdge)
{
    s32 total = SignedAbsoluteValue(deltaA) + SignedAbsoluteValue(deltaB);
    s32 correctionA;
    s32 correctionB;

    if (overlap > total)
        return;
    if (deltaA == 0) {
        if (deltaB > 0 && (edgesB & positiveEdge))
            *positionB -= overlap;
        else if (deltaB < 0 && (edgesB & negativeEdge))
            *positionB += overlap;
        return;
    }
    if (deltaB == 0) {
        if (deltaA > 0 && (edgesA & positiveEdge))
            *positionA -= overlap;
        else if (deltaA < 0 && (edgesA & negativeEdge))
            *positionA += overlap;
        return;
    }

    correctionB = func_020adc90(multiplyFx(overlap, deltaB), total);
    correctionA = overlap - SignedAbsoluteValue(correctionB);
    if (deltaA <= 0)
        correctionA = -correctionA;
    if ((correctionA > 0 && (edgesA & positiveEdge)) ||
        (correctionA < 0 && (edgesA & negativeEdge)))
        *positionA -= correctionA;
    if ((correctionB > 0 && (edgesB & positiveEdge)) ||
        (correctionB < 0 && (edgesB & negativeEdge)))
        *positionB -= correctionB;
}

static s32 testPair(ActorPairProcessingActor *actorA,
                    ActorPairProcessingActor *actorB, u32 *contact)
{
    CollisionWords temporaryA;
    CollisionWords temporaryB;
    CollisionWords shapeA;
    CollisionWords shapeB;
    CollisionWords intersection = {{0, 0, 0, 0}};
    s32 result;

    if (!(actorA->flags_14 & 0x800000) &&
        !((actorA->flags_14 | actorB->flags_14) & 0x10) &&
        !(actorB->flags_14 & 0x800000) &&
        SignedAbsoluteValue(actorA->positionZ_24 - actorB->positionZ_24) >=
            0x1000)
        return 0;

    VecFx32Object_InitCopy(&temporaryA, &actorA->positionState_18);
    Actor_BuildCollisionRect(&shapeA, actorA, &temporaryA);
    VecFx32Object_Destroy(&temporaryA);
    VecFx32Object_InitCopy(&temporaryB, &actorB->positionState_18);
    Actor_BuildCollisionRect(&shapeB, actorB, &temporaryB);
    VecFx32Object_Destroy(&temporaryB);
    result = RectS32_IntersectAndClassifyContact(
        &intersection, &shapeA, &shapeB, contact);
    if (result) {
        actorA->contactEdges_49 = (u8)(*contact & 0x0f);
        actorB->contactEdges_49 = (u8)((*contact >> 8) & 0x0f);
    }
    if (result == 2 && !((actorA->flags_14 | actorB->flags_14) & 0x10)) {
        resolvePairAxis(intersection.word[2] - intersection.word[0],
                        actorA->positionX_1c - actorA->previousX_2c,
                        actorB->positionX_1c - actorB->previousX_2c,
                        &actorA->positionX_1c, &actorB->positionX_1c,
                        actorA->contactEdges_49, actorB->contactEdges_49, 1,
                        2);
        resolvePairAxis(intersection.word[3] - intersection.word[1],
                        actorA->positionY_20 - actorA->previousY_30,
                        actorB->positionY_20 - actorB->previousY_30,
                        &actorA->positionY_20, &actorB->positionY_20,
                        actorA->contactEdges_49, actorB->contactEdges_49, 4,
                        8);
    }
    return result;
}

/*
 * Sweep category one against category two using signed byte 0x48 as the sorted
 * key. Flag, virtual-mask, height, and shape tests reject pairs. Intersections
 * update edge byte 0x49 and may correct X/Y positions. Pair state at offset
 * 0x0e34 is queried or changed through ActorPairStateMatrix_IsTracked and
 * ActorPairStateMatrix_ClearPair, and callbacks run in both directions.
 * Finally, each processed category-one actor may receive
 * ActorCollision_ResolveCornerContacts and/or
 * ActorCollision_ResolveSweptMovement using global context offset 0x2ed4.
 * Returns no value; helper calls may update gameplay state.
 */
void ActorCollection_ProcessCategory1And2Pairs(ActorPairProcessingCollection *collection)
{
    s32 firstPossible = 0;
    s32 outerCount = collection->categoryCounts_0e20[1];
    s32 innerCount = collection->categoryCounts_0e20[2];
    void *contextValue = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    s32 outer;

    for (outer = 0; outer < outerCount; outer++) {
        ActorPairProcessingActor *actorA = collection->categories_0200[1][outer];
        s32 inner;

        if (actorA->flags_14 & 2)
            continue;
        for (inner = firstPossible; inner < innerCount; inner++) {
            ActorPairProcessingActor *actorB = collection->categories_0200[2][inner];
            s32 collision;
            s32 wasTracked;
            u32 contact;

            if (actorA->collectionSlot_48 >= actorB->collectionSlot_48) {
                firstPossible++;
                continue;
            }
            if (actorB->flags_14 & 4)
                continue;
            if (actorA->vtable_00->getPairFilterMask_0c(actorA) &
                (actorB->flags_10 & 0x1f0000))
                continue;
            if (actorB->vtable_00->getPairFilterMask_0c(actorB) &
                (actorA->flags_10 & 0x1f0000))
                continue;

            collision = testPair(actorA, actorB, &contact);
            wasTracked = ActorPairStateMatrix_IsTracked(
                &collection->pairStateMatrix_0e34,
                actorB->collectionSlot_48, actorA->collectionSlot_48);
            if (collision) {
                s32 accepted;
                s32 wasTrackedValue = wasTracked ? 1 : 0;

                accepted = ActorCollection_DispatchPairActive(
                    (ActorPairCollection *)collection,
                    (ActorPairActor *)actorA, (ActorPairActor *)actorB,
                    wasTrackedValue);
                accepted += ActorCollection_DispatchPairActive(
                    (ActorPairCollection *)collection,
                    (ActorPairActor *)actorB, (ActorPairActor *)actorA,
                    wasTrackedValue);
                if (accepted == 2) {
                    s32 low = actorA->collectionSlot_48;
                    s32 high = actorB->collectionSlot_48;
                    s32 index;

                    if (low > high) {
                        s32 swap = low;
                        low = high;
                        high = swap;
                    }
                    index = low * ACTOR_PAIR_SLOT_COUNT -
                            (low * (low + 1)) / 2 + high;
                    collection->pairStateMatrix_0e34.entries[index] = 1;
                }
            } else if (wasTracked) {
                ActorCollection_DispatchPairEnded(
                    (ActorPairCollection *)collection,
                    (ActorPairActor *)actorA, (ActorPairActor *)actorB);
                ActorCollection_DispatchPairEnded(
                    (ActorPairCollection *)collection,
                    (ActorPairActor *)actorB, (ActorPairActor *)actorA);
                ActorPairStateMatrix_ClearPair(
                    &collection->pairStateMatrix_0e34,
                    actorB->collectionSlot_48, actorA->collectionSlot_48);
            }
        }

        if (actorA->collisionFollowUpState_54 &&
            (actorA->type_4d == 1 || actorA->type_4d == 7)) {
            if (!(actorA->flags_14 & 0x40) &&
                !ActorRuntimeFlags_Test(gActorRuntimeFlags, 1)) {
                if (!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection))
                    ActorCollision_ResolveCornerContacts(actorA, contextValue);
                ActorCollision_ResolveSweptMovement(actorA, contextValue);
            }
        } else if (!actorA->collisionFollowUpState_54 ||
                   !(actorA->flags_14 & 0x100)) {
            ActorCollision_ResolveSweptMovement(actorA, contextValue);
        }
    }
}
