.text

/* Exact fallback; see src/overlays/ov028/overlay028_scanline_palette.c. */
.extern data_ov028_021ff174
.extern data_ov028_021ff300
.extern func_020918f4
.extern Presentation_InterpolateLinear
.extern func_020b44e8
.extern func_020b4554
.extern func_ov028_021fce28
.extern genrand_int32

    .global func_ov028_021fce00
func_ov028_021fce00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x18]
    bl genrand_int32
    str r0, [r4, #0x18]
    mov r0, r4
    bl func_ov028_021fce28
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov028_021fce00, .-func_ov028_021fce00
    .global func_ov028_021fce28
func_ov028_021fce28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x0]
    add r0, r4, #0x18
    mov r1, #0x100
    bl func_020918f4
    str r0, [r4, #0x4]
    add r0, r4, #0x18
    mov r1, #0x40
    bl func_020918f4
    ldr r2, [r4, #0x4]
    mov r1, #0x100
    add r2, r2, #0x60
    add r0, r2, r0
    str r0, [r4, #0x8]
    add r0, r4, #0x18
    bl func_020918f4
    str r0, [r4, #0x10]
    add r0, r4, #0x18
    mov r1, #0x40
    bl func_020918f4
    ldr r1, [r4, #0x10]
    add r1, r1, #0x60
    add r0, r1, r0
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov028_021fce28, .-func_ov028_021fce28
    .global func_ov028_021fce94
func_ov028_021fce94:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, L_021fcf20
    ldrh r5, [r2, #0x0]
    cmp r5, #0xc0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r6, [r0, #0x0]
    ldr ip, L_021fcf24
    rsb r1, r6, #0x0
    add r3, r5, r1, lsr #0x2
    ldr r1, L_021fcf28
    and lr, r3, #0x1f
    ldr r3, [r0, #0x10]
    ldr r4, [r0, #0x4]
    ldr lr, [r1, lr, lsl #0x2]
    add r5, r5, r6, lsr #0x2
    add r4, r4, lr
    and r5, r5, #0x1f
    add lr, r3, r6, lsr #0x2
    mov r3, ip, lsl #0x10
    and r4, r4, ip
    and r3, r3, lr, lsl #0x10
    ldr lr, [r0, #0x8]
    orr r3, r4, r3
    str r3, [r2, #0x12]
    ldr r3, [r1, r5, lsl #0x2]
    ldr r1, [r0, #0x14]
    ldr r0, [r0, #0x0]
    add r3, lr, r3
    sub r1, r1, r0, lsr #0x2
    mov r0, ip, lsl #0x10
    and r3, r3, ip
    and r0, r0, r1, lsl #0x10
    orr r0, r3, r0
    str r0, [r2, #0x16]
    ldmia sp!, {r4, r5, r6, pc}
L_021fcf20: .word 0x4000006
L_021fcf24: .word 0x1ff
L_021fcf28: .word data_ov028_021ff174
.size func_ov028_021fce94, .-func_ov028_021fce94
    .global func_ov028_021fcf2c
func_ov028_021fcf2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r4, L_021fcff0
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r7, #0x0
    mov r11, #0x10
L_021fcf48:
    mov r1, r7, lsl #0x1
    ldrh r0, [r10, r1]
    ldrh r1, [r9, r1]
    mov r2, r11
    mov r3, r8
    and r0, r0, #0x1f
    and r1, r1, #0x1f
    bl Presentation_InterpolateLinear
    mov r1, r7, lsl #0x1
    ldrh r2, [r10, r1]
    ldrh r1, [r9, r1]
    mov r6, r0
    mov r0, r2, asr #0x5
    mov r1, r1, asr #0x5
    and r0, r0, #0x1f
    and r1, r1, #0x1f
    mov r2, #0x10
    mov r3, r8
    bl Presentation_InterpolateLinear
    mov r1, r7, lsl #0x1
    mov r5, r0
    ldrh r0, [r10, r1]
    ldrh r1, [r9, r1]
    mov r2, #0x10
    mov r0, r0, asr #0xa
    mov r1, r1, asr #0xa
    and r0, r0, #0x1f
    and r1, r1, #0x1f
    mov r3, r8
    bl Presentation_InterpolateLinear
    orr r1, r6, r5, lsl #0x5
    orr r1, r1, r0, lsl #0xa
    mov r0, r7, lsl #0x1
    add r7, r7, #0x1
    strh r1, [r4, r0]
    cmp r7, #0x10
    blt L_021fcf48
    mov r0, r4
    mov r1, #0x20
    bl func_020b4554
    bl func_020b44e8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fcff0: .word data_ov028_021ff300
.size func_ov028_021fcf2c, .-func_ov028_021fcf2c
    .global func_ov028_021fcff4
func_ov028_021fcff4:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    strh r1, [r0, #0xa]
    strh r1, [r0, #0x8]
    bx lr
.size func_ov028_021fcff4, .-func_ov028_021fcff4

