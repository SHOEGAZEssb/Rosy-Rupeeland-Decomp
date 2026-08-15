.text

/* Exact fallback; see src/overlays/ov034/overlay034_gx_strip.c for documented portable C. */

    .extern Presentation_InterpolateLinear
    .extern func_ov034_021fd2b8
    .extern func_ov034_021fd2ec
    .extern data_ov034_021fe788

    .global func_ov034_021fd030
func_ov034_021fd030:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r3, L_021fd29c
    mov r1, #0x0
    mov r7, r0
    str r1, [r3, #0x0]
    ldmib r7, {r0, r1, r2}
    str r0, [r3, #0x2c]
    str r1, [r3, #0x2c]
    str r2, [r3, #0x2c]
    ldr r4, [r7, #0x1c]
    mov r0, r4, lsl #0x10
    mov r3, r0, lsr #0xc
    mov r1, r4, lsr #0x1f
    mov r2, r3, asr #0xf
    rsb r0, r1, r4, lsl #0x14
    add r0, r1, r0, ror #0x14
    add r2, r3, r2, lsr #0x10
    mov r1, r2, asr #0x10
    add r4, r1, #0x1
    cmp r4, #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r2, [r7, #0x0]
    ldr r1, L_021fd2a0
    subge r4, r4, #0x10
    add r1, r1, r2, lsl #0x6
    ldr r5, [r1, r4, lsl #0x2]
    mov r0, #0x0
    mov r1, #0x1e0
    mov r2, #0x1000
    mov r5, r5, lsl #0x12
    bl Presentation_InterpolateLinear
    rsb r0, r0, #0x1e0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    ldr r6, L_021fd2a4
    mov r2, r0, lsl #0x10
    mov r0, r5
    str r1, [r6, #0x0]
    rsb r3, r1, #0x8000
    str r3, [r6, #-0x80]
    mov r1, #0x0
    mov r6, r2, asr #0x10
    bl func_ov034_021fd2b8
    mov r0, #0x200
    rsb r0, r0, #0x0
    mov r1, #0x1e0
    mov r2, #0x0
    bl func_ov034_021fd2ec
    add r0, r5, #0x40000
    mov r1, #0x0
    bl func_ov034_021fd2b8
    ldr r2, L_021fd2a8
    ldr r1, L_021fd2ac
    add r0, r5, #0x40000
    str r2, [r1, #0x0]
    mov r1, #0x20000
    bl func_ov034_021fd2b8
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r5
    mov r5, r1, lsl #0x10
    ldr r2, L_021fd2ac
    orr r3, r5, #0x200
    mov r1, #0x20000
    str r3, [r2, #0x0]
    bl func_ov034_021fd2b8
    subs r4, r4, #0x1
    ldr r0, L_021fd2ac
    orr r1, r5, #0xfe00
    str r1, [r0, #0x0]
    addmi r4, r4, #0x10
    ldr r2, [r7, #0x0]
    ldr r1, L_021fd2a0
    sub r0, r6, #0x1e0
    add r1, r1, r2, lsl #0x6
    ldr r1, [r1, r4, lsl #0x2]
    mov r2, r0, lsl #0x10
    mov r5, r1, lsl #0x12
    mov r8, r6
    mov r0, r5
    mov r1, #0x0
    mov r6, r2, asr #0x10
    bl func_ov034_021fd2b8
    mov r0, #0x200
    mov r1, r8
    rsb r0, r0, #0x0
    mov r2, #0x0
    bl func_ov034_021fd2ec
    add r0, r5, #0x40000
    mov r1, #0x0
    bl func_ov034_021fd2b8
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r2, r0, #0x200
    ldr r1, L_021fd2ac
    add r0, r5, #0x40000
    str r2, [r1, #0x0]
    mov r1, #0x20000
    bl func_ov034_021fd2b8
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r8, r1, lsl #0x10
    mov r0, r5
    ldr r2, L_021fd2ac
    orr r5, r8, #0x200
    mov r1, #0x20000
    str r5, [r2, #0x0]
    bl func_ov034_021fd2b8
    subs r4, r4, #0x1
    ldr r0, L_021fd2ac
    orr r1, r8, #0xfe00
    str r1, [r0, #0x0]
    ldr r1, [r7, #0x0]
    ldr r0, L_021fd2a0
    addmi r4, r4, #0x10
    add r0, r0, r1, lsl #0x6
    ldr r0, [r0, r4, lsl #0x2]
    mov r1, #0x0
    cmp r0, #0x2
    movlt r4, r0, lsl #0x12
    addlt r7, r4, #0x40000
    movge r7, #0x0
    movge r4, r7
    mov r0, r4
    bl func_ov034_021fd2b8
    mov r0, #0x200
    mov r1, r6
    rsb r0, r0, #0x0
    mov r2, #0x0
    bl func_ov034_021fd2ec
    mov r0, r7
    mov r1, #0x0
    bl func_ov034_021fd2b8
    ldr r2, L_021fd2ac
    mov r0, r7
    mov r1, #0x20000
    str r5, [r2, #0x0]
    bl func_ov034_021fd2b8
    ldr r3, L_021fd2b0
    ldr r2, L_021fd2ac
    mov r0, r4
    mov r1, #0x20000
    str r3, [r2, #0x0]
    bl func_ov034_021fd2b8
    ldr r2, L_021fd2b4
    ldr r1, L_021fd2ac
    mov r0, #0x0
    str r2, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd29c: .word 0x4000444
L_021fd2a0: .word data_ov034_021fe788
L_021fd2a4: .word 0x4000500
L_021fd2a8: .word 0x1e00200
L_021fd2ac: .word 0x4000494
L_021fd2b0: .word 0xfe200200
L_021fd2b4: .word 0xfe20fe00
.size func_ov034_021fd030, .-func_ov034_021fd030
