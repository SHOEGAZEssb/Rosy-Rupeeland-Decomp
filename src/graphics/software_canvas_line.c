#include "tingle/software_canvas.h"

/*
 * Fixed-point line rasterization for SoftwareCanvas. The routine uses a DDA
 * step count based on the larger axis delta and delegates each plotted sample
 * to the recovered raw pixel primitive.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020be334(s32 value);
extern s32 func_020befec(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Draw from (x0,y0) through (x1,y1), including both endpoints. Coordinates
 * advance in 20.12 fixed point for max(abs(dx),abs(dy)) steps; color bit 15 is
 * forced on before every unchecked pixel write. The borrowed pixel buffer is
 * modified, no value is returned, and no graphics hardware is accessed.
 */
#ifndef MATCHING
void func_02005dfc(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color)
{
    s32 dx = x1 - x0;
    s32 dy = y1 - y0;
    s32 dxFx = dx << 12;
    s32 dyFx = dy << 12;
    s32 xFx = x0 << 12;
    s32 yFx = y0 << 12;
    s32 steps;
    s32 xStep;
    s32 yStep;
    s32 i;
    u16 opaqueColor = color | 0x8000;

    if (func_020be334(dyFx) < func_020be334(dxFx))
        steps = func_020be334(dx);
    else
        steps = func_020be334(dy);

    xStep = func_020befec(dxFx, steps);
    yStep = func_020befec(dyFx, steps);

    for (i = 0; i <= steps; ++i) {
        func_02005de0(self, xFx >> 12, yFx >> 12, opaqueColor);
        xFx += xStep;
        yFx += yStep;
    }
}
#else
/* This matching form implements the documented portable C directly above. */
asm void func_02005dfc(SoftwareCanvas *, s32, s32, s32, s32, u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r4, [sp, #0x28]
    ldr r10, [sp, #0x2c]
    sub r4, r4, r2
    orr r5, r10, #0x8000
    sub r6, r3, r1
    mov r3, r5, lsl #16
    mov r5, r4, lsl #12
    mov r11, r0
    mov r0, r5
    mov r4, r6, lsl #12
    mov r10, r3, lsr #16
    mov r6, r1, lsl #12
    mov r7, r2, lsl #12
    bl func_020be334
    mov r8, r0
    mov r0, r4
    bl func_020be334
    cmp r0, r8
    ble use_y
    mov r0, r4, asr #12
    bl func_020be334
    b have_steps
use_y:
    mov r0, r5, asr #12
    bl func_020be334
have_steps:
    mov r8, r0
    mov r0, r4
    mov r1, r8
    bl func_020befec
    mov r4, r0
    mov r0, r5
    mov r1, r8
    bl func_020befec
    mov r5, r0
    mov r9, #0
    b test
loop:
    mov r0, r11
    mov r3, r10
    mov r1, r6, asr #12
    mov r2, r7, asr #12
    bl func_02005de0
    add r9, r9, #1
    add r6, r6, r4
    add r7, r7, r5
test:
    cmp r9, r8
    ble loop
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif
