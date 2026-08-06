#include "tingle/types.h"

/*
 * Create actors from descriptor lists and expose small actor-collection lookup,
 * broadcast, and flag helpers used around the factory dispatcher.
 */
typedef struct CollectionDescriptor {
    u16 kind_00;
    u8 field_02[0x26];
    u32 flags_28;
    u8 field_2c[0x24];
    s16 selector_50;
    u8 field_52[0x12];
} CollectionDescriptor;

typedef struct DescriptorActor {
    u8 field_00[0xe4];
    s16 descriptorValue_e4;
} DescriptorActor;

typedef struct DescriptorActorCollection {
    DescriptorActor *actors_0000[128];
    u8 field_0200[0xc00];
    void *field_0e00;
    u8 field_0e04[0x2070];
    s32 slotLimit_2e74;
    u32 flags_2e78;
    u8 field_2e7c[0x0c];
    s32 field_2e88;
} DescriptorActorCollection;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0202ecd0(DescriptorActorCollection *, CollectionDescriptor *);
extern void func_02033f18(DescriptorActor *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Walk 0x64-byte descriptors until kind zero. Set flag eight in each record
 * and construct records whose signed selector at 0x50 equals selector. Inputs
 * are the collection, first descriptor, and selector; returns no value.
 */
void func_02030a80(DescriptorActorCollection *self,
                   CollectionDescriptor *descriptor, s32 selector)
{
    while (descriptor->kind_00) {
        descriptor->flags_28 |= 8;
        if (descriptor->selector_50 == selector)
            func_0202ecd0(self, descriptor);
        descriptor++;
    }
}

/* Return collection field 0x0e00 without changing state. */
void *func_02030acc(DescriptorActorCollection *self)
{
    return self->field_0e00;
}

/*
 * Scan registered slots up to offset 0x2e74 and return the first actor whose
 * signed halfword at 0xe4 equals value. Null slots are ignored; return null if
 * no actor matches. No callbacks or hardware effects occur.
 */
DescriptorActor *func_02030ad4(DescriptorActorCollection *self, s32 value)
{
    s32 count = self->slotLimit_2e74;
    s32 i;

    for (i = 0; i < count; i++) {
        DescriptorActor *actor = self->actors_0000[i];
        if (actor && actor->descriptorValue_e4 == value)
            return actor;
    }
    return 0;
}

/*
 * Store value at collection offset 0x2e88 and pass it through func_02033f18 to
 * every nonnull actor slot. Returns no value; the helper may mutate actors.
 */
void func_02030b18(DescriptorActorCollection *self, s32 value)
{
    s32 i;

    self->field_2e88 = value;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        DescriptorActor *actor = self->actors_0000[i];
        if (actor)
            func_02033f18(actor, self->field_2e88);
    }
}

/*
 * Replace bit one of collection word 0x2e78 with the low bit of value. Return
 * the previous bit sign-expanded as zero or -1; no other bits are changed.
 */
s32 func_02030b58(DescriptorActorCollection *self, s32 value)
{
    u32 old = self->flags_2e78;
    self->flags_2e78 = (old & ~2) | ((value & 1) << 1);
    return (old & 2) ? -1 : 0;
}

/* Return bit one of collection word 0x2e78 sign-expanded as zero or -1. */
s32 func_02030b7c(DescriptorActorCollection *self)
{
    return (self->flags_2e78 & 2) ? -1 : 0;
}
