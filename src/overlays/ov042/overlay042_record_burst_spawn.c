#include "tingle/types.h"

/*
 * Overlay 42 ordinary-record burst allocation. This recovered emitter consumes
 * up to sixteen free-list entries and initializes randomized fixed-point
 * position and velocity vectors around a caller-supplied origin.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s16 gFx32CosSinTable[];

/*
 * Given a pool, requested state, origin payload, and subtype tag, allocate at
 * most sixteen records from +0xF24. Requested state two is stored as state
 * seven. Each record receives a random 16-bit angle, a radius accumulated from
 * three random sine-table samples and capped at 0x800, an origin-relative
 * position, and a radial velocity with a confirmed -0x2000 vertical bias.
 * Position/velocity scales are 6/5 for state zero and 10/14 otherwise. Clear
 * the age halfword, store the subtype, advance the free-list head, and return
 * no value. Exhaustion simply skips the remaining iterations.
 */
extern "C" void func_ov042_021fda24(void *pool, s32 requestedState,
                                      const void *origin, u16 subtype)
{
    for (s32 n = 15; n >= 0; --n) {
        s32 index = FIELD(s32, pool, 0xf24);
        if (index < 0)
            continue;

        FIELD(s32, pool, 0xb3c + index * 4) =
            requestedState == 2 ? 7 : requestedState;
        u16 angle = (u16)genrand_int32();
        s32 radius = 8;
        for (s32 sample = 2; sample >= 0; --sample) {
            u32 randomAngle = genrand_int32() & 0x3fff;
            radius += gFx32CosSinTable[((u16)randomAngle >> 4) * 2] >> 2;
        }
        if (radius > 0x800)
            radius = 0x800;

        s32 trigIndex = ((u16)angle >> 4) * 2;
        s32 x = gFx32CosSinTable[trigIndex + 1];
        s32 y = gFx32CosSinTable[trigIndex];
        x = (s32)(((s64)x * radius + 0x800) >> 12);
        y = (s32)(((s64)y * radius + 0x800) >> 12);
        FIELD(u16, pool, 0x9ac + index * 2) = angle;

        s32 positionScale = requestedState == 0 ? 6 : 10;
        s32 velocityScale = requestedState == 0 ? 5 : 14;
        FIELD(s32, pool, 0x50 + index * 12) =
            FIELD(s32, origin, 4) + x * positionScale;
        FIELD(s32, pool, 0x54 + index * 12) =
            FIELD(s32, origin, 8) + y * positionScale;
        FIELD(s32, pool, 0x500 + index * 12) = x * velocityScale;
        FIELD(s32, pool, 0x504 + index * 12) = y * velocityScale - 0x2000;
        FIELD(u16, pool, 0xa74 + index * 2) = 0;
        FIELD(u16, pool, 0xccc + index * 2) = subtype;
        FIELD(s32, pool, 0xf24) = FIELD(s32, pool, 0xd94 + index * 4);
    }
}
