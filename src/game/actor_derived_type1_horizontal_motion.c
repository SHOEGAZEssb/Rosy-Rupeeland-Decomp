#include "tingle/types.h"

/* Convert left/right system input into smoothed type-1 horizontal motion. */
extern u8 gSystemState[];

/* Multiply two 20.12 fixed-point values with the retail rounding bias. */
static s32 multiplyFx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Clear vertical primary/secondary motion, then return immediately when actor
 * +0x230 bit 4 is clear. Otherwise clear primary horizontal motion, interpret
 * gSystemState +0x1a bits 0x20/0x10 as negative/positive input, update facing
 * bit 0x80000000 and movement bits 1/2, blend +0x8c toward +/-0x1800, apply
 * fixed damping 0x0ccd, and set scale +0xde to 0x180 while moving or 0x100
 * while idle. Returns no value and performs no direct hardware or SDK calls.
 */
void ActorDerivedType1_UpdateHorizontalInputMotion(void *self)
{
    u8 *actor = (u8 *)self;
    s32 primary;
    s32 secondary;
    u16 input;

    *(s32 *)(actor + 0x90) = 0;
    *(s32 *)(actor + 0x40) = 0;
    if ((*(u32 *)(actor + 0x230) & 4) == 0) return;

    *(s32 *)(actor + 0x3c) = 0;
    input = *(u16 *)(gSystemState + 0x1a);
    if ((input & 0x30) != 0) {
        if ((input & 0x20) != 0) {
            *(s32 *)(actor + 0x3c) = -0x1800;
            *(u32 *)(actor + 0x230) |= 0x80000000;
        } else {
            *(s32 *)(actor + 0x3c) = 0x1800;
            *(u32 *)(actor + 0x230) &= ~0x80000000;
        }
        *(u32 *)(actor + 0x230) = (*(u32 *)(actor + 0x230) & ~1) | 2;
        secondary = *(s32 *)(actor + 0x8c);
        primary = *(s32 *)(actor + 0x3c);
        *(s32 *)(actor + 0x8c) =
            multiplyFx(secondary, 0x0e66) + multiplyFx(primary, 0x019a);
    }
    *(s32 *)(actor + 0x8c) = multiplyFx(*(s32 *)(actor + 0x8c), 0x0ccd);
    *(u16 *)(actor + 0xde) = *(s32 *)(actor + 0x3c) != 0 ? 0x180 : 0x100;
}
