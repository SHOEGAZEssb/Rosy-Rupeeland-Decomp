#include "tingle/types.h"

/*
 * Register and remove actors from the 128-slot collection. Actor types one
 * and seven have reserved slots/pointers, while ordinary actors use slots
 * 2..127. A packed upper-triangular byte matrix tracks pair relationships that
 * trigger an address-derived unlink callback during removal.
 */
typedef struct RegisteredActor RegisteredActor;
typedef struct RegisteredActorVTable {
    void *field_00;
    void (*destroy_04)(RegisteredActor *self);
} RegisteredActorVTable;
struct RegisteredActor {
    RegisteredActorVTable *vtable_00;
    u8 field_04[0x44];
    s8 slot_48;
    u8 field_49[4];
    u8 type_4d;
    u8 field_4e[0x96];
    s16 field_00e4;
};
typedef struct ActorCollectionRegistration {
    RegisteredActor *actors_0000[128];
    void *relations_0200[5][128];
    RegisteredActor *field_0c00[128];
    void *sprite_0e00;
    u8 field_0e04[0x18];
    s32 actorCount_0e1c;
    void *field_0e20[5];
    u8 relationshipMatrix_0e34[0x2040];
    s32 slotLimit_2e74;
    u32 flags_2e78;
    RegisteredActor *specialActor_2e7c;
    RegisteredActor *secondaryActor_2e80;
} ActorCollectionRegistration;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_NotifyPairEnded(ActorCollectionRegistration *self,
                          RegisteredActor *other,
                          RegisteredActor *removed);
extern void ActorCollection_UnregisterActor(ActorCollectionRegistration *, RegisteredActor *);
extern u8 ActorPairMatrix_Get(const u8 *, s32, s32);
extern void ActorPairMatrix_Clear(u8 *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Install type-one actors in reserved slot zero and type-seven actors with
 * field_00e4 equal to one in reserved slot one when vacant. Otherwise reject
 * duplicates, place the actor in the first empty slot from 2..127, increment
 * actorCount_0e1c, store the byte-sized slot index on the actor, and extend
 * slotLimit_2e74 when necessary. Capacity exhaustion is not handled by the
 * recovered code and is assumed impossible.
 */
void ActorCollection_RegisterActor(ActorCollectionRegistration *self, RegisteredActor *actor)
{
    s32 i;
    s32 freeIndex = -1;
    RegisteredActor **freeSlot = 0;

    if (actor->type_4d == 1) {
        actor->slot_48 = 0;
        self->actors_0000[0] = actor;
        self->specialActor_2e7c = actor;
        return;
    }
    if (actor->type_4d == 7 && actor->field_00e4 == 1 &&
        self->secondaryActor_2e80 == 0) {
        actor->slot_48 = 1;
        self->actors_0000[1] = actor;
        self->secondaryActor_2e80 = actor;
        return;
    }
    for (i = 2; i < 128; i++) {
        if (self->actors_0000[i] == actor)
            return;
        if (freeSlot == 0 && self->actors_0000[i] == 0) {
            freeIndex = i;
            freeSlot = &self->actors_0000[i];
        }
    }
    self->actorCount_0e1c++;
    /* A full collection reaches this null write in the retail control flow. */
    *freeSlot = actor;
    actor->slot_48 = (s8)freeIndex;
    if (self->slotLimit_2e74 < freeIndex + 1)
        self->slotLimit_2e74 = freeIndex + 1;
}

/*
 * Remove actor from its reserved or searched slot. Clear its field_0c00 entry,
 * decrement the ordinary actor count, notify every remaining related actor
 * through ActorCollection_NotifyPairEnded, clear every matrix edge involving the removed slot,
 * and finally clear the actor slot. A missing actor causes no state change.
 */
void ActorCollection_UnregisterActor(ActorCollectionRegistration *self, RegisteredActor *actor)
{
    s32 index = -1;
    s32 i;

    if (actor->type_4d == 1) {
        self->specialActor_2e7c = 0;
        index = 0;
    } else if (actor->type_4d == 7 && self->secondaryActor_2e80 == actor) {
        self->secondaryActor_2e80 = 0;
        index = 1;
    } else {
        for (i = 0; i < self->slotLimit_2e74; i++)
            if (self->actors_0000[i] == actor)
                index = i;
    }
    if (index == -1)
        return;
    self->field_0c00[index] = 0;
    self->actorCount_0e1c--;
    for (i = 0; i < 128; i++) {
        if (self->actors_0000[i] &&
            ActorPairMatrix_Get(self->relationshipMatrix_0e34, index, i))
            ActorCollection_NotifyPairEnded(self, self->actors_0000[i], actor);
        ActorPairMatrix_Clear(self->relationshipMatrix_0e34, index, i);
    }
    self->actors_0000[index] = 0;
}

/*
 * Return the relationship byte for an unordered pair of slot indices. The
 * larger index is stored within a row selected by the smaller index; row n
 * starts at n*128 - n*(n+1)/2, yielding exactly 0x2040 bytes for 128 rows.
 */
u8 ActorPairMatrix_Get(const u8 *matrix, s32 first, s32 second)
{
    s32 temporary;
    if (second > first) {
        temporary = first;
        first = second;
        second = temporary;
    }
    return matrix[first + second * 128 - second * (second + 1) / 2];
}

/* Clear the relationship byte for an unordered pair using the same packed index. */
void ActorPairMatrix_Clear(u8 *matrix, s32 first, s32 second)
{
    s32 temporary;
    if (second > first) {
        temporary = first;
        first = second;
        second = temporary;
    }
    matrix[first + second * 128 - second * (second + 1) / 2] = 0;
}

/* Remove actor from the collection and invoke its vtable offset-0x04 destructor when nonnull. */
void ActorCollection_UnregisterAndDestroyActor(ActorCollectionRegistration *self, RegisteredActor *actor)
{
    ActorCollection_UnregisterActor(self, actor);
    if (actor)
        actor->vtable_00->destroy_04(actor);
}

/* Remove and destroy every nonnull actor encountered across all 128 slots. */
void ActorCollection_UnregisterAndDestroyAllActors(ActorCollectionRegistration *self)
{
    s32 i;
    for (i = 0; i < 128; i++) {
        RegisteredActor *actor = self->actors_0000[i];
        if (actor) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable_00->destroy_04(actor);
        }
    }
}
