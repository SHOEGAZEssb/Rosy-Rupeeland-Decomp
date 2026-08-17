#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/* Allocate cached handles and read indexed graphics payloads from NDS files. */

typedef struct GraphicsArchiveEntry {
    u32 fileOffset;
    u32 packedSize;
} GraphicsArchiveEntry;

typedef struct GraphicsArchive {
    FSFileID files[15];
    const GraphicsArchiveEntry *entryTables[15];
} GraphicsArchive;

typedef struct GraphicsArchiveAllocationState {
    u32 accumulatedSize;
    void *allocator;
} GraphicsArchiveAllocationState;

#ifdef __cplusplus
extern "C" {
#endif
extern GraphicsArchiveAllocationState data_021e9e60;
extern const char data_020e68f0[];
extern const char data_020e68f8[];
extern const char data_020e6900[];
extern void *func_020a72d4(void *allocator, u32 size, s32 alignment);
extern void func_020a71f4(void *allocator, void (*callback)(void *),
                          void *callbackArgument);
extern void func_020713c4(void *allocation);
extern void MI_UncompressLZ8(const void *source, void *destination);
extern void func_020b4554(void *address, u32 size);
#ifdef __cplusplus
}
#endif

/*
 * Allocate a four-byte-aligned cached-resource handle. On failure retail
 * clears the accumulated allocation size and registers func_020713c4 with the
 * archive allocator before returning null; no graphics hardware is touched.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_020713e4(u32 size)
{
    void *allocation = func_020a72d4(data_021e9e60.allocator, size, 4);
    if (allocation == 0) {
        data_021e9e60.accumulatedSize = 0;
        func_020a71f4(data_021e9e60.allocator, func_020713c4, 0);
    }
    return allocation;
}

/*
 * Read the archive entry encoded by resourceId (file index in bits 12+, entry
 * index in bits 0..11). Bit 31 of packedSize marks LZ8 data: the packed buffer
 * is four-byte reverse-aligned, then expanded into a normal aligned buffer.
 * On success outputSize receives the unpacked byte count and the range is
 * cache-flushed; failures return null. Retail does not close the file on the
 * two read/open failure exits, which is preserved.
 */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
void *GraphicsArchive_LoadIndexedPayload(GraphicsArchive *archive, u32 resourceId, u32 *outputSize)
{
    FSFile file;
    const u32 entryIndex = resourceId & 0xfff;
    const u32 fileIndex = resourceId >> 12;
    u32 compressed;
    void *buffer;

    CheckedFS_InitFile(&file);
    if (CheckedFS_OpenFileFast(&file, archive->files[fileIndex])) {
        u32 packedSize =
            archive->entryTables[fileIndex][entryIndex].packedSize;
        *outputSize = packedSize & 0x7fffffff;
        compressed = packedSize & 0x80000000;
        if (compressed != 0) {
            buffer = Heap_AllocCore(*outputSize, data_020e68f0, -4,
                                    &gHeapContext);
        } else {
            buffer = Heap_AllocCore(*outputSize, data_020e68f8, 4,
                                    &gHeapContext);
        }

        CheckedFS_SeekFile(
            &file, archive->entryTables[fileIndex][entryIndex].fileOffset, 0);
        if (CheckedFS_ReadFile(&file, buffer, *outputSize) != *outputSize)
            goto failure;
        CheckedFS_CloseFile(&file);

        if (compressed != 0) {
            void *expanded;
            *outputSize = *(u32 *)buffer >> 8;
            expanded = Heap_AllocCore(*outputSize, data_020e6900, 4,
                                      &gHeapContext);
            MI_UncompressLZ8(buffer, expanded);
            Heap_FreeCore(buffer);
            buffer = expanded;
        }
        func_020b4554(buffer, *outputSize);
        return buffer;
    }
failure:
    return 0;
}
#endif
