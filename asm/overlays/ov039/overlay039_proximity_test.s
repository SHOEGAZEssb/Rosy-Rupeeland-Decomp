.text
/* Exact fallback; see overlay039_proximity_resolution.c for portable C. */
    .extern func_020adc40

    .global func_ov039_021feda0
func_ov039_021feda0:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x98]
    ldr r3, [r1, #0x8]
    ldr r2, [r0, #0x24]
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x20]
    sub ip, r3, r2
    sub r1, r1, r0
    smull r0, r2, r1, r1
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
    .size func_ov039_021feda0, .-func_ov039_021feda0

