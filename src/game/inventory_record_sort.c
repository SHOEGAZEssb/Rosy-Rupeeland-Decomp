/*
 * Inventory record copying, sort-key generation, and in-place ordering. The
 * 0x24-byte records reference retail item metadata but retain two embedded
 * eight-byte presentation values when assigned through the narrow operator.
 */
#include "tingle/types.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct InventoryRecordCollection {
    u8 reserved00[4];
    u8 *records04;
    u8 reserved08[4];
    s32 count0c;
} InventoryRecordCollection;

extern s32 ActorDescriptor_IsInvalid(void *record);
extern s32 ActorDescriptor_IsInactiveKind1Subtype1(void *record);
extern void ActorDescriptor_SetRangeEnd(void *record, u16 count);
extern void ActorDescriptor_Init(void *record, u16 id, u16 subtype, u16 count);
extern void *ActorDatabase_FindDescriptorById(void *database, u16 id);
s32 InventoryRecordCollection_FindId(void *collection, u16 id);
void InventoryRecordCollection_Swap(void *collection, s32 first, s32 second);
extern void OS_Halt(void);
extern u8 data_021e9ad0[];
extern u8 data_021e9ac0[];
extern void **data_021f5128;

#ifndef MATCHING
extern void ActorDescriptor_ClearRuntime(void *record);
#endif

/* Return the borrowed metadata pointer stored by an inventory record. */
void *InventoryRecord_GetMetadata(void *record)
{
    return FIELD(void *, record, 8);
}

/* Return the active-entry count for channel zero/one, or their sum for two. */
s32 RecordSelection_GetChannelCount(void *record, s32 channel)
{
    if (channel == 2)
        return FIELD(s32, record, 8) + FIELD(s32, record, 0xc);
    return FIELD(s32, record, 8 + channel * 4);
}

/* Find an eligible matching ID in the collection's secondary record table. */
s32 InventoryRecordCollection_FindEligibleId(void *collection_pointer, u16 id)
{
    InventoryRecordCollection *collection =
        (InventoryRecordCollection *)collection_pointer;
    s32 index;

    for (index = 0; index < collection->count0c; ++index) {
        u8 *record = collection->records04 + index * 0x24;
        u8 *metadata;

        if (ActorDescriptor_IsInvalid(record) != 0 || FIELD(u16, record, 0) != id)
            continue;
        metadata = (u8 *)InventoryRecord_GetMetadata(record);
        if ((metadata[2] == 1 && FIELD(u16, record, 4) != 0) ||
            (metadata[2] != 1 && FIELD(u16, record, 4) != 0))
            return index;
    }
    return -1;
}

/* Return whether either inventory collection contains the requested ID. */
s32 InventoryManager_ContainsId(void *collection, u32 id)
{
    u16 narrowed = (u16)id;

    if (InventoryRecordCollection_FindId(collection, narrowed) >= 0)
        return 1;
    return InventoryRecordCollection_FindEligibleId((u8 *)collection + 0x34, narrowed) >= 0;
}

/* Test whether one of a record's selected channels contains an available
 * inventory entry or a nonzero embedded status nibble. */
s32 RecordSelection_HasAvailableEntry(void *record, s32 channel)
{
    s32 index;

    if (channel == 0)
        return RecordSelection_GetChannelCount(record, 0) > 0;
    if (channel != 1 || RecordSelection_GetChannelCount(record, 1) <= 0)
        return 0;
    for (index = 0; index < RecordSelection_GetChannelCount(record, 1); ++index) {
        u8 *entry = FIELD(u8 *, record, 0x1c) + index * 0x10;
        u8 *metadata = FIELD(u8 *, entry, 4);

        if ((FIELD(u32, metadata, 0xc) & 0xf00) != 0 ||
            InventoryManager_ContainsId(FIELD(void *, data_021e9ac0, 0),
                          FIELD(u32, metadata, 0x10)) != 0)
            return 1;
    }
    return 0;
}

/* Return one when a valid inventory record carries the requested ID. */
s32 InventoryRecord_HasId(void *record, u16 id)
{
    if (ActorDescriptor_IsInvalid(record) != 0)
        return 0;
    return FIELD(u16, record, 0) == id;
}

/*
 * Return whether a record's metadata class permits quantities to merge.
 * Types one and two are unique; type zero merges, while type three follows
 * the nonzero byte-three flag in its borrowed detail record.
 */
