#include "tingle/game_phase_region_table.h"
#include "tingle/heap.h"

/* Allocate, populate, resize, and destroy the phase region table. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5630[];
extern const char data_020d5638[];
extern const GamePhaseRegion data_021055b8;
extern void *func_020c09cc(void *allocation, s32 count, s32 elementSize,
                           s32 stride, void (*construct)(GamePhaseRegion *),
                           void (*destroy)(GamePhaseRegion *));
extern void func_020c0c24(void *array, s32 elementSize, s32 stride,
                          void (*destroy)(GamePhaseRegion *));
#ifdef __cplusplus
}
#endif

/* Initialize an empty table and set the low byte of flags to 0xff; returns self. */
GamePhaseRegionTable *func_02011470(GamePhaseRegionTable *self)
{
    func_02011498(self, 0);
    self->flags = (self->flags & ~0xff) | 0xff;
    return self;
}

/*
 * Allocate count eight-byte regions with the recovered array-new helper and
 * no-op element hooks, store the array/count pair, and return self. Zero count
 * produces a null pointer. Heap state changes; region contents remain unset.
 */
GamePhaseRegionTable *func_02011498(GamePhaseRegionTable *self, s32 count)
{
    GamePhaseRegion *regions = 0;
    if (count) {
        void *allocation = Heap_Alloc(count * sizeof(GamePhaseRegion) + 8,
                                      data_020d5638, 4, &gHeapContext);
        if (allocation)
            regions = (GamePhaseRegion *)func_020c09cc(
                allocation, count, sizeof(GamePhaseRegion),
                sizeof(GamePhaseRegion), func_02011518, func_0201151c);
    }
    self->regions = regions;
    self->count = count;
    return self;
}

/* Recovered no-op array element constructor; it leaves region unchanged. */
void func_02011518(GamePhaseRegion *region)
{
    (void)region;
}

/* Recovered no-op array element destructor; it leaves region unchanged. */
void func_0201151c(GamePhaseRegion *region)
{
    (void)region;
}

/* Destroy the owned region array when present and reset pointer/count to zero. */
void func_02011520(GamePhaseRegionTable *self)
{
    if (self->regions) {
        func_020c0c24(self->regions, sizeof(GamePhaseRegion),
                      sizeof(GamePhaseRegion), func_0201151c);
        self->regions = 0;
    }
    self->count = 0;
}

/* Destroy the table's owned array and return self without freeing the table object. */
GamePhaseRegionTable *func_0201155c(GamePhaseRegionTable *self)
{
    func_02011520(self);
    return self;
}

/*
 * Replace the table from a rectangle array terminated by an all-zero entry.
 * A null source creates one entry copied from data_021055b8. The terminating
 * zero entry is not copied. Allocation and old-array ownership are updated.
 */
void func_02011584(GamePhaseRegionTable *self,
                   const GamePhaseRegion *source)
{
    s32 count = 0;
    s32 i;
    if (!source) {
        func_0201166c(self, 1);
        self->regions[0] = data_021055b8;
        return;
    }
    while (source[count].left || source[count].top ||
           source[count].right || source[count].bottom)
        count++;
    func_0201166c(self, count);
    for (i = 0; i < count; i++)
        self->regions[i] = source[i];
}

/*
 * Destroy any existing array, allocate exactly count uninitialized entries
 * with the alternate recovered heap tag, and store the pointer/count pair.
 */
void func_0201166c(GamePhaseRegionTable *self, s32 count)
{
    GamePhaseRegion *regions = 0;
    if (self->regions)
        func_02011520(self);
    {
        void *allocation = Heap_Alloc(count * sizeof(GamePhaseRegion) + 8,
                                      data_020d5630, 4, &gHeapContext);
        if (allocation)
            regions = (GamePhaseRegion *)func_020c09cc(
                allocation, count, sizeof(GamePhaseRegion),
                sizeof(GamePhaseRegion), func_02011518, func_0201151c);
    }
    self->regions = regions;
    self->count = count;
}
