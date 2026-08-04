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

PackedTimer *func_02001db8(PackedTimer *timer);
void func_02001de8(PackedTimer *timer, u16 initialSeconds,
                   u16 repeatSeconds, u16 repeatLimit, u16 repeatCount);
void func_02001e10(PackedTimer *timer);
void func_02001e14(PackedTimer *timer);
void func_02001f14(PackedTimer *timer);
void func_02001f40(PackedTimer *timer);
void func_02001f54(PackedTimer *destination, const PackedTimer *source);
void func_02001fb8(const PackedTimer *source, PackedTimer *destination);
void func_02002010(PackedTimer *destination, const PackedTimer *source);
PackedTimerArray *func_02002068(PackedTimerArray *array);
PackedTimerArray *func_020020a0(PackedTimerArray *array);
void func_020020c4(PackedTimerArray *array);
PackedTimer *func_020020ec(PackedTimerArray *array, int index);
void func_020020f8(PackedTimerArray *array, int index, u16 initialSeconds,
                   u16 repeatSeconds, u16 repeatLimit, u16 repeatCount);
void func_0200213c(const PackedTimerArray *array);
void func_02002180(PackedTimerArray *array);
PackedTimerArray *func_020021c4(void);

#ifdef __cplusplus
}
#endif

#endif
