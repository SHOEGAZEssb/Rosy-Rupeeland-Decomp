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

extern s32 func_02062b28(void *record);
extern s32 func_02062c68(void *record);
extern void func_02062864(void *record, u16 count);
extern void func_020627d0(void *record, u16 id, u16 subtype, u16 count);
extern void *func_02063b90(void *database, u16 id);
void func_02064b1c(void *collection, s32 first, s32 second);
extern void OS_Halt(void);
extern u8 data_021e9ad0[];

#ifndef MATCHING
extern void func_02062808(void *record);
#endif

/* Return the borrowed metadata pointer stored by an inventory record. */
void *func_02062e00(void *record)
{
    return FIELD(void *, record, 8);
}

/* Return one when a valid inventory record carries the requested ID. */
s32 func_02062b74(void *record, u16 id)
{
    if (func_02062b28(record) != 0)
        return 0;
    return FIELD(u16, record, 0) == id;
}

/*
 * Return whether a record's metadata class permits quantities to merge.
 * Types one and two are unique; type zero merges, while type three follows
 * the nonzero byte-three flag in its borrowed detail record.
 */
s32 func_02062ba4(void *record)
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
void func_02062744(void *destination, const void *source)
{
    u8 *metadata = FIELD(u8 *, source, 8);
    u16 id = FIELD(u16, source, 0);

    if (metadata[2] == 1) {
        func_020627d0(destination, id, FIELD(u16, source, 6),
                      FIELD(u16, source, 4));
        return;
    }
    FIELD(u16, destination, 0) = id;
    FIELD(void *, destination, 8) = func_02063b90(data_021e9ad0, id);
    func_02062864(destination, FIELD(u16, source, 4));
}

/* Find the first valid record with the requested ID, or return minus one. */
s32 func_0206492c(void *collection, u16 id)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        u8 *record = records + index * 0x24;

        if (func_02062b74(record, id) != 0)
            return index;
    }
    return -1;
}

#ifndef MATCHING
/* Find a valid descriptor with the requested ID in the alternate collection
 * layout at retail 0x0206514C. Records and metadata remain collection-owned;
 * the function returns the zero-based slot or minus one without side effects. */
s32 func_0206514c(void *collection, u16 id)
{
    u8 *records = FIELD(u8 *, collection, 4);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x0c); ++index) {
        u8 *record = records + index * 0x24;

        if (func_02062b28(record) == 0 && FIELD(u16, record, 0) == id)
            return index;
    }
    return -1;
}
#endif

/* Find the first invalid/free record slot, or return minus one. */
s32 func_02064990(void *collection)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        if (func_02062b28(records + index * 0x24) != 0)
            return index;
    }
    return -1;
}

/* Move the first free slot to index zero by adjacent record swaps. */
void func_020649d4(void *collection)
{
    s32 index = func_02064990(collection);

    if (index == -1) {
        OS_Halt();
        return;
    }
    while (index > 0) {
        func_02064b1c(collection, index, index - 1);
        --index;
    }
}

/* Add a signed quantity delta and apply the retail 99-unit clamp. */
void func_02064ad8(void *record, s32 delta)
{
    func_02062864(record, (u16)(FIELD(u16, record, 4) + delta));
}

#ifndef MATCHING
/* Clear every currently valid descriptor in a fixed collection, then reset
 * its active count. The collection retains its allocation and capacity. */
void func_02064e28(void *collection)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index;

    for (index = 0; index < FIELD(s32, collection, 0x10); ++index) {
        u8 *record = records + index * 0x24;

        if (func_02062b28(record) == 0)
            func_02062808(record);
    }
    FIELD(s32, collection, 0x14) = 0;
}

/* Remove quantity from one collection slot. A zero amount or an exact match
 * clears the descriptor and decrements the active count; smaller amounts are
 * subtracted with retail's 16-bit wrap and clamp behavior. */
void func_02064e7c(void *collection, s32 index, u16 amount)
{
    u8 *record;

    if (FIELD(s32, collection, 0x14) == 0)
        return;
    record = FIELD(u8 *, collection, 8) + index * 0x24;
    if (amount != 0 && amount != FIELD(u16, record, 4)) {
        func_02062864(record, (u16)(FIELD(u16, record, 4) - amount));
        return;
    }
    func_02062808(record);
    --FIELD(s32, collection, 0x14);
}
#endif

/*
 * Return whether the collection can accept incoming. Mergeable records fit
 * when their ID already exists or the collection has a free counted slot;
 * unique records additionally require quantity one and no existing ID.
 */
