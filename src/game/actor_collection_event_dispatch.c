#include "tingle/types.h"

/* Dispatch a caller-supplied event across all registered actor slots. */
typedef struct CollectionEventActor CollectionEventActor;

typedef struct CollectionEventVTable {
    u8 field_00[0x24];
    void (*callback_24)(CollectionEventActor *);
    u8 field_28[0x30];
    void (*event_58)(void *, CollectionEventActor *, void *);
} CollectionEventVTable;

struct CollectionEventActor {
    CollectionEventVTable *vtable_00;
    u8 field_04[0x0c];
    u32 flags_10;
    u32 flags_14;
};

typedef struct ActorCollectionEventDispatch {
    CollectionEventActor *actors_0000[128];
    u8 field_0200[0x2c74];
    s32 slotLimit_2e74;
} ActorCollectionEventDispatch;

/*
 * Scan nonnull actor slots up to offset 0x2e74. Pass a 12-byte temporary,
 * actor, and caller event to the vtable-offset-0x58 method. Then invoke the
 * offset-0x24 callback when flag 0x04 is set, flag 0x01000000 is clear, or
 * flag one is set. Returns no value; both virtual methods may mutate state.
 */
void func_0202eb18(ActorCollectionEventDispatch *self, void *event)
{
    s32 temporary[3];
    s32 i;

    for (i = 0; i < self->slotLimit_2e74; i++) {
        CollectionEventActor *actor = self->actors_0000[i];

        if (!actor)
            continue;
        actor->vtable_00->event_58(temporary, actor, event);
        if ((actor->flags_10 & 4) || !(actor->flags_14 & 0x01000000) ||
            (actor->flags_14 & 1))
            actor->vtable_00->callback_24(actor);
    }
}
