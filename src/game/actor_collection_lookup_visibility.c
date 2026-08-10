#include "tingle/types.h"

/*
 * Search collection actors by compact identity fields and propagate a shared
 * visibility/enable state through the collection's sprite, actor virtual hook,
 * and auxiliary sprites reachable from the two reserved actors.
 */
typedef struct LookupActor {
    void **vtable_00;
    u8 field_04[0x49];
    u8 type_4d;
    u16 id_4e;
} LookupActor;
typedef struct VisibilityObject {
    u8 field_00[0x20];
    s32 enabled_20;
} VisibilityObject;
typedef struct VisibilityHolder {
    u8 field_00[0x0c];
    VisibilityObject *object_0c;
} VisibilityHolder;
typedef struct ActorCollectionLookupVisibility {
    LookupActor *actors_0000[128];
    u8 field_0200[0xc00];
    VisibilityObject *sprite_0e00;
    u8 field_0e04[0x2070];
    s32 slotLimit_2e74;
    u32 flags_2e78;
    LookupActor *specialActor_2e7c;
    LookupActor *secondaryActor_2e80;
} ActorCollectionLookupVisibility;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *object);
#ifdef __cplusplus
}
#endif

/* Return the first actor whose type_4d and id_4e match, or null when absent. */
LookupActor *ActorCollection_FindActorByTypeAndId(ActorCollectionLookupVisibility *self,
                          u8 type, u16 id)
{
    s32 i;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        LookupActor *actor = self->actors_0000[i];
        if (actor && actor->type_4d == type && actor->id_4e == id)
            return actor;
    }
    return 0;
}

/*
 * When enabled is nonzero, write one to sprite_0e00->enabled_20, call every
 * actor's vtable offset-0x54 hook with one, and write one to auxiliary sprite
 * field 0x20 when the reserved actors' offset-0x26c/0x234 holders exist.
 * When disabled, pass each corresponding sprite object to GraphicsSpriteGroup_ReleaseIndexedEntries and
 * call actor hooks with zero. The concrete graphics-library meaning of the
 * field and address-derived helper is inferred as visibility, not confirmed.
 */
void ActorCollection_SetEnabled(ActorCollectionLookupVisibility *self, s32 enabled)
{
    s32 i;
    void (*setActorState)(LookupActor *, s32);
    VisibilityHolder *holder;

    if (enabled) {
        self->sprite_0e00->enabled_20 = 1;
        for (i = 0; i < self->slotLimit_2e74; i++) {
            LookupActor *actor = self->actors_0000[i];
            if (actor) {
                setActorState = (void (*)(LookupActor *, s32))actor->vtable_00[0x15];
                setActorState(actor, 1);
            }
        }
        if (self->specialActor_2e7c) {
            holder = *(VisibilityHolder **)((u8 *)self->specialActor_2e7c + 0x26c);
            if (holder)
                holder->object_0c->enabled_20 = 1;
        }
        if (self->secondaryActor_2e80) {
            holder = *(VisibilityHolder **)((u8 *)self->secondaryActor_2e80 + 0x234);
            if (holder)
                holder->object_0c->enabled_20 = 1;
        }
        return;
    }

    GraphicsSpriteGroup_ReleaseIndexedEntries(self->sprite_0e00);
    for (i = 0; i < self->slotLimit_2e74; i++) {
        LookupActor *actor = self->actors_0000[i];
        if (actor) {
            setActorState = (void (*)(LookupActor *, s32))actor->vtable_00[0x15];
            setActorState(actor, 0);
        }
    }
    if (self->specialActor_2e7c) {
        holder = *(VisibilityHolder **)((u8 *)self->specialActor_2e7c + 0x26c);
        if (holder)
            GraphicsSpriteGroup_ReleaseIndexedEntries(holder->object_0c);
    }
    if (self->secondaryActor_2e80) {
        holder = *(VisibilityHolder **)((u8 *)self->secondaryActor_2e80 + 0x234);
        if (holder)
            GraphicsSpriteGroup_ReleaseIndexedEntries(holder->object_0c);
    }
}
