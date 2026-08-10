#include "tingle/types.h"

/* Route actor-pair lifecycle notifications and clear tracked pair state. */
typedef struct PairCallbackActor PairCallbackActor;

typedef struct PairCallbackVTable {
    u8 field_00[0x28];
    s32 (*active_28)(PairCallbackActor *, PairCallbackActor *, s32);
    void (*ended_2c)(PairCallbackActor *, PairCallbackActor *);
} PairCallbackVTable;

struct PairCallbackActor {
    PairCallbackVTable *vtable_00;
    u8 field_04[0x0c];
    u32 flags_10;
    u8 field_14[0x39];
    u8 type_4d;
};

typedef struct PairCallbackCollection {
    u8 field_0000[0xe34];
    u8 pairState_0e34[0x2040];
} PairCallbackCollection;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorPairMatrix_Get(u8 *, s32, s32);
extern void ActorPairMatrix_Clear(u8 *, s32, s32);
extern s32 ActorDerivedRuntime_HandlePairActive(PairCallbackActor *, PairCallbackActor *, s32);
extern void ActorDerivedRuntime_HandlePairEnded(PairCallbackActor *, PairCallbackActor *);
void ActorCollection_NotifyPairEnded(PairCallbackCollection *, PairCallbackActor *,
                   PairCallbackActor *);
#ifdef __cplusplus
}
#endif

/*
 * Deliver an active/contact notification from actor to other. When actor flag
 * 0x01000000 is set, types one, two, and seven use
 * ActorDerivedRuntime_HandlePairActive; all other cases use vtable offset
 * 0x28. priorActive is forwarded unchanged. Return the selected handler's
 * integer result; no hardware or SDK state is touched here.
 */
s32 ActorCollection_NotifyPairActive(PairCallbackCollection *self, PairCallbackActor *actor,
                  PairCallbackActor *other, s32 priorActive)
{
    (void)self;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 7 || actor->type_4d == 1))
        return ActorDerivedRuntime_HandlePairActive(actor, other, priorActive);
    return actor->vtable_00->active_28(actor, other, priorActive);
}

/*
 * Deliver a pair-ended notification from actor to other. With actor flag
 * 0x01000000 set, types one and two use
 * ActorDerivedRuntime_HandlePairEnded; other cases call vtable offset 0x2c.
 * Returns no value; the selected handler owns state changes.
 */
void ActorCollection_NotifyPairEnded(PairCallbackCollection *self, PairCallbackActor *actor,
                   PairCallbackActor *other)
{
    (void)self;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 1))
        ActorDerivedRuntime_HandlePairEnded(actor, other);
    else
        actor->vtable_00->ended_2c(actor, other);
}

/*
 * Query the pair-state matrix at offset 0x0e34 using the actors' signed keys at
 * 0x48. If active, send ended notifications in both directions, then always
 * clear the matrix entry through ActorPairMatrix_Clear. Returns no value.
 */
void ActorCollection_EndTrackedPair(PairCallbackCollection *self, PairCallbackActor *actor,
                   PairCallbackActor *other)
{
    s8 actorKey = *(s8 *)((u8 *)actor + 0x48);
    s8 otherKey = *(s8 *)((u8 *)other + 0x48);

    if (ActorPairMatrix_Get(self->pairState_0e34, actorKey, otherKey)) {
        ActorCollection_NotifyPairEnded(self, actor, other);
        ActorCollection_NotifyPairEnded(self, other, actor);
    }
    ActorPairMatrix_Clear(self->pairState_0e34, actorKey, otherKey);
}
