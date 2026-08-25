#include "tingle/graphics_sprite_group.h"
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
    s16 runtimeId_e4;
} DescriptorActor;

typedef struct DescriptorActorCollection {
    DescriptorActor *actors_0000[128];
    u8 field_0200[0xc00];
    GraphicsSpriteGroup *spriteGroup_0e00;
    u8 field_0e04[0x2070];
    s32 slotLimit_2e74;
    u32 flags_2e78;
    u8 field_2e7c[0x0c];
    s32 actorScale_2e88;
} DescriptorActorCollection;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_SpawnActorFromDescriptor(
    DescriptorActorCollection *, CollectionDescriptor *);
extern void Actor_SetScale(DescriptorActor *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Walk 0x64-byte descriptors until kind zero. Set flag eight in each record
 * and construct records whose signed selector at 0x50 equals selector. Inputs
 * are the collection, first descriptor, and selector; returns no value.
 */
void ActorCollection_SpawnDescriptorsBySelector(
    DescriptorActorCollection *self, CollectionDescriptor *descriptor,
    s32 selector)
{
    while (descriptor->kind_00) {
        descriptor->flags_28 |= 8;
        if (descriptor->selector_50 == selector)
            ActorCollection_SpawnActorFromDescriptor(self, descriptor);
        descriptor++;
    }
}

/* Return the collection-owned sprite group without transferring ownership. */
GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(
    DescriptorActorCollection *collection)
{
    return collection->spriteGroup_0e00;
}

/*
 * Scan registered slots up to offset 0x2e74 and return the first actor whose
 * signed runtime identifier at +0xe4 equals runtimeId. Spawn copies this value
 * from descriptor halfword +0x52, while later actor code may replace it. Null
 * slots are ignored; the returned actor is borrowed, and null means no match.
 */
DescriptorActor *ActorCollection_FindActorByRuntimeId(
    DescriptorActorCollection *collection, s32 runtimeId)
{
    s32 slotLimit = collection->slotLimit_2e74;
    s32 i;

    for (i = 0; i < slotLimit; i++) {
        DescriptorActor *actor = collection->actors_0000[i];
        if (actor && actor->runtimeId_e4 == runtimeId)
            return actor;
    }
    return 0;
}

/*
 * Store the Q12 actor scale at collection offset 0x2e88 and apply it to every
 * nonnull actor slot. Returns no value and updates each actor's presentation
 * scale through Actor_SetScale.
 */
void ActorCollection_SetActorScale(DescriptorActorCollection *self, s32 scale)
{
    s32 i;

    self->actorScale_2e88 = scale;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        DescriptorActor *actor = self->actors_0000[i];
        if (actor)
            Actor_SetScale(actor, self->actorScale_2e88);
    }
}

/*
 * Replace bit one of collection word 0x2e78 with the low bit of value. Return
 * the previous bit sign-expanded as zero or -1; no other bits are changed.
 */
s32 ActorCollection_SetFlagBit1(DescriptorActorCollection *self, s32 value)
{
    u32 old = self->flags_2e78;
    self->flags_2e78 = (old & ~2) | ((value & 1) << 1);
    return (old & 2) ? -1 : 0;
}

/* Return bit one of collection word 0x2e78 sign-expanded as zero or -1. */
s32 ActorCollection_GetFlagBit1(DescriptorActorCollection *self)
{
    return (self->flags_2e78 & 2) ? -1 : 0;
}
