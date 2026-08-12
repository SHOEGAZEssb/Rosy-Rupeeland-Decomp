#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"
#include "tingle/vec_fx32_triple.h"

/* Array owner for overlay-90 participant paired-sprite presentations. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleParticipantPresentation TitleParticipantPresentation;

typedef struct TitleParticipantPresentationArray {
    const void *vtable;
    TitleParticipantPresentation **items;
    s16 count;
    u16 step;
    void *field_0c;
    fx32 parameter_10;
    s32 resource_value_14;
    VecFx32Triple path_18;
} TitleParticipantPresentationArray;

extern const u8 data_ov090_0221cc78[];
extern const char data_ov090_0221cc98[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern TitleParticipantPresentation *func_ov090_0221b9a0(
    TitleParticipantPresentation *self, void *owner0, void *owner1,
    const void *resources, s32 animation, const VecFx32Object *position);

/*
 * Initialize the path and array fields, allocate `count` presentation
 * pointers and their 0x18-byte objects, and construct each from the supplied
 * owners, resource record, shared position, and per-entry animation list.
 * Store the 0x8000/(count-1) fixed step used by the update routine.
 */
TitleParticipantPresentationArray *func_ov090_0221bc84(
    TitleParticipantPresentationArray *self, void *owner0, void *owner1,
    const void *resources, const VecFx32Object *position, void *field0c,
    volatile s16 count, const s16 *animations)
{
    s32 i;

    self->vtable = data_ov090_0221cc78;
    self->count = count;
    self->field_0c = field0c;
    self->parameter_10 = 0x1000;
    self->resource_value_14 = FIELD(s32, position, 0x0c);
    VecFx32Triple_Init(&self->path_18);
    self->items = (TitleParticipantPresentation **)func_02003e20(
        count * 4, data_ov090_0221cc98, 4, &gHeapContext);
    for (i = 0; i < self->count; i++) {
        TitleParticipantPresentation *item =
            (TitleParticipantPresentation *)Heap_Alloc(
                0x18, data_ov090_0221cc98, 4, &gHeapContext);
        if (item != 0)
            item = func_ov090_0221b9a0(item, owner0, owner1, resources,
                                      animations[i], position);
        self->items[i] = item;
    }
    self->step = func_020befec(0x8000, count - 1);
    return self;
}

/* Destroy every presentation, free the pointer array, and destroy the path. */
TitleParticipantPresentationArray *func_ov090_0221bd78(
    TitleParticipantPresentationArray *self)
{
    s32 i;
    self->vtable = data_ov090_0221cc78;
    for (i = 0; i < self->count; i++) {
        void *item = self->items[i];
        if (item != 0)
            (*(void *(*)(void *))(*(void ***)item)[1])(item);
    }
    func_02003e38(self->items);
    VecFx32Triple_Destroy(&self->path_18);
    return self;
}

/* Destroy the array contents, free `self`, and return its original pointer. */
TitleParticipantPresentationArray *func_ov090_0221bdd8(
    TitleParticipantPresentationArray *self)
{
    s32 i;
    self->vtable = data_ov090_0221cc78;
    for (i = 0; i < self->count; i++) {
        void *item = self->items[i];
        if (item != 0)
            (*(void *(*)(void *))(*(void ***)item)[1])(item);
    }
    func_02003e38(self->items);
    VecFx32Triple_Destroy(&self->path_18);
    Heap_Free(self);
    return self;
}
