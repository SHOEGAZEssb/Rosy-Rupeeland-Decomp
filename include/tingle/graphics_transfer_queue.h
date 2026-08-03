#ifndef TINGLE_GRAPHICS_TRANSFER_QUEUE_H
#define TINGLE_GRAPHICS_TRANSFER_QUEUE_H

#include "tingle/types.h"

enum { GRAPHICS_TRANSFER_QUEUE_CAPACITY = 128 };

typedef struct GraphicsTransferEntry GraphicsTransferEntry;

/* One queued graphics transfer; payload meanings are not yet fully identified. */
struct GraphicsTransferEntry {
    GraphicsTransferEntry *prev;
    GraphicsTransferEntry *next;
    void *field_08;
    u32 field_0c;
    u32 field_10;
    u32 field_14;
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

GraphicsTransferEntry *func_0207260c(GraphicsTransferEntry *entry);
void func_02072620(GraphicsTransferEntry *entry);
void func_02072624(GraphicsTransferEntry *entry);
GraphicsTransferQueue *func_02072644(GraphicsTransferQueue *queue);
void func_02072684(GraphicsTransferQueue *queue);
void func_020726e4(GraphicsTransferQueue *queue, u32 field_0c,
                   void *field_08, u32 field_10, u32 field_14);
void func_02072748(GraphicsTransferQueue *queue,
                   GraphicsTransferEntry *entry);
GraphicsTransferEntry *func_0207279c(GraphicsTransferQueue *queue,
                                     const void *field_08);

#ifdef __cplusplus
}
#endif

#endif
