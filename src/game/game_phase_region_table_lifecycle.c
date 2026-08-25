#include "tingle/game_phase_region_table.h"
#include "tingle/heap.h"

/* Allocate, populate, resize, and destroy the phase region table. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char gGamePhaseRegionResizeArrayAllocationTag[];
extern const char gGamePhaseRegionInitialArrayAllocationTag[];
extern const GamePhaseRegion gDefaultGamePhaseRegion;
extern void *CxxArray_ConstructWithCookie(void *allocation, s32 count, s32 elementSize,
                           s32 stride, void (*construct)(GamePhaseRegion *),
                           void (*destroy)(GamePhaseRegion *));
extern void CxxArray_DestroyAndFree(void *array, s32 elementSize, s32 stride,
                          void (*destroy)(GamePhaseRegion *));
#ifdef __cplusplus
}
#endif

/* Initialize an empty table and set the low byte of flags to 0xff; returns self. */
GamePhaseRegionTable *GamePhaseRegionTable_Init(GamePhaseRegionTable *self)
{
    GamePhaseRegionTable_InitWithCount(self, 0);
    self->flags = (self->flags & ~0xff) | 0xff;
    return self;
}

/*
 * Allocate count eight-byte regions with the recovered array-new helper and
 * no-op element hooks, store the array/count pair, and return self. Zero count
 * produces a null pointer. Heap state changes; region contents remain unset.
 */
GamePhaseRegionTable *GamePhaseRegionTable_InitWithCount(
    GamePhaseRegionTable *self, s32 count)
{
    GamePhaseRegion *regions = 0;
    if (count) {
        void *allocation = Heap_Alloc(count * sizeof(GamePhaseRegion) + 8,
                                      gGamePhaseRegionInitialArrayAllocationTag,
                                      4, &gHeapContext);
        if (allocation)
            regions = (GamePhaseRegion *)CxxArray_ConstructWithCookie(
                allocation, count, sizeof(GamePhaseRegion),
                sizeof(GamePhaseRegion), GamePhaseRegion_Init,
                GamePhaseRegion_Destroy);
    }
    self->regions = regions;
    self->count = count;
    return self;
}

/* Recovered no-op array element constructor; it leaves region unchanged. */
void GamePhaseRegion_Init(GamePhaseRegion *region)
{
    (void)region;
}

/* Recovered no-op array element destructor; it leaves region unchanged. */
void GamePhaseRegion_Destroy(GamePhaseRegion *region)
{
    (void)region;
}

/* Destroy the owned region array when present and reset pointer/count to zero. */
void GamePhaseRegionTable_Clear(GamePhaseRegionTable *self)
{
    if (self->regions) {
        CxxArray_DestroyAndFree(self->regions, sizeof(GamePhaseRegion),
                      sizeof(GamePhaseRegion), GamePhaseRegion_Destroy);
        self->regions = 0;
    }
    self->count = 0;
}

/* Destroy the table's owned array and return self without freeing the table object. */
GamePhaseRegionTable *GamePhaseRegionTable_Destroy(GamePhaseRegionTable *self)
{
    GamePhaseRegionTable_Clear(self);
    return self;
}

/*
 * Replace the table from a rectangle array terminated by an all-zero entry.
 * A null source creates one entry copied from gDefaultGamePhaseRegion. The
 * terminating zero entry is not copied. Allocation and old-array ownership
 * are updated.
 */
void GamePhaseRegionTable_SetRegionsFromSentinel(GamePhaseRegionTable *self,
                                                 const GamePhaseRegion *source)
{
    s32 count = 0;
    s32 i;
    if (!source) {
        GamePhaseRegionTable_Resize(self, 1);
        self->regions[0] = gDefaultGamePhaseRegion;
        return;
    }
    while (source[count].left || source[count].top ||
           source[count].right || source[count].bottom)
        count++;
    GamePhaseRegionTable_Resize(self, count);
    for (i = 0; i < count; i++)
        self->regions[i] = source[i];
}

/*
 * Destroy any existing array, allocate exactly count uninitialized entries
 * with the alternate recovered heap tag, and store the pointer/count pair.
 */
void GamePhaseRegionTable_Resize(GamePhaseRegionTable *self, s32 count)
{
    GamePhaseRegion *regions = 0;
    if (self->regions)
        GamePhaseRegionTable_Clear(self);
    {
        void *allocation = Heap_Alloc(count * sizeof(GamePhaseRegion) + 8,
                                      gGamePhaseRegionResizeArrayAllocationTag,
                                      4, &gHeapContext);
        if (allocation)
            regions = (GamePhaseRegion *)CxxArray_ConstructWithCookie(
                allocation, count, sizeof(GamePhaseRegion),
                sizeof(GamePhaseRegion), GamePhaseRegion_Init,
                GamePhaseRegion_Destroy);
    }
    self->regions = regions;
    self->count = count;
}
