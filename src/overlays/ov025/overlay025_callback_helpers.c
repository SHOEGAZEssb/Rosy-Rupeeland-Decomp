#include "tingle/types.h"

/* Overlay 25 effect render-position callback recovery. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Render-position callback for the effect controller. It converts base fixed-
 * point x +0x10 and combined y +0x20/+0x30 to integer sprite coordinates,
 * narrows them to signed halfwords, writes them to both primary sprites, and
 * offsets both secondary sprites by signed +0xA8 on x after that narrowing.
 * Four sprite positions change; returns void.
 */
extern "C" void func_ov025_021ff0c8(void *object)
{
    s32 xFixed = FIELD(s32, object, 0x10);
    s32 yFixed = FIELD(s32, object, 0x20) + FIELD(s32, object, 0x30);

    /* Signed division preserves the retail truncation toward zero. */
    s16 xInteger = xFixed / 0x1000;
    s16 yInteger = yFixed / 0x1000;

    void *sprite = FIELD(void *, object, 0xe8);
    FIELD(s16, sprite, 0x2c) = xInteger;
    FIELD(s16, sprite, 0x2e) = yInteger;

    sprite = FIELD(void *, object, 0xec);
    FIELD(s16, sprite, 0x2c) = FIELD(s32, object, 0xa8) + xInteger;
    FIELD(s16, sprite, 0x2e) = yInteger;

    sprite = FIELD(void *, object, 0xf0);
    FIELD(s16, sprite, 0x2c) = xInteger;
    FIELD(s16, sprite, 0x2e) = yInteger;

    sprite = FIELD(void *, object, 0xf4);
    FIELD(s16, sprite, 0x2c) = FIELD(s32, object, 0xa8) + xInteger;
    FIELD(s16, sprite, 0x2e) = yInteger;
}
