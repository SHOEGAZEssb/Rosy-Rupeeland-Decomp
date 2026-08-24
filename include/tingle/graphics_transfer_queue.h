#ifndef TINGLE_GRAPHICS_TRANSFER_QUEUE_H
#define TINGLE_GRAPHICS_TRANSFER_QUEUE_H

#include "tingle/types.h"

enum { GRAPHICS_TRANSFER_QUEUE_CAPACITY = 128 };

typedef enum GraphicsTransferKind {
    GRAPHICS_TRANSFER_KIND_OBJECT_CHARACTER = 1,
    GRAPHICS_TRANSFER_KIND_OBJECT_PALETTE = 2,
    GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE = 3
} GraphicsTransferKind;

typedef struct GraphicsTransferEntry GraphicsTransferEntry;

/* One queued graphics transfer request recovered from both upload producers. */
struct GraphicsTransferEntry {
    GraphicsTransferEntry *previousOrFreePrevious;
    GraphicsTransferEntry *nextOrFreeNext;
    const void *source;
    u32 transferKind;
    u32 destinationOffsetBytes;
    u32 sizeBytes;
};

/* Fixed-capacity FIFO with a separate descriptor free list. */
typedef struct GraphicsTransferQueue {
    GraphicsTransferEntry entries[GRAPHICS_TRANSFER_QUEUE_CAPACITY];
    GraphicsTransferEntry *head;
    GraphicsTransferEntry *tail;
    GraphicsTransferEntry *freeHead;
    u32 queuedCount;
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
                                   u32 transferKind,
                                   const void *source,
                                   u32 destinationOffsetBytes, u32 sizeBytes);
void GraphicsTransferQueue_Remove(GraphicsTransferQueue *queue,
                                  GraphicsTransferEntry *entry);
GraphicsTransferEntry *GraphicsTransferQueue_FindBySource(
    GraphicsTransferQueue *queue, const void *source);
void GraphicsTransferQueue_ExtendTailSize(GraphicsTransferQueue *queue,
                                          u32 additionalBytes);

#ifdef __cplusplus
}
#endif

#endif
