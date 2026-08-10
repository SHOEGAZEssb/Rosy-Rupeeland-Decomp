#ifndef TINGLE_GRAPHICS_VRAM_ALLOCATOR_H
#define TINGLE_GRAPHICS_VRAM_ALLOCATOR_H

#include "tingle/types.h"

enum {
    GRAPHICS_VRAM_RANGE_CAPACITY = 96,
    GRAPHICS_VRAM_BLOCK_COUNT = 0x400,
    GRAPHICS_VRAM_BLOCK_SIZE = 0x80
};

typedef struct GraphicsVramRangeNode GraphicsVramRangeNode;

/* One allocated or free interval in the allocator's address-ordered list. */
struct GraphicsVramRangeNode {
    GraphicsVramRangeNode *prev;
    GraphicsVramRangeNode *next;
    void *owner;
    u8 field_0c;
    u8 type;
    u16 blockStart;
    u16 blockCount;
    u16 refCount;
};

/* Fixed descriptor pool for 0x400 128-byte graphics-VRAM blocks. */
typedef struct GraphicsVramAllocator {
    GraphicsVramRangeNode nodes[GRAPHICS_VRAM_RANGE_CAPACITY];
    GraphicsVramRangeNode *freeNodes;
    u32 rangeCount;
} GraphicsVramAllocator;

typedef char GraphicsVramRangeNodeSizeCheck[
    sizeof(GraphicsVramRangeNode) == 0x14 ? 1 : -1];
typedef char GraphicsVramAllocatorSizeCheck[
    sizeof(GraphicsVramAllocator) == 0x788 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsVramRangeNode_Init(GraphicsVramRangeNode *node);
void GraphicsVramRangeNode_Destroy(GraphicsVramRangeNode *node);
GraphicsVramAllocator *GraphicsVramAllocator_Init(
    GraphicsVramAllocator *allocator);
GraphicsVramRangeNode *GraphicsVramAllocator_Allocate(
    GraphicsVramAllocator *allocator, s32 blockCount, void *owner, u8 type);
void GraphicsVramAllocator_Release(GraphicsVramAllocator *allocator,
                                   GraphicsVramRangeNode *node);

#ifdef __cplusplus
}
#endif

#endif
