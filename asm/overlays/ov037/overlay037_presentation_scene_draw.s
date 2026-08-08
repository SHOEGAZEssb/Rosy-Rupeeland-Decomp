.text

/* Exact fallback; see src/overlays/ov037/overlay037_presentation_scene_draw.c for documented portable C. */

    .extern func_ov043_0220b9bc
    .extern func_020b0558
    .extern func_ov048_0220bad4

    .global func_ov037_021fe81c
func_ov037_021fe81c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x5c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    mov r5, r0
    add r0, r4, #0x94
    bl func_ov043_0220b9bc ; func_ov048_0220b9bc
    cmp r0, #0x1
    subeq r5, r5, #0x7e
    subeq r5, r5, #0x400
    bl func_020b0558
    ldr r2, L_021fe8a4
    ldr r0, L_021fe8a8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #-0x7c]
    ldr r0, [r4, #0x5c]
    str r1, [r0, #0x94]
    str r5, [r0, #0x98]
    ldr r0, [r4, #0x5c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r2, L_021fe8ac
    mov r0, #0x1
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x94
    str r1, [r2, #0xf8]
    bl func_ov048_0220bad4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe8a4: .word 0x7fff
L_021fe8a8: .word 0x40004c0
L_021fe8ac: .word 0x4000448
    .size func_ov037_021fe81c, .-func_ov037_021fe81c

    .global func_ov037_021fe8b0
func_ov037_021fe8b0:
    ldr r0, L_021fe8b8
    bx lr
L_021fe8b8: .word 0x47e
    .size func_ov037_021fe8b0, .-func_ov037_021fe8b0
