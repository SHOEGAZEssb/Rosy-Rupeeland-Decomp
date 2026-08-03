#ifndef TINGLE_GRAPHICS_RENDER_ENTRY_POOL_H
#define TINGLE_GRAPHICS_RENDER_ENTRY_POOL_H

#include "tingle/types.h"

enum { GRAPHICS_RENDER_ENTRY_CAPACITY = 128 };

typedef struct GraphicsRenderEntry GraphicsRenderEntry;

/* One active render entry or an additional entry chained from it. */
struct GraphicsRenderEntry {
    GraphicsRenderEntry *prev;
    GraphicsRenderEntry *next;
    GraphicsRenderEntry *chainNext;
    s32 sortKey;
    u32 field_10;
    u32 field_14;
};

/* Fixed pool whose active entries can be sorted before command emission. */
typedef struct GraphicsRenderEntryPool {
    GraphicsRenderEntry entries[GRAPHICS_RENDER_ENTRY_CAPACITY];
    GraphicsRenderEntry *head;
    GraphicsRenderEntry *tail;
    GraphicsRenderEntry *freeEntries;
    u32 allocatedCount;
} GraphicsRenderEntryPool;

typedef char GraphicsRenderEntrySizeCheck[
    sizeof(GraphicsRenderEntry) == 0x18 ? 1 : -1];
typedef char GraphicsRenderEntryPoolSizeCheck[
    sizeof(GraphicsRenderEntryPool) == 0xc10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void func_020723e0(GraphicsRenderEntry *entry);
void func_02072400(GraphicsRenderEntry *entry);
GraphicsRenderEntryPool *func_02072404(GraphicsRenderEntryPool *pool);
void func_02072444(GraphicsRenderEntryPool *pool);
GraphicsRenderEntry *func_0207248c(GraphicsRenderEntryPool *pool,
                                   s32 requestedCount);
void func_02072518(GraphicsRenderEntryPool *pool, GraphicsRenderEntry *entry);
void func_02072560(GraphicsRenderEntryPool *pool);
void func_02073304(GraphicsRenderEntryPool *pool, u32 delta);

#ifdef __cplusplus
}
#endif

#endif
