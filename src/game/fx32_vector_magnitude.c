#include "tingle/types.h"

/*
 * Recovered two-component fixed-point magnitude helper. It submits a squared
 * 64-bit distance to the Nintendo DS square-root unit and rounds the result.
 */

/*
 * Inputs are two signed 20.12 fixed-point components. Compute
 * 4*(x*x + y*y), select the DS square-root unit's 64-bit mode through control
 * register 0x040002b0, write the operand at 0x040002b8/0x040002bc, and wait for
 * busy bit 0x8000 to clear. Return (hardware result + 1) arithmetic-shifted by
 * one, which yields the nearest raw magnitude in the original fixed-point
 * scale. Gameplay-scale fx32 inputs are required so the intermediate sum and
 * shift remain representable. No memory outside the square-root registers
 * changes. This routine directly drives and synchronously waits on Nintendo
 * DS math hardware.
 */
s32 Fx32Vector2_Magnitude(s32 x, s32 y)
{
    volatile u16 *sqrtControl = (volatile u16 *)0x040002b0;
    volatile u32 *sqrtResult = (volatile u32 *)0x040002b4;
    volatile u32 *sqrtOperandLow = (volatile u32 *)0x040002b8;
    volatile u32 *sqrtOperandHigh = (volatile u32 *)0x040002bc;
    s64 squared = (s64)x * x + (s64)y * y;
    u64 operand = (u64)squared << 2;

    *sqrtControl = 1;
    *sqrtOperandLow = (u32)operand;
    *sqrtOperandHigh = (u32)(operand >> 32);
    while ((*sqrtControl & 0x8000) != 0) {
    }
    return ((s32)*sqrtResult + 1) >> 1;
}
