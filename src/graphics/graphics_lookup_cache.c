#include "tingle/graphics_lookup_cache.h"

/*
 * Thirty-two-entry affine matrix cache. Each descriptor has a stable OAM
 * affine index and binds to four parameters at eight-byte spacing in an OAM
 * shadow buffer. The surrounding consumer resets the populated-prefix cursor
 * once per frame; unreferenced pointer slots retain offset-based names.
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
void GraphicsAffineMatrixCacheEntry_Init(GraphicsAffineMatrixCacheEntry *entry)
{
    entry->field_08 = 0;
    entry->next = 0;
    entry->field_00 = 0;
    entry->affineParameters = 0;
}

/*
 * No-op descriptor destructor used by the Metrowerks array runtime. It changes
 * no state, returns no value, and has no SDK or graphics-hardware effects.
 */
void GraphicsAffineMatrixCacheEntry_Destroy(GraphicsAffineMatrixCacheEntry *entry)
{
    (void)entry;
}

/*
 * Construct 32 descriptors, assign stable OAM affine indices 0..31, initialize
 * searchBegin to the descriptor array, clear the allocation cursor and other
 * pointer state, and link entries through next. Returns cache and performs no
 * graphics-hardware operation.
 */
GraphicsAffineMatrixCache *GraphicsAffineMatrixCache_Init(
    GraphicsAffineMatrixCache *cache)
{
    s32 i;

    __construct_array(
        cache->entries, GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY,
        sizeof(GraphicsAffineMatrixCacheEntry),
        (void (*)(void *))GraphicsAffineMatrixCacheEntry_Init,
        (void (*)(void *))GraphicsAffineMatrixCacheEntry_Destroy);

    cache->field_284 = 0;
    cache->field_280 = 0;
    cache->searchBegin = cache->entries;
    cache->nextFree = 0;
    cache->field_290 = 0;

    for (i = 0; i < GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY; i++) {
        cache->entries[i].oamAffineIndex = i;
    }
    for (i = 0; i < GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY - 1; i++) {
        cache->entries[i].next = &cache->entries[i + 1];
    }
    return cache;
}

/*
 * Bind each descriptor to the first affine parameter of its four-record OAM
 * slot at oamBuffer + index*32 + 6. This mutates all 32 descriptors, returns no
 * value, and does not copy or own the OAM storage. The caller must keep that
 * buffer alive while cache entries use it.
 */
void GraphicsAffineMatrixCache_BindOamBuffer(GraphicsAffineMatrixCache *cache,
                                             void *oamBuffer)
{
    s32 i;

    for (i = 0; i < GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY; i++) {
        cache->entries[i].affineParameters =
            (s16 *)((u8 *)oamBuffer + i * 0x20 + 6);
    }
}

/*
 * Search the populated prefix from searchBegin up to, but excluding, nextFree
 * for affine parameters matching matrix[0..3]. Returns the first matching
 * descriptor or null. No cache state or hardware is changed.
 */
GraphicsAffineMatrixCacheEntry *GraphicsAffineMatrixCache_FindMatrix(
    GraphicsAffineMatrixCache *cache, const s16 matrix[4])
{
    GraphicsAffineMatrixCacheEntry *entry = cache->searchBegin;

    while (entry != 0) {
        s16 *record;

        if (entry == cache->nextFree) {
            return 0;
        }
        record = entry->affineParameters;
        if (matrix[0] == record[0] && matrix[1] == record[4] &&
            matrix[2] == record[8] && matrix[3] == record[12]) {
            break;
        }
        entry = entry->next;
    }
    return entry;
}

/*
 * Allocate and return the descriptor at nextFree, then advance the cursor.
 * Returns null when the fixed cache is exhausted. Other links and fields
 * remain untouched; the operation has no hardware effects.
 */
GraphicsAffineMatrixCacheEntry *GraphicsAffineMatrixCache_Allocate(
    GraphicsAffineMatrixCache *cache)
{
    GraphicsAffineMatrixCacheEntry *entry = cache->nextFree;
    GraphicsAffineMatrixCacheEntry *result = 0;

    if (entry != 0) {
        result = entry;
        cache->nextFree = entry->next;
    }
    return result;
}
