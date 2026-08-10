#include "tingle/software_canvas.h"

/*
 * Filled-rectangle rasterization for SoftwareCanvas. Coordinates are clipped
 * to the DS screen's 256x192 upper bounds and every covered pixel is delegated
 * to the raw unchecked write primitive.
 */

/*
 * Clamp negative x0/y0 to zero and x1/y1 above 256/192 to those limits, then
 * fill the half-open rectangle [x0,x1) by [y0,y1). Force color bit 15 on;
 * modify only the borrowed pixel buffer and return no value. Reversed or
 * otherwise empty intervals naturally draw nothing.
 */
#ifndef MATCHING
void SoftwareCanvas_FillRect(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color)
{
    s32 x;
    s32 y;
    u16 opaqueColor = color | 0x8000;

    if (x0 < 0)
        x0 = 0;
    if (y0 < 0)
        y0 = 0;
    if (x1 >= 256)
        x1 = 256;
    if (y1 >= 192)
        y1 = 192;

    for (y = y0; y < y1; ++y)
        for (x = x0; x < x1; ++x)
            SoftwareCanvas_SetPixel(self, x, y, opaqueColor);
}
#else
/* This matching form implements the documented portable C directly above. */
asm void SoftwareCanvas_FillRect(SoftwareCanvas *, s32, s32, s32, s32, u16)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r10, [sp, #0x24]
    movs r6, r1
    orr r1, r10, #0x8000
    mov r1, r1, lsl #16
    ldr r9, [sp, #0x20]
    mov r5, r2
    movmi r6, #0
    cmp r5, #0
    mov r4, r3
    movlt r5, #0
    cmp r4, #0x100
    movge r4, #0x100
    cmp r9, #0xc0
    mov r7, r0
    mov r10, r1, lsr #16
    movge r9, #0xc0
    b outer_test
outer:
    mov r8, r6
    b inner_test
inner:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, r10
    bl SoftwareCanvas_SetPixel
    add r8, r8, #1
inner_test:
    cmp r8, r4
    blt inner
    add r5, r5, #1
outer_test:
    cmp r5, r9
    blt outer
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
}
#endif
