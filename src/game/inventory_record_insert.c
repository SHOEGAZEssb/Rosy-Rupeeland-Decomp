/*
 * Inventory record construction and insertion wrappers used by resident
 * phase-script opcodes.
 */
#include "tingle/types.h"

extern void *ActorEffectDescriptor_Init(void *descriptor, u16 type, s32 enabled);
extern void *InventoryRecordCollection_MergeOrInsert(void *collection,
                                                     void *incoming);

/* Build a temporary retail descriptor from an item ID and quantity, then
 * merge or insert it into the borrowed collection. The collection retains any
 * copied state; the temporary descriptor itself remains stack-owned. */
void *func_02064af4(void *collection, u16 id, s32 quantity)
{
    u8 descriptor[0x24];

    ActorEffectDescriptor_Init(descriptor, id, quantity);
    return InventoryRecordCollection_MergeOrInsert(collection, descriptor);
}

/* Insert or merge an item by ID and return a normalized success result. The
 * collection owns the resulting record and is unchanged when insertion is
 * rejected. */
s32 func_0206370c(void *collection, u16 id, s32 quantity)
{
    return func_02064af4(collection, id, quantity) != 0;
}
