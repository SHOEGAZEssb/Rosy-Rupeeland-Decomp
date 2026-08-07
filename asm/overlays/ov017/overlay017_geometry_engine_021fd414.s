    .text

/* Exact fallback; see src/overlays/ov017/overlay017_geometry_engine.c. */
    .extern func_ov017_021fd60c
    .extern func_ov017_021fd638
    .extern func_ov017_021fd64c
    .extern func_ov017_021fd680
.global func_ov017_021fd414
func_ov017_021fd414:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r1, #0x18
    mov r4, r0
    str r1, [sp, #0x0]
    mov r1, #0x0
    mov r0, #0x1
    mov r2, #0x2
    mov r3, #0x8
    str r1, [sp, #0x4]
    bl func_ov017_021fd60c
    bl func_ov017_021fd638
    mov r5, #0x0
L_021fd448:
    mov r1, #0x6c
    add r2, r5, #0x1
    mul r7, r5, r1
    mul r3, r2, r1
    add r0, r4, #0xdc
    add r6, r0, #0x800
    add r0, r6, r7
    add r1, r4, #0x144
    str r0, [sp, #0xc]
    add r0, r6, r3
    add r11, r1, r7
    str r0, [sp, #0x8]
    add r6, r1, r3
    mov r7, #0x0
L_021fd480:
    mov r0, #0xc
    mul r8, r7, r0
    ldr r0, L_021fd608
    mov r1, #0x2
    str r1, [r0, #0x0]
    ldr r0, [sp, #0x8]
    add r9, r0, r8
    ldr r0, [r0, r8]
    ldr r1, [r9, #0x4]
    ldr r2, [r9, #0x8]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd64c
    add r10, r6, r8
    ldmia r10, {r0, r1, r2}
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd680
    ldr r0, [r9, #0xc]
    ldr r1, [r9, #0x10]
    ldr r2, [r9, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd64c
    ldr r0, [r10, #0xc]
    ldr r1, [r10, #0x10]
    ldr r2, [r10, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd680
    ldr r0, [sp, #0xc]
    add r9, r0, r8
    ldr r0, [r0, r8]
    ldr r1, [r9, #0x4]
    ldr r2, [r9, #0x8]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd64c
    add r10, r11, r8
    ldmia r10, {r0, r1, r2}
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd680
    ldr r0, [r9, #0xc]
    ldr r1, [r9, #0x10]
    ldr r2, [r9, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd64c
    ldr r0, [r10, #0xc]
    ldr r1, [r10, #0x10]
    ldr r2, [r10, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov017_021fd680
    add r7, r7, #0x1
    ldr r0, L_021fd608
    mov r1, #0x0
    str r1, [r0, #0x4]
    cmp r7, #0x8
    blt L_021fd480
    add r5, r5, #0x1
    cmp r5, #0x8
    blt L_021fd448
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd608: .word 0x4000500
    .size func_ov017_021fd414, . - func_ov017_021fd414

