#include "tingle/types.h"

/* Construct the recovered type-1 derived actor extension at offsets 0x230..0x2a8. */
extern u8 data_020df3c8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203b514(void *self);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02004fe0(void *vector);
extern void func_0204cca8(void *state, void *owner);
extern void func_0200b2c0(void *state, s32 first, s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * Run base constructor func_0203b514, install vtable data_020df3c8, and clear
 * the recovered extension state. Initialize vectors +0x238 to zero, +0x254 and
 * +0x284 through their value helpers; clear word +0x248, halfwords +0x24c..
 * +0x252, +0x266/+0x268, +0x280/+0x282, bytes +0x26b, +0x2a0/+0x2a1, words
 * +0x26c..+0x27c, and halfwords +0x296..+0x2a4. Halfword +0x294 and byte
 * +0x26a are set to -1. Construct owner state +0x2a8, set actor type +0x4d to
 * one, clear +0x230/+0x234/+0x236, clear flag 4 at +0xd0, set actor flag
 * 0x100000 at +0x14, reset state +0x254 with zeros, and clear halfword +0x264.
 * Return self; constructors and value helpers may manage SDK-owned state.
 */
void *func_02035060(void *self)
{
    u8 *actor = (u8 *)self;
    u32 offset;

    func_0203b514(actor);
    *(void **)actor = data_020df3c8;
    func_0200500c(actor + 0x238, 0, 0, 0);
    *(s32 *)(actor + 0x248) = 0;
    for (offset = 0x24c; offset <= 0x252; offset += 2)
        *(u16 *)(actor + offset) = 0;
    func_02004fe0(actor + 0x254);
    *(u16 *)(actor + 0x266) = 0;
    *(u16 *)(actor + 0x268) = 0;
    actor[0x26b] = 0;
    for (offset = 0x26c; offset <= 0x27c; offset += 4)
        *(u32 *)(actor + offset) = 0;
    *(u16 *)(actor + 0x280) = 0;
    *(u16 *)(actor + 0x282) = 0;
    func_02004fe0(actor + 0x284);
    *(s16 *)(actor + 0x294) = -1;
    for (offset = 0x296; offset <= 0x29e; offset += 2)
        *(u16 *)(actor + offset) = 0;
    actor[0x2a0] = 0;
    actor[0x2a1] = 0;
    *(u16 *)(actor + 0x2a2) = 0;
    *(u16 *)(actor + 0x2a4) = 0;
    func_0204cca8(actor + 0x2a8, actor);
    actor[0x4d] = 1;
    *(u32 *)(actor + 0x230) = 0;
    *(u16 *)(actor + 0x234) = 0;
    *(u16 *)(actor + 0x236) = 0;
    *(u32 *)(actor + 0xd0) &= ~4;
    *(u32 *)(actor + 0x14) |= 0x100000;
    func_0200b2c0(actor + 0x254, 0, 0, 0);
    *(u16 *)(actor + 0x264) = 0;
    actor[0x26a] = 0xff;
    return actor;
}
