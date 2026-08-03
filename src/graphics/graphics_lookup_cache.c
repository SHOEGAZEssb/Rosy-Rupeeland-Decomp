#include "tingle/graphics_lookup_cache.h"

/*
 * Thirty-two-entry graphics lookup cache. Each descriptor has a stable index
 * and can be bound to an external 32-byte record. Lookup compares four signed
 * components at eight-byte spacing. The surrounding consumer owns list
 * partitioning, so unconfirmed endpoint roles retain offset-based names.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void (*constructor)(void *),
                              void (*destructor)(void *));

#ifdef __cplusplus
}
#endif

/*
 * Clear both list links, the offset-0x08 field, and record pointer in entry.
 * The descriptor changes in place; there is no return value or hardware I/O.
 */
void func_0207298c(GraphicsLookupCacheEntry *entry)
{
    entry->field_08 = 0;
    entry->next = 0;
    entry->prev = 0;
    entry->record = 0;
}

/*
 * No-op descriptor destructor used by the Metrowerks array runtime. It changes
 * no state, returns no value, and has no SDK or graphics-hardware effects.
 */
void func_020729a4(GraphicsLookupCacheEntry *entry)
{
    (void)entry;
}

/*
 * Construct 32 descriptors, assign stable indices 0..31, initialize searchHead
 * to the descriptor array, clear the other list state, and link entries through
 * next. Returns cache and performs no graphics-hardware operation.
 */
GraphicsLookupCache *func_020729a8(GraphicsLookupCache *cache)
{
    s32 i;

    __construct_array(
        cache->entries, GRAPHICS_LOOKUP_CACHE_CAPACITY,
        sizeof(GraphicsLookupCacheEntry),
        (void (*)(void *))func_0207298c,
        (void (*)(void *))func_020729a4);

    cache->field_284 = 0;
    cache->field_280 = 0;
    cache->searchHead = cache->entries;
    cache->searchEnd = 0;
    cache->field_290 = 0;

    for (i = 0; i < GRAPHICS_LOOKUP_CACHE_CAPACITY; i++) {
        cache->entries[i].index = i;
    }
    for (i = 0; i < GRAPHICS_LOOKUP_CACHE_CAPACITY - 1; i++) {
        cache->entries[i].next = &cache->entries[i + 1];
    }
    return cache;
}

/*
 * Bind each descriptor's record pointer to records + index*32 + 6. This mutates
 * all 32 descriptors, returns no value, and does not copy or own record storage.
 * The caller must keep that external storage alive while cache entries use it.
 */
void func_02072a38(GraphicsLookupCache *cache, void *records)
{
    s32 i;

    for (i = 0; i < GRAPHICS_LOOKUP_CACHE_CAPACITY; i++) {
        cache->entries[i].record =
            (s16 *)((u8 *)records + i * 0x20 + 6);
    }
}

/*
 * Search from searchHead up to, but excluding, searchEnd for a record whose
 * signed halfwords at offsets 0, 8, 16, and 24 equal key[0..3]. Returns the
 * first matching descriptor or null. No cache state or hardware is changed.
 */
GraphicsLookupCacheEntry *func_02072a64(GraphicsLookupCache *cache,
                                        const s16 key[4])
{
    GraphicsLookupCacheEntry *entry = cache->searchHead;

    while (entry != 0) {
        s16 *record;

        if (entry == cache->searchEnd) {
            return 0;
        }
        record = entry->record;
        if (key[0] == record[0] && key[1] == record[4] &&
            key[2] == record[8] && key[3] == record[12]) {
            break;
        }
        entry = entry->next;
    }
    return entry;
}

/*
 * Remove and return the descriptor currently at searchEnd, advancing searchEnd
 * through next. Returns null when that boundary pointer is null. Other links
 * and fields remain untouched; the operation has no hardware effects.
 */
GraphicsLookupCacheEntry *func_02072acc(GraphicsLookupCache *cache)
{
    GraphicsLookupCacheEntry *entry = cache->searchEnd;
    GraphicsLookupCacheEntry *result = 0;

    if (entry != 0) {
        result = entry;
        cache->searchEnd = entry->next;
    }
    return result;
}
