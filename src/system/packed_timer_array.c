#include "tingle/packed_timer_array.h"
#include "tingle/game_work.h"

/*
 * A persistent array of 256 compact frame timers. Each timer stores a signed
 * 29-bit tick countdown and a three-bit state in one word. Active timers count
 * in 60-frame seconds and can repeat a configured number of times; the whole
 * array is mirrored in GameWork at offset 0x51F0 for save-state persistence.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void *constructor, void *destructor);
extern void __destroy_arr(void *array, u32 count, u32 elementSize,
                          void *destructor);

extern GameWork *gGameWork;

#ifdef __cplusplus
}
#endif

#ifndef MATCHING
/* Portable builds need only the semantic contiguous 256-entry bank. */
PackedTimerArray gPackedTimerArray;
#define PACKED_TIMER_BANK (&gPackedTimerArray)
#else
/* The matching assembly also exports interior labels at entries 207/209. */
extern PackedTimer gPackedTimerArray[];
extern PackedTimer data_020f4160[];
extern PackedTimer data_020f4178[];
#define PACKED_TIMER_BANK ((PackedTimerArray *)gPackedTimerArray)
#endif

/* Clear all timer fields, including both packed bitfields, and return it. */
PackedTimer *PackedTimer_Init(PackedTimer *timer)
{
    timer->state = 0;
    timer->initialSeconds = 0;
    timer->repeatSeconds = 0;
    timer->repeatLimit = 0;
    timer->ticks = 0;
    timer->repeatCount = 0;
    return timer;
}

/* Configure all four halfword fields and reset the packed state and ticks. */
void PackedTimer_Configure(PackedTimer *timer, u16 initialSeconds,
                           u16 repeatSeconds, u16 repeatLimit,
                           u16 repeatCount)
{
    timer->initialSeconds = initialSeconds;
    timer->repeatSeconds = repeatSeconds;
    timer->repeatLimit = repeatLimit;
    timer->state = 0;
    timer->ticks = 0;
    timer->repeatCount = repeatCount;
}

/* Element destructor: timers own no external storage or SDK resources. */
void PackedTimer_DestroyNoOp(PackedTimer *timer)
{
    (void)timer;
}

/*
 * Advance one frame. State 1 consumes the initial delay, state 2 consumes
 * repeat delays and increments repeatCount, and state 3 remains complete.
 */
void PackedTimer_Update(PackedTimer *timer)
{
    switch (timer->state) {
    case 0:
        break;

    case 1:
        timer->ticks--;
        if (timer->ticks > 0) {
            return;
        }
        timer->ticks = timer->repeatSeconds * 60;
        timer->state = 2;
        /* Fall through: the first repeat tick is consumed immediately. */

    case 2:
        timer->ticks--;
        if (timer->ticks > 0) {
            return;
        }
        timer->repeatCount++;
        timer->ticks = timer->repeatSeconds * 60;
        if (timer->repeatLimit != 0 &&
            timer->repeatCount >= timer->repeatLimit) {
            timer->state = 3;
        }
        return;

    case 3:
        break;
    }
}

/* Start the timer's initial 60-frame-per-second countdown in state 1. */
void PackedTimer_Start(PackedTimer *timer)
{
    timer->ticks = timer->initialSeconds * 60;
    timer->state = 1;
}

/* Mark the timer complete without changing its countdown or counters. */
void PackedTimer_MarkComplete(PackedTimer *timer)
{
    timer->state = 3;
}

/* Copy every timer field unless source and destination are identical. */
void PackedTimer_Copy(PackedTimer *destination, const PackedTimer *source)
{
    if (destination == source) {
        return;
    }

    destination->initialSeconds = source->initialSeconds;
    destination->repeatSeconds = source->repeatSeconds;
    destination->repeatLimit = source->repeatLimit;
    destination->ticks = source->ticks;
    destination->repeatCount = source->repeatCount;
    destination->state = source->state;
}

/* Copy a timer into caller-provided persistent storage. */
void PackedTimer_CopyToPersistent(const PackedTimer *source,
                                  PackedTimer *destination)
{
    destination->initialSeconds = source->initialSeconds;
    destination->repeatSeconds = source->repeatSeconds;
    destination->repeatLimit = source->repeatLimit;
    destination->repeatCount = source->repeatCount;
    destination->ticks = source->ticks;
    destination->state = source->state;
}

/* Restore a timer from caller-provided persistent storage. */
void PackedTimer_RestoreFromPersistent(PackedTimer *destination,
                                       const PackedTimer *source)
{
    destination->initialSeconds = source->initialSeconds;
    destination->repeatSeconds = source->repeatSeconds;
    destination->repeatLimit = source->repeatLimit;
    destination->repeatCount = source->repeatCount;
    destination->ticks = source->ticks;
    destination->state = source->state;
}

/* Invoke the C++ array runtime to construct all 256 timer elements. */
PackedTimerArray *PackedTimerArray_Init(PackedTimerArray *array)
{
    __construct_array(array, PACKED_TIMER_COUNT, sizeof(PackedTimer),
                      (void *)PackedTimer_Init, (void *)PackedTimer_DestroyNoOp);
    return array;
}

/* Destroy all 256 elements in reverse order through the C++ array runtime. */
PackedTimerArray *PackedTimerArray_Destroy(PackedTimerArray *array)
{
    __destroy_arr(array, PACKED_TIMER_COUNT, sizeof(PackedTimer),
                  (void *)PackedTimer_DestroyNoOp);
    return array;
}

/* Advance every timer in index order; no SDK or hardware state is touched. */
void PackedTimerArray_Update(PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        PackedTimer_Update(&array->entries[i]);
    }
}

/* Return an indexed timer without performing a bounds check. */
PackedTimer *PackedTimerArray_Get(PackedTimerArray *array, int index)
{
    return &array->entries[index];
}

/* Build a temporary configured timer and copy it into the indexed slot. */
void PackedTimerArray_ConfigureEntry(
    PackedTimerArray *array, int index, u16 initialSeconds,
    u16 repeatSeconds, u16 repeatLimit, u16 repeatCount)
{
    PackedTimer timer;

    PackedTimer_Configure(&timer, initialSeconds, repeatSeconds,
                          repeatLimit, repeatCount);
    PackedTimer_Copy(&array->entries[index], &timer);
}

/* Copy all timers to the 0x51F0 persistence region in the GameWork singleton. */
void PackedTimerArray_SaveToGameWork(const PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        PackedTimer_CopyToPersistent(
            &array->entries[i],
            &((PackedTimer *)((u8 *)gGameWork + 0x51F0))[i]);
    }
}

/* Restore all timers from the 0x51F0 region in the GameWork singleton. */
void PackedTimerArray_LoadFromGameWork(PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        PackedTimer_RestoreFromPersistent(
            &array->entries[i],
            &((const PackedTimer *)((const u8 *)gGameWork + 0x51F0))[i]);
    }
}

/* Return the process-global timer array constructed during ARM9 startup. */
PackedTimerArray *PackedTimerArray_GetGlobal(void)
{
    return PACKED_TIMER_BANK;
}
