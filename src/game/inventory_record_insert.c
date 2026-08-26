/*
 * Inventory record construction and insertion wrappers used by resident
 * phase-script opcodes.
 */
#include "tingle/types.h"

extern void *ActorEffectDescriptor_Init(void *descriptor, u16 type, s32 enabled);
extern void *InventoryRecordCollection_MergeOrInsert(void *collection,
                                                     void *incoming);
extern u8 data_021e9ad0[];
extern void *ActorDatabase_FindDescriptorById(void *database, u16 id);
extern s32 func_02062b28(void *record);
extern s32 func_02062b74(void *record, u16 key);
extern void func_02064e7c(void *collection, s32 index, u16 value);
extern void func_02062874(void *record, s32 value);
extern void func_02062864(void *record, s32 value);

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

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

/*
 * Find the first eligible record associated with key and apply its update.
 * Metadata classes zero and three use the primary +0x08 table and pass value
 * to func_02064e7c. Other classes use the secondary +0x38 table and clear the
 * matched record through the class-specific helper. Both record arrays remain
 * collection-owned; a missing eligible record leaves the collection unchanged.
 */
void func_02063724(void *collection, u16 key, u16 value)
{
    u8 *metadata = ActorDatabase_FindDescriptorById(data_021e9ad0, key);
    u8 metadataClass = metadata[2];
    s32 index;

    if (metadataClass == 0 || metadataClass == 3) {
        for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
            u8 *record = FIELD(u8 *, collection, 0x08) + index * 0x24;

            if (func_02062b28(record) == 0 && func_02062b74(record, key) != 0) {
                func_02064e7c(collection, index, value);
                return;
            }
        }
        return;
    }

    for (index = 0; index < FIELD(s32, collection, 0x40); ++index) {
        u8 *record = FIELD(u8 *, collection, 0x38) + index * 0x24;

        if (func_02062b28(record) == 0 && func_02062b74(record, key) != 0) {
            if (metadataClass == 1)
                func_02062874(record, 0);
            else
                func_02062864(record, 0);
            return;
        }
    }
}

#undef FIELD