s32 InventoryRecord_CanMergeQuantity(void *record)
{
    u8 *metadata = FIELD(u8 *, record, 8);

    switch (metadata[2]) {
    case 0:
        return 1;
    case 1:
    case 2:
        return 0;
    case 3:
        return (*(u8 **)(metadata + 8))[3] != 0;
    default:
        OS_Halt();
        return 0;
    }
}

/*
 * Copy an incoming record into an empty collection slot. Type-one records
 * retain their subtype; other classes resolve metadata by ID and copy only
 * the clamped quantity fields used by retail inventory storage.
 */
void InventoryRecord_CopyForInsertion(void *destination, const void *source)
{
    u8 *metadata = FIELD(u8 *, source, 8);
    u16 id = FIELD(u16, source, 0);

    if (metadata[2] == 1) {
        ActorDescriptor_Init(destination, id, FIELD(u16, source, 6),
                      FIELD(u16, source, 4));
        return;
    }
    FIELD(u16, destination, 0) = id;
    FIELD(void *, destination, 8) = ActorDatabase_FindDescriptorById(data_021e9ad0, id);
    ActorDescriptor_SetRangeEnd(destination, FIELD(u16, source, 4));
}

/* Find the first valid record with the requested ID, or return minus one. */
s32 InventoryRecordCollection_FindId(void *collection, u16 id)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        u8 *record = records + index * 0x24;

        if (InventoryRecord_HasId(record, id) != 0)
            return index;
    }
    return -1;
}

#ifndef MATCHING
/* Find a valid descriptor with the requested ID in the alternate collection
 * layout at retail 0x0206514C. Records and metadata remain collection-owned;
 * the function returns the zero-based slot or minus one without side effects. */
s32 InventoryRecordCollection_FindIdAlternate(void *collection, u16 id)
{
    u8 *records = FIELD(u8 *, collection, 4);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x0c); ++index) {
        u8 *record = records + index * 0x24;

        if (ActorDescriptor_IsInvalid(record) == 0 && FIELD(u16, record, 0) == id)
            return index;
    }
    return -1;
}
#endif

/* Find the first invalid/free record slot, or return minus one. */
s32 InventoryRecordCollection_FindFreeSlot(void *collection)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        if (ActorDescriptor_IsInvalid(records + index * 0x24) != 0)
            return index;
    }
    return -1;
}

/* Move the first free slot to index zero by adjacent record swaps. */
void InventoryRecordCollection_MoveFreeSlotToFront(void *collection)
{
    s32 index = InventoryRecordCollection_FindFreeSlot(collection);

    if (index == -1) {
        OS_Halt();
        return;
    }
    while (index > 0) {
        InventoryRecordCollection_Swap(collection, index, index - 1);
        --index;
    }
}

/* Add a signed quantity delta and apply the retail 99-unit clamp. */
void InventoryRecord_AddQuantity(void *record, s32 delta)
{
    ActorDescriptor_SetRangeEnd(record, (u16)(FIELD(u16, record, 4) + delta));
}

#ifndef MATCHING
/* Clear every currently valid descriptor in a fixed collection, then reset
 * its active count. The collection retains its allocation and capacity. */
void InventoryRecordCollection_Clear(void *collection)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        u8 *record = records + index * 0x24;

        if (ActorDescriptor_IsInvalid(record) == 0)
            ActorDescriptor_ClearRuntime(record);
    }
    FIELD(s32, collection, 0x14) = 0;
}

/* Remove quantity from one collection slot. A zero amount or an exact match
 * clears the descriptor and decrements the active count; smaller amounts are
 * subtracted with retail's 16-bit wrap and clamp behavior. */
void InventoryRecordCollection_RemoveQuantity(void *collection, s32 index, u16 amount)
{
    u8 *record;

    if (FIELD(s32, collection, 0x14) == 0)
        return;
    record = FIELD(u8 *, collection, 8) + index * 0x24;
    if (amount != 0 && amount != FIELD(u16, record, 4)) {
        ActorDescriptor_SetRangeEnd(record, (u16)(FIELD(u16, record, 4) - amount));
        return;
    }
    ActorDescriptor_ClearRuntime(record);
    --FIELD(s32, collection, 0x14);
}
#endif

/*
 * Return whether the collection can accept incoming. Mergeable records fit
 * when their ID already exists or the collection has a free counted slot;
 * unique records additionally require quantity one and no existing ID.
 */
