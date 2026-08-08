.text
/* Exact fallback; see overlay039_mode_score.c for portable C. */
    .extern func_020c10d4
    .extern func_02004fe0
    .extern func_020050a4
    .extern func_02005058
    .extern func_020be334
    .extern func_020adc90

    .global func_ov039_021ff458
func_ov039_021ff458:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    mov r9, r1
    add r0, sp, #0x10
    mov r1, #0xc
    bl func_020c10d4
    add r0, sp, #0x0
    bl func_02004fe0
    mov r7, #0x0
    add r5, sp, #0x10
    mov r4, #0xe000
    mov r11, r7
L_021ff48c:
    add r1, r10, r7, lsl #0x2
    ldr r1, [r1, #0x74]
    add r0, sp, #0x0
    add r1, r1, #0x1c
    bl func_020050a4
    ldr r0, [sp, #0x4]
    ldmib r9, {r1, r2}
    sub r0, r1, r0
    ldr r1, [sp, #0x8]
    sub r6, r2, r1
    bl func_020be334
    rsb r0, r0, #0x48000
    mov r1, #0x48000
    bl func_020adc90
    mov r8, r0
    mov r0, r6
    bl func_020be334
    rsb r0, r0, #0x30000
    mov r1, #0x30000
    bl func_020adc90
    cmp r8, #0x0
    movlt r8, #0x0
    cmp r0, #0x0
    movlt r0, #0x0
    smull r2, r1, r8, r0
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    mov r0, #0x0
    umull r6, r3, r2, r4
    mla r3, r2, r0, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r4, r3
    mov r0, #0x800
    adds r1, r6, r0
    adc r0, r3, r11
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r5, r7, lsl #0x2]
    add r7, r7, #0x1
    cmp r7, #0x2
    blt L_021ff48c
    ldr r1, [r10, #0x7c]
    add r0, sp, #0x0
    add r1, r1, #0x1c
    bl func_020050a4
    ldr r3, [r9, #0x4]
    ldr r0, [sp, #0x4]
    ldr r2, [r9, #0x8]
    ldr r1, [sp, #0x8]
    sub r0, r3, r0
    sub r5, r2, r1
    bl func_020be334
    rsb r0, r0, #0x48000
    mov r1, #0x48000
    bl func_020adc90
    mov r4, r0
    mov r0, r5
    bl func_020be334
    rsb r0, r0, #0x50000
    mov r1, #0x50000
    bl func_020adc90
    cmp r4, #0x0
    movlt r4, #0x0
    cmp r0, #0x0
    movlt r0, #0x0
    smull r1, r0, r4, r0
    adds r1, r1, #0x800
    mov r2, r1, lsr #0xc
    adc r0, r0, #0x0
    orr r2, r2, r0, lsl #0x14
    mov r0, #0xe000
    mov r1, #0x0
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r4, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r4, [sp, #0x10]
    ldr r0, [sp, #0x14]
    str r1, [sp, #0x18]
    cmp r4, r0
    movlt r4, r0
    ldr r0, [sp, #0x18]
    cmp r4, r0
    movlt r4, r0
    add r0, sp, #0x0
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov039_021ff458, .-func_ov039_021ff458

