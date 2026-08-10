#ifndef TINGLE_GRAPHICS_INDEXED_CHAIN_POOL_H
#define TINGLE_GRAPHICS_INDEXED_CHAIN_POOL_H

#include "tingle/types.h"

enum { GRAPHICS_INDEXED_CHAIN_CAPACITY = 16 };

typedef struct GraphicsIndexedChainEntry GraphicsIndexedChainEntry;

/* One indexed descriptor; roots may own further descriptors through chainNext. */
struct GraphicsIndexedChainEntry {
    GraphicsIndexedChainEntry *prev;
    GraphicsIndexedChainEntry *next;
    GraphicsIndexedChainEntry *chainNext;
    void *field_0c;
    u8 field_10;
    u8 mode;
    u8 index;
    u8 padding_13;
};

/* Fixed pool with an active root list and a descriptor free list. */
typedef struct GraphicsIndexedChainPool {
    GraphicsIndexedChainEntry entries[GRAPHICS_INDEXED_CHAIN_CAPACITY];
    GraphicsIndexedChainEntry *head;
    GraphicsIndexedChainEntry *tail;
    GraphicsIndexedChainEntry *freeEntries;
    u32 allocatedCount;
} GraphicsIndexedChainPool;

typedef char GraphicsIndexedChainEntrySizeCheck[
    sizeof(GraphicsIndexedChainEntry) == 0x14 ? 1 : -1];
typedef char GraphicsIndexedChainPoolSizeCheck[
    sizeof(GraphicsIndexedChainPool) == 0x150 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsIndexedChainEntry_Init(GraphicsIndexedChainEntry *entry);
void GraphicsIndexedChainEntry_Destroy(GraphicsIndexedChainEntry *entry);
GraphicsIndexedChainPool *GraphicsIndexedChainPool_Init(
    GraphicsIndexedChainPool *pool);
GraphicsIndexedChainEntry *GraphicsIndexedChainPool_AllocateChain(
    GraphicsIndexedChainPool *pool, s32 requestedCount, u8 mode);
void GraphicsIndexedChainPool_ReleaseChain(GraphicsIndexedChainPool *pool,
                                           GraphicsIndexedChainEntry *root);

#ifdef __cplusplus
}
#endif

#endif
