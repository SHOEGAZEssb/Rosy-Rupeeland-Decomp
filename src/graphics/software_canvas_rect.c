#include "tingle/software_canvas.h"

/*
 * Rectangle-outline rasterization for SoftwareCanvas. This wrapper clips to
 * fixed DS screen limits and composes the recovered inclusive line primitive
 * for the four edges.
 */

#ifndef MATCHING
/*
 * Clamp negative x0/y0 and maxima at or beyond 256/192, force color bit 15,
 * and draw top, bottom, left, and right edges in that order. Shared corner
 * pixels are written more than once. Only the borrowed buffer changes and no
 * value is returned.
 */
void SoftwareCanvas_DrawRect(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color)
{
    u16 opaqueColor = color | 0x8000;

    if (x0 < 0)
        x0 = 0;
    if (y0 < 0)
        y0 = 0;
    if (x1 >= 256)
        x1 = 256;
    if (y1 >= 192)
        y1 = 192;

    SoftwareCanvas_DrawLine(self, x0, y0, x1, y0, opaqueColor);
    SoftwareCanvas_DrawLine(self, x0, y1, x1, y1, opaqueColor);
    SoftwareCanvas_DrawLine(self, x0, y0, x0, y1, opaqueColor);
    SoftwareCanvas_DrawLine(self, x1, y0, x1, y1, opaqueColor);
}
#else
/* This matching form implements the documented portable C directly above. */
asm void SoftwareCanvas_DrawRect(SoftwareCanvas *, s32, s32, s32, s32, u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #8
    ldr r5, [sp, #0x2c]
    movs r8, r1
    orr r1, r5, #0x8000
    mov r1, r1, lsl #16
    mov r9, r0
    mov r7, r2
    movmi r8, #0
    cmp r7, #0
    movlt r7, #0
    mov r6, r3
    mov r5, r1, lsr #16
    cmp r6, #0x100
    movge r6, #0x100
    ldr r4, [sp, #0x28]
    str r7, [sp]
    cmp r4, #0xc0
    movge r4, #0xc0
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str r5, [sp, #4]
    bl SoftwareCanvas_DrawLine
    stmia sp, {r4, r5}
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, r6
    bl SoftwareCanvas_DrawLine
    stmia sp, {r4, r5}
    mov r0, r9
    mov r1, r8
    mov r3, r8
    mov r2, r7
    bl SoftwareCanvas_DrawLine
    mov r0, r9
    mov r2, r7
    mov r1, r6
    mov r3, r6
    stmia sp, {r4, r5}
    bl SoftwareCanvas_DrawLine
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
}
#endif
