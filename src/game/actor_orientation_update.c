#include "tingle/types.h"

/* Rotate actor orientation toward a vector or world-space target point. */

#ifdef __cplusplus
extern "C" {
#endif
extern u16 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * For nonzero vector X/Y, obtain its angle through func_020ae024, rotate by
 * -0x4000, and move current angle 0xc8 toward it by at most maxStep along the
 * shorter 16-bit arc. A turn delta below 0x2000, or actor flag 0x8000 at 0xd0,
 * sets flag one; otherwise X/Y motion 0x3c/0x40 is cleared. A zero vector
 * restores angle 0xcc. Quantize current angle to byte 0xd4 and set debounce
 * halfword 0x1ea to five when it differs from prior byte 0xd5; otherwise count
 * that timer down. Return the desired/restored angle quantized to eight
 * directions. No direct hardware access occurs.
 */
s32 func_02032228(void *self, s32 x, s32 y, s32 maxStep)
{
    u8 *actor = (u8 *)self;
    u32 desired;
    u32 current;

    if (x || y) {
        s32 delta;
        s32 adjustment;

        desired = (u16)(func_020ae024(y, x) - 0x4000);
        current = *(u32 *)(actor + 0xc8);
        if (current > desired)
            desired += 0x10000;
        delta = desired - current;
        if (delta < 0x8000) {
            if (delta < 0x2000 || (*(u32 *)(actor + 0xd0) & 0x8000))
                *(u32 *)(actor + 0xd0) |= 1;
            else
                *(u32 *)(actor + 0x3c) = *(u32 *)(actor + 0x40) = 0;
            adjustment = delta > maxStep ? maxStep : delta;
        } else {
            delta = 0x10000 - delta;
            if (delta < 0x2000 || (*(u32 *)(actor + 0xd0) & 0x8000))
                *(u32 *)(actor + 0xd0) |= 1;
            else
                *(u32 *)(actor + 0x3c) = *(u32 *)(actor + 0x40) = 0;
            adjustment = -(delta > maxStep ? maxStep : delta);
        }
        *(u32 *)(actor + 0xc8) = (u16)(current + adjustment);
    } else {
        desired = *(u32 *)(actor + 0xcc);
        *(u32 *)(actor + 0xc8) = desired;
    }

    if (*(u16 *)(actor + 0x1ea) == 0) {
        actor[0xd4] = (u8)(((u16)(*(u32 *)(actor + 0xc8) + 0x1000)) >> 13);
        if (actor[0xd4] != actor[0xd5])
            *(u16 *)(actor + 0x1ea) = 5;
    } else {
        (*(u16 *)(actor + 0x1ea))--;
    }
    return ((u16)(desired + 0x1000)) >> 13;
}

/*
 * Subtract actor X/Y at 0x1c/0x20 from target vector coordinates 0x04/0x08,
 * then delegate to func_02032228 with maxStep. Return its direction index.
 */
s32 func_02032370(void *self, const void *target, s32 maxStep)
{
    const u8 *point = (const u8 *)target;
    u8 *actor = (u8 *)self;
    return func_02032228(actor,
                         *(s32 *)(point + 0x04) - *(s32 *)(actor + 0x1c),
                         *(s32 *)(point + 0x08) - *(s32 *)(actor + 0x20),
                         maxStep);
}
