/*
 * Randomized six-word scroll/noise value used by several presentation scenes.
 * Construction samples the global MT stream; updates advance one frame.
 */
#include "tingle/types.h"

typedef struct TitleScrollValue {
    s32 tick;
    s32 firstLimit;
    s32 secondLimit;
    s32 remaining;
    s32 quarterRemaining;
    s32 eighthRemaining;
} TitleScrollValue;

extern u32 genrand_int32(void);

/* Seed randomized limits and clear all counters. */
void *func_020929b0(TitleScrollValue *value)
{
    value->firstLimit = genrand_int32() & 0xff;
    value->secondLimit =
        value->firstLimit + 0x60 + (genrand_int32() & 0x3f);
    value->eighthRemaining = 0;
    value->quarterRemaining = 0;
    value->remaining = 0;
    return value;
}

/* Advance a frame and derive signed quarter/eighth countdown values. */
void *func_020929f4(TitleScrollValue *value)
{
    ++value->tick;
    --value->remaining;
    value->quarterRemaining = value->remaining / 4;
    value->eighthRemaining = value->remaining / 8;
    return value;
}
