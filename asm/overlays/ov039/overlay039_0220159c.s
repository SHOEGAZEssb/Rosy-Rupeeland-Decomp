.text
/* Exact fallback; see overlay039_target_update.c for portable C. */
    .extern func_020adc40
    .global func_ov039_0220159c
func_ov039_0220159c:
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x48]
    ldr lr, [r0, #0x34]
    ldr r2, [r2, #0x8]
    ldr ip, [r0, #0xb4]
    ldr r4, [r2, #0x48]
    ldr r3, [r0, #0x30]
    ldr r2, [r0, #0xb0]
    ldr r0, [r4, #0x34]
    add ip, lr, ip
    sub lr, ip, r0
    ldr r0, [r4, #0x30]
    add r2, r3, r2
    sub r2, r2, r0
    smull r0, r3, r2, r2
    adds ip, r0, #0x800
    smull r2, r0, lr, lr
    adc r3, r3, #0x0
    adds r2, r2, #0x800
    mov ip, ip, lsr #0xc
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    orr r2, r2, r0, lsl #0x14
    add r0, ip, r2
    mov r4, r1
    bl func_020adc40
    sub r0, r0, #0x32000
    str r0, [r4, #0x0]
    cmp r0, #0x32000
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov039_0220159c, .-func_ov039_0220159c

