#include "tingle/types.h"

/* Overlay 22 fixed-capacity indexed-entry collection and its element lifetime hooks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020d7a48[];
extern const u8 data_ov022_02200674[];
extern const u8 data_ov022_022006bc[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_AllocAlternateEntry(u32, const void *, u32, void *);
extern void func_02093a34(void *);
extern void IndexedSelectionController_ConfigureRange(void *, s32, s32, s32);
extern void func_020c09cc(void *, s32, s32, s32, void (*)(void *), void *);
extern void func_020c0c24(void *, s32, s32, void (*)(void *));
#ifdef __cplusplus
}
#endif

extern "C" void func_ov022_021fd6fc(void *entry);
extern "C" void func_ov022_021fd800(void *entry);

/*
 * Initializes one 8-byte collection entry by clearing its first word. The second
 * word is left for the collection append path. The entry is
 * modified in place; there is no return value, allocation, SDK call, or MMIO.
 */
extern "C" void func_ov022_021fd6fc(void *entry)
{
    FIELD(void *, entry, 0) = 0;
}

/*
 * Constructs a fixed-capacity entry collection in caller-provided storage.
 * It initializes the SDK base, installs vtable 0x02200674, stores capacity at
 * +0x3C and count zero at +0x40, allocates capacity*8+8 bytes when nonempty,
 * constructs each 8-byte element with 0x021FD6FC, and configures the inherited
 * range as 0..capacity-1. Field +0x2C is set to 12. Heap/base state changes and
 * the input pointer is returned.
 */
extern "C" void *func_ov022_021fd708(void *collection, s32 capacity)
{
    func_02093a34(collection);
    FIELD(const void *, collection, 0) = data_ov022_02200674;
    FIELD(s32, collection, 0x3c) = capacity;
    FIELD(s32, collection, 0x40) = 0;
    if (capacity != 0) {
        void *entries = Heap_AllocAlternateEntry(capacity * 8 + 8,
                                      data_ov022_022006bc, 4, gHeapContext);
        if (entries != 0)
            func_020c09cc(entries, capacity, 8, 8,
                          func_ov022_021fd6fc, 0);
        FIELD(void *, collection, 0x38) = entries;
        IndexedSelectionController_ConfigureRange(collection, 0, capacity - 1, 0);
    } else {
        FIELD(void *, collection, 0x38) = 0;
    }
    FIELD(s32, collection, 0x2c) = 12;
    return collection;
}

/*
 * Runs the collection's non-freeing destructor. It restores vtable 0x02200674
 * and, when the entry allocation exists, invokes the array destructor with
 * 8-byte element/header sizes and the no-op 0x021FD800 element destructor.
 * The collection's own storage is retained and returned.
 */
extern "C" void *func_ov022_021fd7c4(void *collection)
{
    FIELD(const void *, collection, 0) = data_ov022_02200674;
    if (FIELD(void *, collection, 0x38) != 0)
        func_020c0c24(FIELD(void *, collection, 0x38),
                      8, 8, func_ov022_021fd800);
    return collection;
}

/*
 * Empty destructor hook for one collection entry. The input is intentionally
 * untouched and there are no observable effects or return value.
 */
extern "C" void func_ov022_021fd800(void *entry)
{
    (void)entry;
}

/*
 * Runs the owning collection destructor. It restores the collection vtable,
 * destroys the entry array when present, frees the collection allocation, and
 * returns the now-invalid pointer for ABI parity.
 */
extern "C" void *func_ov022_021fd804(void *collection)
{
    FIELD(const void *, collection, 0) = data_ov022_02200674;
    if (FIELD(void *, collection, 0x38) != 0)
        func_020c0c24(FIELD(void *, collection, 0x38),
                      8, 8, func_ov022_021fd800);
    Heap_Free(collection);
    return collection;
}

/*
 * Appends an indexed record while capacity remains. Each 8-byte entry receives
 * a pointer to the 0x24-byte global descriptor selected by the input index and
 * the index itself; count +0x40 is incremented. Null/unallocated or full
 * collections are unchanged. No value is returned and no SDK/MMIO call occurs.
 */
extern "C" void func_ov022_021fd848(void *collection, s32 index)
{
    void *entries = FIELD(void *, collection, 0x38);
    s32 count = FIELD(s32, collection, 0x40);
    if (entries == 0 || count >= FIELD(s32, collection, 0x3c))
        return;
    void *entry = (u8 *)entries + count * 8;
    FIELD(const void *, entry, 0) = data_020d7a48 + index * 0x24;
    FIELD(s32, entry, 4) = index;
    FIELD(s32, collection, 0x40) = count + 1;
}
