#include "tingle/heap.h"
#include "tingle/types.h"

/* Reorder block-major background map data into its linear screen layout. */

typedef struct GraphicsBgMapDescriptor {
    u8 field_00[0x0c];
    s32 width;
    s32 height;
} GraphicsBgMapDescriptor;

typedef struct GraphicsBgMapResource {
    u8 field_00[0x20];
    GraphicsBgMapDescriptor *descriptor;
    u16 *data;
} GraphicsBgMapResource;

extern HeapContext gHeapContext;
extern u32 func_02070e94(const GraphicsBgMapResource *resource);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);

/*
 * Copy the borrowed map through temporary graphics-heap storage, then replace
 * its caller-owned payload with the retail 32x32-block-to-linear ordering.
 * Dimensions and sizes are pixels/bytes from the decoded screen descriptor;
 * temporary ownership is released before return and no hardware is touched.
 */
void func_02070fd4(GraphicsBgMapResource *resource)
{
    u32 size = func_02070e94(resource);
    u16 *temporary = (u16 *)HeapContext_Alloc(
        &gHeapContext, size, 0, 4);
    s32 blocks_x;
    s32 blocks_y;
    s32 block_y;

    MI_CpuCopy8(resource->data, temporary, size);
    blocks_x = resource->descriptor->width / 32;
    blocks_y = resource->descriptor->height / 32;
    for (block_y = 0; block_y < blocks_y; ++block_y) {
        s32 block_x;
        for (block_x = 0; block_x < blocks_x; ++block_x) {
            const u16 *block = temporary +
                (block_y * blocks_x + block_x) * 32 * 32;
            s32 y;
            for (y = 0; y < 32; ++y) {
                s32 x;
                for (x = 0; x < 32; ++x) {
                    resource->data[(block_y * 32 + y) *
                                       resource->descriptor->width +
                                   block_x * 32 + x] = block[y * 32 + x];
                }
            }
        }
    }
    Heap_Free(temporary);
}
