#include "tingle/heap.h"
#include "tingle/types.h"

/* Teardown methods for the paired-sprite phase-90 title effect object. */

typedef struct TitleEffectOwnedObject TitleEffectOwnedObject;

typedef struct TitleEffectOwnedVTable {
    void (*destroy)(TitleEffectOwnedObject *self);
    void (*destroyAndFree)(TitleEffectOwnedObject *self);
} TitleEffectOwnedVTable;

struct TitleEffectOwnedObject {
    const TitleEffectOwnedVTable *vtable;
};

typedef struct TitleEffect {
    const void *vtable;
    TitleEffectOwnedObject *primary;
    TitleEffectOwnedObject *secondary;
} TitleEffect;

extern const void *data_ov090_0221ccc8[];

/* Restore the effect vtable, destroy/free both optional sprite owners, and return self. */
TitleEffect *func_ov090_0221c5ec(TitleEffect *self)
{
    self->vtable = data_ov090_0221ccc8;
    if (self->primary != 0)
        self->primary->vtable->destroyAndFree(self->primary);
    if (self->secondary != 0)
        self->secondary->vtable->destroyAndFree(self->secondary);
    return self;
}

/* Perform the normal teardown, free the effect allocation, and return its address. */
TitleEffect *func_ov090_0221c638(TitleEffect *self)
{
    self->vtable = data_ov090_0221ccc8;
    if (self->primary != 0)
        self->primary->vtable->destroyAndFree(self->primary);
    if (self->secondary != 0)
        self->secondary->vtable->destroyAndFree(self->secondary);
    Heap_Free(self);
    return self;
}