s32 InventoryRecordCollection_CanAccept(void *collection, void *incoming)
{
    u8 *metadata = (u8 *)InventoryRecord_GetMetadata(incoming);
    s32 index;

    if (metadata[2] != 0)
        (void)InventoryRecord_GetMetadata(incoming);
    index = InventoryRecordCollection_FindId(collection, FIELD(u16, metadata, 0));
    if (InventoryRecord_CanMergeQuantity(incoming) != 0) {
        return index >= 0 ||
               FIELD(s32, collection, 0x14) <
                   FIELD(s32, collection, 0x10);
    }
    return FIELD(u16, incoming, 4) == 1 && index < 0 &&
           FIELD(s32, collection, 0x14) < FIELD(s32, collection, 0x10);
}

/*
 * Merge or insert one inventory record and return the affected slot. New
 * records are inserted into the free slot moved to index zero; retail returns
 * the sentinel record immediately before the array for that insertion path.
 * The collection owns its record array and borrowed metadata references.
 */
void *InventoryRecordCollection_MergeOrInsert(void *collection, void *incoming)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index = -1;

    if (InventoryRecordCollection_CanAccept(collection, incoming) == 0)
        return 0;
    if (InventoryRecord_CanMergeQuantity(incoming) != 0) {
        u8 *metadata = FIELD(u8 *, incoming, 8);

        index = InventoryRecordCollection_FindId(collection, FIELD(u16, metadata, 0));
        if (index >= 0) {
            u8 *record = records + index * 0x24;

            InventoryRecord_AddQuantity(record, FIELD(s16, incoming, 4));
            return record;
        }
    }

    InventoryRecordCollection_MoveFreeSlotToFront(collection);
    InventoryRecord_CopyForInsertion(records, incoming);
    ++FIELD(s32, collection, 0x14);
    return records + index * 0x24;
}

/* Return flag bit one from a valid record's +0x02 status halfword. Invalid
 * records return zero. The record is borrowed and this query has no effects. */
s32 InventoryRecord_HasStatusBit1(void *record)
{
    if (ActorDescriptor_IsInvalid(record) != 0)
        return 0;
    return FIELD(u16, record, 2) & 2;
}

/* Return whether a valid type-one record denotes its empty subtype. */
s32 InventoryRecord_IsEmptyKind1Subtype1(void *record)
{
    u8 *metadata;

    if (ActorDescriptor_IsInvalid(record) != 0)
        return 0;
    metadata = FIELD(u8 *, record, 8);
    return metadata[2] == 1 && FIELD(u16, record, 6) == 1 &&
           FIELD(u16, record, 4) == 0;
}

/*
 * Generate the retail 16-bit inventory ordering key. Invalid records sort at
 * 0xFFFF; metadata kinds select their nested halfword and category prefix.
 */
u32 InventoryRecord_GetSortKey(void *record, s32 mode)
{
    u8 *metadata;
    u8 *details;
    u32 key = 0;

    if (ActorDescriptor_IsInvalid(record) != 0)
        return 0xffff;
    metadata = FIELD(u8 *, record, 8);
    details = FIELD(u8 *, metadata, 8);
    switch (metadata[2]) {
    case 0:
        key = (u32)FIELD(u16, details, 2) << 1;
        if (mode == 1)
            key |= 0x4000;
        break;
    case 1:
        if (InventoryRecord_IsEmptyKind1Subtype1(record) != 0)
            return 0x27d0;
        key = ((u32)FIELD(u16, details, 2) << 1) | 0x2000;
        break;
    case 2:
        key = ((u32)FIELD(u16, details, 6) << 1) | 0x1000;
        break;
    case 3:
        key = (u32)FIELD(u16, details, 4) << 1;
        if (mode != 1)
            key |= 0x4000;
        break;
    default:
        break;
    }
    return (u16)key;
}

/*
 * Assign the persistent identity/count fields from source to destination.
 * The embedded eight-byte values at +0x10 and +0x18 remain destination-owned.
 */
