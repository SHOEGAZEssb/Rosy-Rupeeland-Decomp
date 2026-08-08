.text
/* Exact fallback; see overlay039_target_update.c for portable C. */
    .extern func_020adc40
    .global func_ov039_02201530
func_ov039_02201530:
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x34]
    ldr r3, [r0, #0xb4]
    ldr r2, [r0, #0x30]
    ldr r0, [r0, #0xb0]
    ldr lr, [r1, #0x8]
    ldr r1, [r1, #0x4]
    add r0, r2, r0
    sub r1, r1, r0
    smull r0, r2, r1, r1
    add r3, ip, r3
    sub ip, lr, r3
    adds r3, r0, #0x800
    smull r1, r0, ip, ip
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    cmp r0, #0x32000
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_ov039_02201530, .-func_ov039_02201530

