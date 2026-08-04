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
PackedTimerArray data_020f37ac;
#define PACKED_TIMER_BANK (&data_020f37ac)
#else
/* The matching assembly also exports interior labels at entries 207/209. */
extern PackedTimer data_020f37ac[];
extern PackedTimer data_020f4160[];
extern PackedTimer data_020f4178[];
#define PACKED_TIMER_BANK ((PackedTimerArray *)data_020f37ac)
#endif

/* Clear all timer fields, including both packed bitfields, and return it. */
PackedTimer *func_02001db8(PackedTimer *timer)
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
void func_02001de8(PackedTimer *timer, u16 initialSeconds,
                   u16 repeatSeconds, u16 repeatLimit, u16 repeatCount)
{
    timer->initialSeconds = initialSeconds;
    timer->repeatSeconds = repeatSeconds;
    timer->repeatLimit = repeatLimit;
    timer->state = 0;
    timer->ticks = 0;
    timer->repeatCount = repeatCount;
}

/* Element destructor: timers own no external storage or SDK resources. */
void func_02001e10(PackedTimer *timer)
{
    (void)timer;
}

/*
 * Advance one frame. State 1 consumes the initial delay, state 2 consumes
 * repeat delays and increments repeatCount, and state 3 remains complete.
 */
void func_02001e14(PackedTimer *timer)
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
void func_02001f14(PackedTimer *timer)
{
    timer->ticks = timer->initialSeconds * 60;
    timer->state = 1;
}

/* Mark the timer complete without changing its countdown or counters. */
void func_02001f40(PackedTimer *timer)
{
    timer->state = 3;
}

/* Copy every timer field unless source and destination are identical. */
void func_02001f54(PackedTimer *destination, const PackedTimer *source)
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
void func_02001fb8(const PackedTimer *source, PackedTimer *destination)
{
    destination->initialSeconds = source->initialSeconds;
    destination->repeatSeconds = source->repeatSeconds;
    destination->repeatLimit = source->repeatLimit;
    destination->repeatCount = source->repeatCount;
    destination->ticks = source->ticks;
    destination->state = source->state;
}

/* Restore a timer from caller-provided persistent storage. */
void func_02002010(PackedTimer *destination, const PackedTimer *source)
{
    destination->initialSeconds = source->initialSeconds;
    destination->repeatSeconds = source->repeatSeconds;
    destination->repeatLimit = source->repeatLimit;
    destination->repeatCount = source->repeatCount;
    destination->ticks = source->ticks;
    destination->state = source->state;
}

/* Invoke the C++ array runtime to construct all 256 timer elements. */
PackedTimerArray *func_02002068(PackedTimerArray *array)
{
    __construct_array(array, PACKED_TIMER_COUNT, sizeof(PackedTimer),
                      (void *)func_02001db8, (void *)func_02001e10);
    return array;
}

/* Destroy all 256 elements in reverse order through the C++ array runtime. */
PackedTimerArray *func_020020a0(PackedTimerArray *array)
{
    __destroy_arr(array, PACKED_TIMER_COUNT, sizeof(PackedTimer),
                  (void *)func_02001e10);
    return array;
}

/* Advance every timer in index order; no SDK or hardware state is touched. */
void func_020020c4(PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        func_02001e14(&array->entries[i]);
    }
}

/* Return an indexed timer without performing a bounds check. */
PackedTimer *func_020020ec(PackedTimerArray *array, int index)
{
    return &array->entries[index];
}

/* Build a temporary configured timer and copy it into the indexed slot. */
void func_020020f8(PackedTimerArray *array, int index, u16 initialSeconds,
                   u16 repeatSeconds, u16 repeatLimit, u16 repeatCount)
{
    PackedTimer timer;

    func_02001de8(&timer, initialSeconds, repeatSeconds,
                  repeatLimit, repeatCount);
    func_02001f54(&array->entries[index], &timer);
}

/* Copy all timers to the 0x51F0 persistence region in the GameWork singleton. */
void func_0200213c(const PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        func_02001fb8(
            &array->entries[i],
            &((PackedTimer *)((u8 *)gGameWork + 0x51F0))[i]);
    }
}

/* Restore all timers from the 0x51F0 region in the GameWork singleton. */
void func_02002180(PackedTimerArray *array)
{
    int i;

    for (i = 0; i < PACKED_TIMER_COUNT; i++) {
        func_02002010(
            &array->entries[i],
            &((const PackedTimer *)((const u8 *)gGameWork + 0x51F0))[i]);
    }
}

/* Return the process-global timer array constructed during ARM9 startup. */
PackedTimerArray *func_020021c4(void)
{
    return PACKED_TIMER_BANK;
}