void *InventoryRecord_AssignPersistentFields(void *destination, const void *source)
{
    FIELD(void *, destination, 8) = FIELD(void *, source, 8);
    FIELD(u16, destination, 2) = FIELD(u16, source, 2);
    FIELD(u16, destination, 4) = FIELD(u16, source, 4);
    FIELD(u16, destination, 6) = FIELD(u16, source, 6);
    FIELD(u32, destination, 0x20) = FIELD(u32, source, 0x20);
    FIELD(u16, destination, 0) = FIELD(u16, source, 0);
    FIELD(u32, destination, 0x0c) = FIELD(u32, source, 0x0c);
    return destination;
}

/* Apply the narrow inventory-record assignment unless source is destination. */
void *InventoryRecord_Assign(void *destination, const void *source)
{
    if (destination != source)
        InventoryRecord_AssignPersistentFields(destination, source);
    return destination;
}

/* Copy all 0x24 bytes of one inventory record into caller-owned storage. */
void *InventoryRecord_Copy(void *destination, const void *source)
{
    u32 offset;

    for (offset = 0; offset < 0x24; offset += 4)
        FIELD(u32, destination, offset) = FIELD(u32, source, offset);
    return destination;
}

/* Swap the assignable fields of two indexed records in the +0x08 table. */
void InventoryRecordCollection_Swap(void *collection, s32 first, s32 second)
{
    u8 temporary[0x24];
    u8 *records;

    if (first == second)
        return;
    records = FIELD(u8 *, collection, 8);
    InventoryRecord_Copy(temporary, records + first * 0x24);
    InventoryRecord_Assign(records + first * 0x24, records + second * 0x24);
    InventoryRecord_Assign(records + second * 0x24, temporary);
}

/*
 * Reorder the +0x08 record table whose count is at +0x10. Mode zero moves
 * invalid records behind valid entries. Modes one and two bubble-sort by the
 * retail key using key variants zero and one respectively. The operation is
 * synchronous and mutates only the caller-owned record table.
 */
void InventoryRecordCollection_Sort(void *collection, s32 mode)
{
    s32 count = FIELD(s32, collection, 0x10);
    u8 *records = FIELD(u8 *, collection, 8);
    s32 outer;

    if (count <= 1)
        return;
    if (mode == 0) {
        for (outer = 0; outer < count - 1; ++outer) {
            s32 inner;
            s32 swapped = 0;

            if (ActorDescriptor_IsInvalid(records + outer * 0x24) == 0)
                continue;
            for (inner = outer + 1; inner < count; ++inner) {
                if (ActorDescriptor_IsInvalid(records + inner * 0x24) == 0) {
                    InventoryRecordCollection_Swap(collection, outer, inner);
                    swapped = 1;
                    break;
                }
            }
            if (!swapped)
                return;
        }
    } else if (mode == 1 || mode == 2) {
        s32 key_mode = mode - 1;

        for (outer = 0; outer < count; ++outer) {
            s32 inner;

            for (inner = count - 1; inner > outer; --inner) {
                u32 current = InventoryRecord_GetSortKey(records + inner * 0x24,
                                             key_mode);
                u32 previous = InventoryRecord_GetSortKey(records + (inner - 1) * 0x24,
                                              key_mode);
                if (current < previous)
                    InventoryRecordCollection_Swap(collection, inner, inner - 1);
            }
        }
    }
}

/*
 * Rebind each valid primary inventory record's +0x0C selection descriptor to
 * the last entry in mode table +0x1C whose nested identifier occurs in that
 * record. The collection and mode table are borrowed; only record link fields
 * change, and no allocation or hardware access occurs.
 */
void InventoryRecordCollection_RebindPrimarySelectionDescriptors(void *collection, s32 mode)
{
    u8 *mode_record = (u8 *)data_021f5128[mode];
    u8 *records = FIELD(u8 *, collection, 8);
    s32 record_count = FIELD(s32, collection, 0x10);
    s32 entry_count = FIELD(s32, mode_record, 0xc);
    s32 record_index;

    for (record_index = 0; record_index < record_count; ++record_index) {
        u8 *record = records + record_index * 0x24;
        s32 entry_index;

        FIELD(void *, record, 0xc) = 0;
        if (ActorDescriptor_IsInvalid(record) != 0)
            continue;
        for (entry_index = 0; entry_index < entry_count; ++entry_index) {
            u8 *entry = FIELD(u8 *, mode_record, 0x1c) + entry_index * 0x10;
            u8 *entry_record = FIELD(u8 *, entry, 4);
            u16 identifier = FIELD(u16, entry_record, 0x10);

            if (InventoryRecord_HasId(record, identifier) != 0)
                FIELD(void *, record, 0xc) = entry;
        }
    }
}

