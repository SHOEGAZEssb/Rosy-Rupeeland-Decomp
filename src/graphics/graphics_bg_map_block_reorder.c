#include "tingle/graphics_bg_map_resource.h"
#include "tingle/heap.h"

/* Reorder block-major background map data into its linear screen layout. */

extern HeapContext gHeapContext;
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);

/*
 * Copy the borrowed map through temporary graphics-heap storage, then replace
 * its caller-owned payload with the retail 32x32-block-to-linear ordering.
 * Dimensions count screen-map entries and sizes are bytes from the map
 * descriptor;
 * temporary ownership is released before return and no hardware is touched.
 */
void GraphicsBgMapResource_Convert32x32BlockMajorToRowMajor(
    GraphicsBgMapResource *resource)
{
    u32 dataSizeBytes = GraphicsBgMapResource_GetDataSizeBytes(resource);
    u16 *blockMajorEntries = (u16 *)HeapContext_Alloc(
        &gHeapContext, dataSizeBytes, 0, 4);
    s32 blocksAcross;
    s32 blocksDown;
    s32 blockRow;

    MI_CpuCopy8(resource->entries, blockMajorEntries, dataSizeBytes);
    blocksAcross = resource->descriptor->entryColumnCount / 32;
    blocksDown = resource->descriptor->entryRowCount / 32;
    for (blockRow = 0; blockRow < blocksDown; ++blockRow) {
        s32 blockColumn;
        for (blockColumn = 0; blockColumn < blocksAcross; ++blockColumn) {
            const u16 *sourceBlock = blockMajorEntries +
                (blockRow * blocksAcross + blockColumn) * 32 * 32;
            s32 rowInBlock;
            for (rowInBlock = 0; rowInBlock < 32; ++rowInBlock) {
                s32 columnInBlock;
                for (columnInBlock = 0; columnInBlock < 32;
                     ++columnInBlock) {
                    resource->entries[(blockRow * 32 + rowInBlock) *
                                          resource->descriptor->entryColumnCount +
                                      blockColumn * 32 + columnInBlock] =
                        sourceBlock[rowInBlock * 32 + columnInBlock];
                }
            }
        }
    }
    Heap_Free(blockMajorEntries);
}
