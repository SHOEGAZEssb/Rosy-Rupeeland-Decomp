#include "tingle/types.h"

/*
 * Overlay 42 late 64-record pool allocation. This recovered spawner consumes
 * one signed free-list entry, copies a caller payload, and initializes its
 * angle, velocity, lifetime, and subtype-specific activity marker.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_0220368c(void *destination, const void *left,
                                      const void *right);
extern "C" u16 func_020ae024(s32 x, s32 y);
extern "C" s16 gFx32CosSinTable[];

static s32 multiply_fx(s32 value, s32 factor)
{
    return (s32)(((s64)value * factor + 0x800) >> 12);
}

/*
 * Given pool, subtype, source payload, and base angle, ignore the request when
 * signed head +0x844 is negative. Subtype zero adjusts the angle by the angle
 * from source toward the confirmed owner position at table+8+0x94. Copy source
 * into the selected +0x144 record, store the angle, derive sine/cosine, and set
 * its velocity at +0x448/+0x44C. Subtypes 2/3/4 use factors 8/4/8 with activity
 * bytes 10/11/12 and lifetimes 20/1/1; subtype 6 uses factor 1.5, byte one,
 * lifetime three; other subtypes use factor 1.5, byte one, lifetime one. Clear
 * age +0x744 and advance the signed head through +0x7C4. No value is returned.
 */
extern "C" void func_ov042_022051a8(void *pool, s32 subtype,
                                      const void *source, u16 baseAngle)
{
    s32 index = FIELD(s32, pool, 0x844);
    if (index < 0)
        return;
    u16 angle = baseAngle;
    if (subtype == 0) {
        s32 difference[3];
        func_ov042_021fcf80(difference);
        const void *target = (u8 *)FIELD(void *, FIELD(void *, pool, 0), 8) + 0x94;
        func_ov042_0220368c(difference, target, source);
        angle = (u16)(angle + func_020ae024(difference[1], difference[2]));
    }

    void *record = (u8 *)pool + 0x144 + index * 12;
    FIELD(u16, pool, 0xc4 + index * 2) = angle;
    s32 trigIndex = (angle >> 4) * 2;
    s32 sine = gFx32CosSinTable[trigIndex];
    s32 cosine = gFx32CosSinTable[trigIndex + 1];
    func_ov042_021fda0c(record, source);

    s32 factor;
    s16 lifetime;
    s8 marker;
    if (subtype == 2) {
        factor = 0x8000;
        lifetime = 20;
        marker = 10;
    } else if (subtype == 3) {
        factor = 0x4000;
        lifetime = 1;
        marker = 11;
    } else if (subtype == 4) {
        factor = 0x8000;
        lifetime = 1;
        marker = 12;
    } else if (subtype == 6) {
        factor = 0x1800;
        lifetime = 3;
        marker = 1;
    } else {
        factor = 0x1800;
        lifetime = 1;
        marker = 1;
    }
    FIELD(s32, pool, 0x448 + index * 12) = multiply_fx(sine, factor);
    FIELD(s32, pool, 0x44c + index * 12) = multiply_fx(cosine, factor);
    FIELD(s16, pool, 0x44 + index * 2) = lifetime;
    FIELD(s8, pool, 4 + index) = marker;
    FIELD(u16, pool, 0x744 + index * 2) = 0;
    FIELD(s32, pool, 0x844) = FIELD(s16, pool, 0x7c4 + index * 2);
}
