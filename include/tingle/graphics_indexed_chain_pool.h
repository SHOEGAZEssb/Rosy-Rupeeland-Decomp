#ifndef TINGLE_GRAPHICS_INDEXED_CHAIN_POOL_H
#define TINGLE_GRAPHICS_INDEXED_CHAIN_POOL_H

#include "tingle/types.h"

enum { GRAPHICS_INDEXED_CHAIN_CAPACITY = 16 };

enum {
    GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_PALETTE = 1,
    GRAPHICS_INDEXED_CHAIN_MODE_IMMEDIATE_RELEASE_OBJECT_PALETTE = 2,
    GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_EXTENDED_PALETTE = 3,
    GRAPHICS_INDEXED_CHAIN_MODE_IMMEDIATE_RELEASE_OBJECT_EXTENDED_PALETTE = 4
};

typedef struct GraphicsIndexedChainEntry GraphicsIndexedChainEntry;

/* One indexed descriptor; roots may own further descriptors through chainNext. */
struct GraphicsIndexedChainEntry {
    GraphicsIndexedChainEntry *previousOrFreePrevious;
    GraphicsIndexedChainEntry *nextOrFreeNext;
    GraphicsIndexedChainEntry *chainNext;
    void *resource;
    u8 referenceCount;
    u8 bindingMode;
    u8 descriptorIndex;
    u8 padding_13;
};

/* Fixed pool with an active root list and a descriptor free list. */
typedef struct GraphicsIndexedChainPool {
    GraphicsIndexedChainEntry entries[GRAPHICS_INDEXED_CHAIN_CAPACITY];
    GraphicsIndexedChainEntry *head;
    GraphicsIndexedChainEntry *tail;
    GraphicsIndexedChainEntry *freeHead;
    u32 allocatedEntryCount;
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
    GraphicsIndexedChainPool *pool, s32 requestedCount, u8 bindingMode);
void GraphicsIndexedChainPool_ReleaseChain(GraphicsIndexedChainPool *pool,
                                           GraphicsIndexedChainEntry *root);

#ifdef __cplusplus
}
#endif

#endif
