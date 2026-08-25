#include "tingle/game_phase_region_table.h"
#include "tingle/game_file.h"
#include "tingle/heap.h"

/* Load a phase rectangle table from an LZ8-compressed region of a game file. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char gGamePhaseRegionDataPath[];
extern const char gGamePhaseRegionCompressedBufferAllocationTag[];
extern const char gGamePhaseRegionExpandedBufferAllocationTag[];
extern void OS_Halt(void);
extern void MI_UncompressLZ8(const void *source, void *destination);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void Heap_FreeAlternateEntry(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * If fileOffset_30 is zero, install the default rectangle and return zero.
 * Otherwise open the fixed region-data file, read compressedSize_34 bytes at
 * that offset, LZ8-decompress it, remove the leading four-byte payload header
 * with an overlapping SDK copy, allocate uncompressedSize/8 rectangles, copy
 * their four signed coordinates, free both scratch buffers, close the file,
 * and return one. Open failure enters OS_Halt. This mutates file, heap, and
 * table ownership state; the two caller-record offsets remain address-derived.
 */
s32 GamePhaseRegionTable_Load(GamePhaseRegionTable *self,
                              const GamePhaseRegionFileInfo *info)
{
    GameFile file;
    u8 *compressed;
    u8 *expanded;
    u32 expandedSize;
    s32 count;
    s32 i;

    if (!info->fileOffset_30) {
        GamePhaseRegionTable_SetRegionsFromSentinel(self, 0);
        return 0;
    }
    GameFile_Init(&file);
    if (!GameFile_Open(&file, gGamePhaseRegionDataPath))
        OS_Halt();
    compressed = (u8 *)Heap_Alloc(info->compressedSize_34, gGamePhaseRegionCompressedBufferAllocationTag,
                                  -4, &gHeapContext);
    GameFile_Seek(&file, info->fileOffset_30, 0);
    GameFile_Read(&file, compressed, info->compressedSize_34);
    expandedSize = *(u32 *)compressed >> 8;
    expanded = (u8 *)Heap_Alloc(expandedSize & ~1, gGamePhaseRegionExpandedBufferAllocationTag,
                                -4, &gHeapContext);
    MI_UncompressLZ8(compressed, expanded);
    MI_CpuCopy8(expanded + 4, expanded, expandedSize - 4);
    count = expandedSize / sizeof(GamePhaseRegion);
    GamePhaseRegionTable_Resize(self, count);
    for (i = 0; i < count; i++)
        self->regions[i] = ((GamePhaseRegion *)expanded)[i];
    Heap_FreeAlternateEntry(compressed);
    Heap_FreeAlternateEntry(expanded);
    GameFile_Destroy(&file);
    return 1;
}
