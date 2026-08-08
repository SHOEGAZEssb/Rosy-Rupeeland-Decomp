#include "tingle/types.h"

/* Overlay 34 packed GX vertex/texture emission and state activation helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

/*
 * Quantizes the low fixed-point portions of `x` and `y`, packs them into the
 * two 16-bit halves expected by GX VTX_XY, and writes register 0x04000488.
 * Returns no value and directly emits one vertex-coordinate command via MMIO.
 */
extern "C" void func_ov034_021fd2b8(s32 x, s32 y)
{
    s16 packedX = (s16)(x << 8);
    s16 packedY = (s16)(y << 8);
    REG32(0x04000488) = (u16)packedX | ((u32)(u16)packedY << 16);
}

/*
 * Writes packed low 16-bit `x`/`y` followed by low 16-bit `z` to the GX vertex
 * FIFO register at 0x0400048C. Returns no value and directly emits a three-axis
 * vertex command through MMIO.
 */
extern "C" void func_ov034_021fd2ec(s32 x, s32 y, s32 z)
{
    REG32(0x0400048c) = (u16)x | ((u32)(u16)y << 16);
    REG32(0x0400048c) = (u16)z;
}

/*
 * Ensures state +0x20 is nonzero by changing only zero to one. It returns no
 * value and performs no SDK or direct hardware operation.
 */
extern "C" void func_ov034_021fd31c(void *state)
{
    if (FIELD(s32, state, 0x20) == 0)
        FIELD(s32, state, 0x20) = 1;
}
