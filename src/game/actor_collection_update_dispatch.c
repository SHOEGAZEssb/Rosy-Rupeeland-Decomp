#include "tingle/types.h"

/*
 * Dispatch actor update callbacks from the collection's primary category and
 * from the complete slot array. These passes also clear transient flag 0x80
 * before selected updates and route a few actor types through a shared helper.
 */
typedef struct CollectionDispatchActor CollectionDispatchActor;
typedef void (*CollectionActorCallback)(CollectionDispatchActor *);

typedef struct CollectionDispatchVTable {
    u8 field_00[0x1c];
    CollectionActorCallback callback_1c;
} CollectionDispatchVTable;

struct CollectionDispatchActor {
    CollectionDispatchVTable *vtable_00;
    u8 field_04[0x0c];
    u32 flags_10;
    u32 flags_14;
    u8 field_18[0x35];
    u8 type_4d;
};

typedef struct ActorCollectionDispatch {
    CollectionDispatchActor *actors_0000[128];
    CollectionDispatchActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
    u8 field_0e34[0x2040];
    s32 slotLimit_2e74;
} ActorCollectionDispatch;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203b798(CollectionDispatchActor *);
#ifdef __cplusplus
}
#endif

/*
 * Visit every actor in category zero. Actors carrying flag 0x01000000 and
 * type one, two, or five are passed to func_0203b798; all others receive the
 * virtual callback at vtable offset 0x1c. The routine returns no value, and
 * any observable changes are those performed by the selected callee.
 */
void ActorCollection_UpdateCategory0Actors(ActorCollectionDispatch *self)
{
    s32 count = self->categoryCounts_0e20[0];
    s32 i;

    for (i = 0; i < count; i++) {
        CollectionDispatchActor *actor = self->categories_0200[0][i];

        if ((actor->flags_10 & 0x01000000) &&
            (actor->type_4d == 1 || actor->type_4d == 2 ||
             actor->type_4d == 5))
            func_0203b798(actor);
        else
            actor->vtable_00->callback_1c(actor);
    }
}

/*
 * Clear transient flag 0x80 on every category-zero actor. Actors lacking flag
 * 0x100 receive no callback. Of the remainder, types two and five use
 * func_0203b798 when flag 0x01000000 is set; type one and all other cases use
 * the callback at vtable offset 0x1c. The routine returns no value.
 */
void ActorCollection_UpdateFlag100Category0Actors(ActorCollectionDispatch *self)
{
    s32 count = self->categoryCounts_0e20[0];
    s32 i;

    for (i = 0; i < count; i++) {
        CollectionDispatchActor *actor = self->categories_0200[0][i];

        actor->flags_10 &= ~0x80;
        if (!(actor->flags_10 & 0x100))
            continue;
        if ((actor->flags_10 & 0x01000000) &&
            (actor->type_4d == 2 || actor->type_4d == 5))
            func_0203b798(actor);
        else
            actor->vtable_00->callback_1c(actor);
    }
}

/*
 * Scan all registered slots up to offset 0x2e74, ignoring null entries. Clear
 * transient flag 0x80 on each actor and invoke its vtable-offset-0x1c callback
 * only when actor flag 0x800 is set. The callback owns any further state or
 * SDK effects; this routine returns no value.
 */
void ActorCollection_UpdateFlag800Actors(ActorCollectionDispatch *self)
{
    s32 i;

    for (i = 0; i < self->slotLimit_2e74; i++) {
        CollectionDispatchActor *actor = self->actors_0000[i];

        if (!actor)
            continue;
        actor->flags_10 &= ~0x80;
        if (actor->flags_14 & 0x800)
            actor->vtable_00->callback_1c(actor);
    }
}
