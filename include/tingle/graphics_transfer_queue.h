#ifndef TINGLE_GRAPHICS_TRANSFER_QUEUE_H
#define TINGLE_GRAPHICS_TRANSFER_QUEUE_H

#include "tingle/types.h"

enum { GRAPHICS_TRANSFER_QUEUE_CAPACITY = 128 };

typedef struct GraphicsTransferEntry GraphicsTransferEntry;

/* One queued graphics transfer request recovered from both upload producers. */
struct GraphicsTransferEntry {
    GraphicsTransferEntry *prev;
    GraphicsTransferEntry *next;
    void *source;
    u32 transferType;
    u32 destination;
    u32 size;
};

/* Fixed-capacity FIFO with a separate descriptor free list. */
typedef struct GraphicsTransferQueue {
    GraphicsTransferEntry entries[GRAPHICS_TRANSFER_QUEUE_CAPACITY];
    GraphicsTransferEntry *head;
    GraphicsTransferEntry *tail;
    GraphicsTransferEntry *freeEntries;
    u32 count;
} GraphicsTransferQueue;

typedef char GraphicsTransferEntrySizeCheck[
    sizeof(GraphicsTransferEntry) == 0x18 ? 1 : -1];
typedef char GraphicsTransferQueueSizeCheck[
    sizeof(GraphicsTransferQueue) == 0xc10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GraphicsTransferEntry *GraphicsTransferEntry_Init(
    GraphicsTransferEntry *entry);
void GraphicsTransferEntry_Destroy(GraphicsTransferEntry *entry);
void GraphicsTransferEntry_Clear(GraphicsTransferEntry *entry);
GraphicsTransferQueue *GraphicsTransferQueue_Init(
    GraphicsTransferQueue *queue);
void GraphicsTransferQueue_Reset(GraphicsTransferQueue *queue);
void GraphicsTransferQueue_Enqueue(GraphicsTransferQueue *queue,
                                   u32 transferType, void *source,
                                   u32 destination, u32 size);
void GraphicsTransferQueue_Remove(GraphicsTransferQueue *queue,
                                  GraphicsTransferEntry *entry);
GraphicsTransferEntry *GraphicsTransferQueue_FindBySource(
    GraphicsTransferQueue *queue, const void *source);

#ifdef __cplusplus
}
#endif

#endif
