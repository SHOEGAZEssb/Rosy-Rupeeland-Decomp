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
