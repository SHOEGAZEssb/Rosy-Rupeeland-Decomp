#ifndef TINGLE_GRAPHICS_LOOKUP_CACHE_H
#define TINGLE_GRAPHICS_LOOKUP_CACHE_H

#include "tingle/types.h"

enum { GRAPHICS_LOOKUP_CACHE_CAPACITY = 32 };

typedef struct GraphicsLookupCacheEntry GraphicsLookupCacheEntry;

/* One indexed cache descriptor bound to an external 32-byte record. */
struct GraphicsLookupCacheEntry {
    GraphicsLookupCacheEntry *prev;
    GraphicsLookupCacheEntry *next;
    void *field_08;
    s16 *record;
    u32 index;
};

/* Fixed cache; the exact policies of the five list-state fields remain open. */
typedef struct GraphicsLookupCache {
    GraphicsLookupCacheEntry entries[GRAPHICS_LOOKUP_CACHE_CAPACITY];
    GraphicsLookupCacheEntry *field_280;
    GraphicsLookupCacheEntry *field_284;
    GraphicsLookupCacheEntry *searchHead;
    GraphicsLookupCacheEntry *searchEnd;
    GraphicsLookupCacheEntry *field_290;
} GraphicsLookupCache;

typedef char GraphicsLookupCacheEntrySizeCheck[
    sizeof(GraphicsLookupCacheEntry) == 0x14 ? 1 : -1];
typedef char GraphicsLookupCacheSizeCheck[
    sizeof(GraphicsLookupCache) == 0x294 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void func_0207298c(GraphicsLookupCacheEntry *entry);
void func_020729a4(GraphicsLookupCacheEntry *entry);
GraphicsLookupCache *func_020729a8(GraphicsLookupCache *cache);
void func_02072a38(GraphicsLookupCache *cache, void *records);
GraphicsLookupCacheEntry *func_02072a64(GraphicsLookupCache *cache,
                                        const s16 key[4]);
GraphicsLookupCacheEntry *func_02072acc(GraphicsLookupCache *cache);

#ifdef __cplusplus
}
#endif

#endif
