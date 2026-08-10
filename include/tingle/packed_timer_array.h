#ifndef TINGLE_PACKED_TIMER_ARRAY_H
#define TINGLE_PACKED_TIMER_ARRAY_H

#include "tingle/types.h"

#define PACKED_TIMER_COUNT 0x100

typedef struct PackedTimer {
    u16 initialSeconds;
    u16 repeatSeconds;
    u16 repeatLimit;
    u16 repeatCount;
    s32 ticks : 29;
    u32 state : 3;
} PackedTimer;

typedef struct PackedTimerArray {
    PackedTimer entries[PACKED_TIMER_COUNT];
} PackedTimerArray;

typedef char PackedTimerSizeCheck[sizeof(PackedTimer) == 0xC ? 1 : -1];
typedef char PackedTimerArraySizeCheck[
    sizeof(PackedTimerArray) == 0xC00 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

PackedTimer *PackedTimer_Init(PackedTimer *timer);
void PackedTimer_Configure(PackedTimer *timer, u16 initialSeconds,
                           u16 repeatSeconds, u16 repeatLimit,
                           u16 repeatCount);
void PackedTimer_DestroyNoOp(PackedTimer *timer);
void PackedTimer_Update(PackedTimer *timer);
void PackedTimer_Start(PackedTimer *timer);
void PackedTimer_MarkComplete(PackedTimer *timer);
void PackedTimer_Copy(PackedTimer *destination, const PackedTimer *source);
void PackedTimer_CopyToPersistent(const PackedTimer *source,
                                  PackedTimer *destination);
void PackedTimer_RestoreFromPersistent(PackedTimer *destination,
                                       const PackedTimer *source);
PackedTimerArray *PackedTimerArray_Init(PackedTimerArray *array);
PackedTimerArray *PackedTimerArray_Destroy(PackedTimerArray *array);
void PackedTimerArray_Update(PackedTimerArray *array);
PackedTimer *PackedTimerArray_Get(PackedTimerArray *array, int index);
void PackedTimerArray_ConfigureEntry(
    PackedTimerArray *array, int index, u16 initialSeconds,
    u16 repeatSeconds, u16 repeatLimit, u16 repeatCount);
void PackedTimerArray_SaveToGameWork(const PackedTimerArray *array);
void PackedTimerArray_LoadFromGameWork(PackedTimerArray *array);
PackedTimerArray *PackedTimerArray_GetGlobal(void);

#ifdef __cplusplus
}
#endif

#endif
