    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_init.c. */
    .extern func_020add34
.global func_ov017_021fce00
func_ov017_021fce00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r9, r1
    mov r9, r9, lsl #0x4
    mul r1, r9, r9
    str r1, [sp, #0x4]
    mov r10, r0
    mov r6, r9, asr #0x1f
    mov r5, #0x0
L_021fce24:
    sub r0, r5, #0x4
    mul r3, r0, r9
    mov r1, #0x6c
    mov r2, #0x24
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    mov r4, r0, lsl #0x1
    rsb r0, r4, #0x0
    mla r7, r5, r1, r10
    mla r11, r5, r2, r10
    str r0, [sp, #0x0]
    mov r8, #0x0
L_021fce58:
    mov r0, #0xc
    mla r0, r8, r0, r7
    mov r1, #0x0
    str r1, [r0, #0x148]
    str r1, [r0, #0x8e4]
    str r1, [r0, #0x8dc]
    str r1, [r11, r8, lsl #0x2]
    ldr r1, L_021fcf68
    str r1, [r0, #0x8e0]
    mov r0, #0x0
    str r0, [sp, #0xc]
    sub r0, r8, #0x4
    mul r1, r0, r9
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    movs r2, r0, lsl #0x1
    str r2, [sp, #0x8]
    rsbmi r2, r2, #0x0
    cmp r4, #0x0
    ldrlt r1, [sp, #0x0]
    str r4, [sp, #0x10]
    movge r1, r4
    mul r0, r1, r1
    mla r1, r2, r2, r0
    ldr r0, [sp, #0x4]
    cmp r1, r0
    ble L_021fcf2c
    add r0, sp, #0x8
    mov r1, r0
    bl func_020add34
    ldr r3, [sp, #0x8]
    ldr r1, [sp, #0x10]
    mov r2, r3, asr #0x1f
    umull lr, ip, r9, r3
    mla ip, r9, r2, ip
    adds r2, lr, #0x800
    mla ip, r6, r3, ip
    adc r3, ip, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    str r2, [sp, #0x8]
    mov r0, r1, asr #0x1f
    umull r3, r2, r9, r1
    mla r2, r9, r0, r2
    mla r2, r6, r1, r2
    mov r0, #0x800
    adds r1, r3, r0
    mov r0, #0x0
    adc r0, r2, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x10]
L_021fcf2c:
    mov r0, #0xc
    mla r1, r8, r0, r7
    ldr r0, [sp, #0x8]
    add r8, r8, #0x1
    str r0, [r1, #0x144]
    ldr r0, [sp, #0x10]
    cmp r8, #0x8
    str r0, [r1, #0x14c]
    ble L_021fce58
    add r5, r5, #0x1
    cmp r5, #0x8
    ble L_021fce24
    mov r0, r10
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fcf68: .word 0xfff
    .size func_ov017_021fce00, . - func_ov017_021fce00