/*
 * Return one when any borrowed record in the collection is an inactive
 * kind-one/subtype-one descriptor, otherwise zero. The collection is not
 * modified and its signed count is retail's scan bound.
 */
s32 InventoryRecordCollection_HasInactiveKind1Subtype1(InventoryRecordCollection *collection)
{
    s32 index;

    for (index = 0; index < collection->count0c; ++index) {
        if (ActorDescriptor_IsInactiveKind1Subtype1(collection->records04 + index * 0x24) != 0)
            return 1;
    }
    return 0;
}

/* Swap the assignable fields of two indexed collection records in place. */
void InventoryRecordCollection_SwapRecords(InventoryRecordCollection *collection,
                   s32 first, s32 second)
{
    u8 temporary[0x24];
    u8 *left;
    u8 *right;

    if (first == second)
        return;
    left = collection->records04 + first * 0x24;
    right = collection->records04 + second * 0x24;
    InventoryRecord_Copy(temporary, left);
    InventoryRecord_Assign(left, right);
    InventoryRecord_Assign(right, temporary);
}

/*
 * Reorder the collection in place. Mode zero moves invalid records behind
 * valid ones; mode one bubble-sorts all records by InventoryRecord_GetSortKey's key. Other
 * modes and collections with fewer than two records are unchanged.
 */
void InventoryRecordCollection_SortAlternate(InventoryRecordCollection *collection, s32 mode)
{
    s32 outer;

    if (collection->count0c <= 1)
        return;
    if (mode == 0) {
        for (outer = 0; outer < collection->count0c - 1; ++outer) {
            s32 inner;
            s32 swapped = 0;

            if (ActorDescriptor_IsInvalid(collection->records04 + outer * 0x24) == 0)
                continue;
            for (inner = outer + 1; inner < collection->count0c; ++inner) {
                if (ActorDescriptor_IsInvalid(
                        collection->records04 + inner * 0x24) == 0) {
                    InventoryRecordCollection_SwapRecords(collection, outer, inner);
                    swapped = 1;
                    break;
                }
            }
            if (!swapped)
                return;
        }
    } else if (mode == 1) {
        for (outer = 0; outer < collection->count0c; ++outer) {
            s32 inner;

            for (inner = collection->count0c - 1; inner > outer; --inner) {
                u32 current = InventoryRecord_GetSortKey(
                    collection->records04 + inner * 0x24, 0);
                u32 previous = InventoryRecord_GetSortKey(
                    collection->records04 + (inner - 1) * 0x24, 0);
                if (current < previous)
                    InventoryRecordCollection_SwapRecords(collection, inner, inner - 1);
            }
        }
    }
}

/*
 * Rebind valid secondary collection records to the last compatible mode-table
 * entry. Inactive kind-one records are excluded; remaining records require the
 * same actor metadata subtype and a matching nested identifier. The borrowed
 * collection is updated in place without allocation or hardware access.
 */
void InventoryRecordCollection_RebindSecondarySelectionDescriptors(InventoryRecordCollection *collection, s32 mode)
{
    u8 *mode_record = (u8 *)data_021f5128[mode];
    s32 entry_count = FIELD(s32, mode_record, 0xc);
    s32 record_index;

    for (record_index = 0; record_index < collection->count0c; ++record_index) {
        u8 *record = collection->records04 + record_index * 0x24;
        u8 *metadata;
        s32 entry_index;

        FIELD(void *, record, 0xc) = 0;
        if (ActorDescriptor_IsInvalid(record) != 0)
            continue;
        metadata = (u8 *)InventoryRecord_GetMetadata(record);
        if (metadata[2] == 1 && FIELD(u16, record, 4) == 0)
            continue;
        for (entry_index = 0; entry_index < entry_count; ++entry_index) {
            u8 *entry = FIELD(u8 *, mode_record, 0x1c) + entry_index * 0x10;
            u8 *entry_record = FIELD(u8 *, entry, 4);
            u16 identifier = FIELD(u16, entry_record, 0x10);
            u8 *actor = (u8 *)ActorDatabase_FindDescriptorById(
                data_021e9ad0, identifier);

            if (actor[2] == metadata[2] &&
                InventoryRecord_HasId(record, identifier) != 0)
                FIELD(void *, record, 0xc) = entry;
        }
    }
}
