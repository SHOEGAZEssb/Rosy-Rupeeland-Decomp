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
extern s32 func_0202d2f4(u8 *, s32, s32);
extern void func_0202d324(u8 *, s32, s32);
extern s32 func_0203b9dc(PairCallbackActor *, PairCallbackActor *, s32);
extern void func_0203baa0(PairCallbackActor *, PairCallbackActor *);
void func_0202ec74(PairCallbackCollection *, PairCallbackActor *,
                   PairCallbackActor *);
#ifdef __cplusplus
}
#endif

/*
 * Deliver an active/contact notification from actor to other. When actor flag
 * 0x01000000 is set, types one, two, and seven use func_0203b9dc; all other
 * cases use vtable offset 0x28. priorActive is forwarded unchanged. Return the
 * selected handler's integer result; no hardware or SDK state is touched here.
 */
s32 func_0202ec08(PairCallbackCollection *self, PairCallbackActor *actor,
                  PairCallbackActor *other, s32 priorActive)
{
    (void)self;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 7 || actor->type_4d == 1))
        return func_0203b9dc(actor, other, priorActive);
    return actor->vtable_00->active_28(actor, other, priorActive);
}

/*
 * Deliver a pair-ended notification from actor to other. With actor flag
 * 0x01000000 set, types one and two use func_0203baa0; other cases call vtable
 * offset 0x2c. Returns no value; the selected handler owns state changes.
 */
void func_0202ec74(PairCallbackCollection *self, PairCallbackActor *actor,
                   PairCallbackActor *other)
{
    (void)self;
    if ((actor->flags_10 & 0x01000000) &&
        (actor->type_4d == 2 || actor->type_4d == 1))
        func_0203baa0(actor, other);
    else
        actor->vtable_00->ended_2c(actor, other);
}

/*
 * Query the pair-state matrix at offset 0x0e34 using the actors' signed keys at
 * 0x48. If active, send ended notifications in both directions, then always
 * clear the matrix entry through func_0202d324. Returns no value.
 */
void func_0202eba4(PairCallbackCollection *self, PairCallbackActor *actor,
                   PairCallbackActor *other)
{
    s8 actorKey = *(s8 *)((u8 *)actor + 0x48);
    s8 otherKey = *(s8 *)((u8 *)other + 0x48);

    if (func_0202d2f4(self->pairState_0e34, actorKey, otherKey)) {
        func_0202ec74(self, actor, other);
        func_0202ec74(self, other, actor);
    }
    func_0202d324(self->pairState_0e34, actorKey, otherKey);
}
