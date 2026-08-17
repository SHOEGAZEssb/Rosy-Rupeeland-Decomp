/*
 * Deterministic per-object random-value helpers shared by title-era scenes.
 * They advance caller-owned LCG state and do not touch the global MT stream.
 */
#include "tingle/types.h"

extern u64 func_020bf1f8(u32 value, u32 divisor);

/* Advance state and return an inclusive sample between either endpoint. */
s32 func_0209189c(u32 *state, s32 first, s32 second)
{
    s32 swap;

    *state = *state * 0x41c64e6d + 0x3039;
    if (first > second) {
        swap = first;
        first = second;
        second = swap;
    }
    return first +
           (s32)(func_020bf1f8((*state >> 16) & 0x7fff,
                               (u32)(second + 1 - first)) >>
                 32);
}

/* Advance state and return a zero-based sample below upperBound. */
s32 TitleRandom_NextBounded(u32 *state, s32 upperBound)
{
    *state = *state * 0x41c64e6d + 0x3039;
    return (s32)(func_020bf1f8((*state >> 16) & 0x7fff,
                               (u32)upperBound) >>
                 32);
}