s32 func_02064884(void *collection, void *incoming)
{
    u8 *metadata = (u8 *)func_02062e00(incoming);
    s32 index;

    if (metadata[2] != 0)
        (void)func_02062e00(incoming);
    index = func_0206492c(collection, FIELD(u16, metadata, 0));
    if (func_02062ba4(incoming) != 0) {
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
void *func_02064a18(void *collection, void *incoming)
{
    u8 *records = FIELD(u8 *, collection, 8);
    s32 index = -1;

    if (func_02064884(collection, incoming) == 0)
        return 0;
    if (func_02062ba4(incoming) != 0) {
        u8 *metadata = FIELD(u8 *, incoming, 8);

        index = func_0206492c(collection, FIELD(u16, metadata, 0));
        if (index >= 0) {
            u8 *record = records + index * 0x24;

            func_02064ad8(record, FIELD(s16, incoming, 4));
            return record;
        }
    }

    func_020649d4(collection);
    func_02062744(records, incoming);
    ++FIELD(s32, collection, 0x14);
    return records + index * 0x24;
}

/* Return flag bit one from a valid record's +0x02 status halfword. Invalid
 * records return zero. The record is borrowed and this query has no effects. */
s32 func_02062c00(void *record)
{
    if (func_02062b28(record) != 0)
        return 0;
    return FIELD(u16, record, 2) & 2;
}

/* Return whether a valid type-one record denotes its empty subtype. */
s32 func_02062c20(void *record)
{
    u8 *metadata;

    if (func_02062b28(record) != 0)
        return 0;
    metadata = FIELD(u8 *, record, 8);
    return metadata[2] == 1 && FIELD(u16, record, 6) == 1 &&
           FIELD(u16, record, 4) == 0;
}

/*
 * Generate the retail 16-bit inventory ordering key. Invalid records sort at
 * 0xFFFF; metadata kinds select their nested halfword and category prefix.
 */
u32 func_02062f18(void *record, s32 mode)
{
    u8 *metadata;
    u8 *details;
    u32 key = 0;

    if (func_02062b28(record) != 0)
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
        if (func_02062c20(record) != 0)
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
void *func_02062828(void *destination, const void *source)
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
void *func_02062728(void *destination, const void *source)
{
    if (destination != source)
        func_02062828(destination, source);
    return destination;
}

/* Copy all 0x24 bytes of one inventory record into caller-owned storage. */
void *func_02064b7c(void *destination, const void *source)
{
    u32 offset;

    for (offset = 0; offset < 0x24; offset += 4)
        FIELD(u32, destination, offset) = FIELD(u32, source, offset);
    return destination;
}

/* Swap the assignable fields of two indexed records in the +0x08 table. */
void func_02064b1c(void *collection, s32 first, s32 second)
{
    u8 temporary[0x24];
    u8 *records;

    if (first == second)
        return;
    records = FIELD(u8 *, collection, 8);
    func_02064b7c(temporary, records + first * 0x24);
    func_02062728(records + first * 0x24, records + second * 0x24);
    func_02062728(records + second * 0x24, temporary);
}

/*
 * Reorder the +0x08 record table whose count is at +0x10. Mode zero moves
 * invalid records behind valid entries. Modes one and two bubble-sort by the
 * retail key using key variants zero and one respectively. The operation is
 * synchronous and mutates only the caller-owned record table.
 */
void func_02064be0(void *collection, s32 mode)
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

            if (func_02062b28(records + outer * 0x24) == 0)
                continue;
            for (inner = outer + 1; inner < count; ++inner) {
                if (func_02062b28(records + inner * 0x24) == 0) {
                    func_02064b1c(collection, outer, inner);
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
                u32 current = func_02062f18(records + inner * 0x24,
                                             key_mode);
                u32 previous = func_02062f18(records + (inner - 1) * 0x24,
                                              key_mode);
                if (current < previous)
                    func_02064b1c(collection, inner, inner - 1);
            }
        }
    }
}

/*
 * Return one when any borrowed record in the collection is an inactive
 * kind-one/subtype-one descriptor, otherwise zero. The collection is not
 * modified and its signed count is retail's scan bound.
 */
s32 func_02065468(InventoryRecordCollection *collection)
{
    s32 index;

    for (index = 0; index < collection->count0c; ++index) {
        if (func_02062c68(collection->records04 + index * 0x24) != 0)
            return 1;
    }
    return 0;
}

/* Swap the assignable fields of two indexed collection records in place. */
void func_020654ac(InventoryRecordCollection *collection,
                   s32 first, s32 second)
{
    u8 temporary[0x24];
    u8 *left;
    u8 *right;

    if (first == second)
        return;
    left = collection->records04 + first * 0x24;
    right = collection->records04 + second * 0x24;
    func_02064b7c(temporary, left);
    func_02062728(left, right);
    func_02062728(right, temporary);
}

/*
 * Reorder the collection in place. Mode zero moves invalid records behind
 * valid ones; mode one bubble-sorts all records by func_02062f18's key. Other
 * modes and collections with fewer than two records are unchanged.
 */
void func_0206550c(InventoryRecordCollection *collection, s32 mode)
{
    s32 outer;

    if (collection->count0c <= 1)
        return;
    if (mode == 0) {
        for (outer = 0; outer < collection->count0c - 1; ++outer) {
            s32 inner;
            s32 swapped = 0;

            if (func_02062b28(collection->records04 + outer * 0x24) == 0)
                continue;
            for (inner = outer + 1; inner < collection->count0c; ++inner) {
                if (func_02062b28(
                        collection->records04 + inner * 0x24) == 0) {
                    func_020654ac(collection, outer, inner);
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
                u32 current = func_02062f18(
                    collection->records04 + inner * 0x24, 0);
                u32 previous = func_02062f18(
                    collection->records04 + (inner - 1) * 0x24, 0);
                if (current < previous)
                    func_020654ac(collection, inner, inner - 1);
            }
        }
    }
}
