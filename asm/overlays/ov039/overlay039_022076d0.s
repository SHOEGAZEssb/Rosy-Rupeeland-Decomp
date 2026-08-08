.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_020adc40
    .extern data_ov039_022083fc
    .global func_ov039_022076d0
func_ov039_022076d0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r2, [r5, #0x48]
    mov r4, r1
    ldr r1, [r2, #0x34]
    ldr r0, [r2, #0x38]
    ldr r2, [r2, #0x30]
    sub r1, r1, r0
    ldmib r4, {r0, r6}
    sub r3, r2, r0
    smull r0, lr, r3, r3
    sub r1, r1, #0xf000
    sub r7, r1, r6
    adds r6, r0, #0x800
    smull ip, r0, r7, r7
    adc lr, lr, #0x0
    adds ip, ip, #0x800
    mov r6, r6, lsr #0xc
    ldr r3, L_022077b0
    adc r0, r0, #0x0
    mov ip, ip, lsr #0xc
    orr r6, r6, lr, lsl #0x14
    orr ip, ip, r0, lsl #0x14
    add r0, r6, ip
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    bl func_020adc40
    cmp r0, #0x10000
    movlt r0, #0x1
    blt L_022077a8
    ldr r0, [r5, #0x50]
    ldr r2, [r4, #0x8]
    ldr r3, [r0, #0x24]
    ldr r1, [r0, #0x20]
    ldr r0, [r4, #0x4]
    sub r4, r3, r2
    sub r1, r1, r0
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    cmp r0, #0x10000
    movlt r0, #0x1
    movge r0, #0x0
L_022077a8:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_022077b0: .word data_ov039_022083fc
    .size func_ov039_022076d0, .-func_ov039_022076d0

