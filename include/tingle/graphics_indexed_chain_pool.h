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

void func_020727c4(GraphicsIndexedChainEntry *entry);
void func_020727e8(GraphicsIndexedChainEntry *entry);
GraphicsIndexedChainPool *func_020727ec(GraphicsIndexedChainPool *pool);
GraphicsIndexedChainEntry *func_0207287c(GraphicsIndexedChainPool *pool,
                                         s32 requestedCount, u8 mode);
void func_0207290c(GraphicsIndexedChainPool *pool,
                   GraphicsIndexedChainEntry *root);

#ifdef __cplusplus
}
#endif

#endif
