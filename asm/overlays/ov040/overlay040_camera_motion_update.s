.text
/* Exact fallback; see overlay040_motion_update.c for portable C. */
    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov040_021fd724
    .extern __register_global_object
    .extern data_ov040_02207dc0
    .extern data_ov040_02207e10
    .extern func_ov040_021fd740
    .extern data_ov040_02207dd4

    .global func_ov040_022009e8
func_ov040_022009e8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r4, [r6, #0x98]
    ldr r5, [r6, #0x9c]
    smull r0, r2, r4, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r5
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r7, r0
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    ldr r0, .L_02200be0
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_02200a7c
    ldr r0, .L_02200be4
    bl func_ov040_021fd724
    ldr r0, .L_02200be4
    ldr r1, .L_02200be8
    ldr r2, .L_02200bec
    bl __register_global_object
    ldr r0, .L_02200be0
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_02200a7c:
    ldr r0, .L_02200be0
    ldr r2, [r6, #0x98]
    ldr r1, [r0, #0x54]
    ldr r3, [r6, #0x8bc]
    sub r1, r2, r1
    ldr r4, [r6, #0x9c]
    ldr r2, [r0, #0x58]
    sub r1, r3, r1, asr #0x4
    str r1, [r6, #0x8bc]
    ldr r1, [r6, #0x8c0]
    sub r2, r4, r2
    sub r1, r1, r2, asr #0x4
    str r1, [r6, #0x8c0]
    ldr r1, [r6, #0x98]
    str r1, [r0, #0x54]
    ldr r1, [r6, #0x9c]
    str r1, [r0, #0x58]
    ldr r0, [r6, #0x8c0]
    add r0, r0, #0x85
    add r3, r0, #0x300
    str r3, [r6, #0x8c0]
    ldr r0, [r6, #0x890]
    ldr r2, [r6, #0x88c]
    ldr r1, [r6, #0x8bc]
    add r5, r0, r3
    add r4, r2, r1
    smull r0, r2, r4, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r5
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r8, r0
    mov r0, r4
    mov r1, r8
    bl func_020adc90
    mov r7, r0
    mov r0, r5
    mov r1, r8
    bl func_020adc90
    cmp r8, #0x2f000
    movge r1, #0x2f
    mulge r4, r7, r1
    mulge r5, r0, r1
    str r4, [r6, #0x88c]
    str r5, [r6, #0x890]
    ldr r2, [r6, #0x88c]
    ldr r1, [r6, #0x1f8]
    ldr r0, .L_02200bf0
    sub r1, r2, r1
    str r1, [r6, #0x8bc]
    ldr r3, [r6, #0x890]
    ldr r2, [r6, #0x1fc]
    mov r1, #0x0
    sub r2, r3, r2
    str r2, [r6, #0x8c0]
    ldr r3, [r6, #0x8bc]
    mov r2, #0xa000
    umull r5, r4, r3, r0
    mla r4, r3, r1, r4
    mov r3, r3, asr #0x1f
    mla r4, r3, r0, r4
    adds r5, r5, #0x800
    adc r3, r4, #0x0
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r6, #0x8bc]
    ldr r3, [r6, #0x8c0]
    umull r5, r4, r3, r0
    mla r4, r3, r1, r4
    mov r1, r3, asr #0x1f
    mla r4, r1, r0, r4
    adds r5, r5, #0x800
    adc r0, r4, #0x0
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x8c0]
    ldr r0, [r6, #0x88c]
    str r0, [r6, #0x1f8]
    ldr r0, [r6, #0x890]
    str r0, [r6, #0x1fc]
    str r2, [r6, #0x200]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02200be0: .word data_ov040_02207dc0
.L_02200be4: .word data_ov040_02207e10
.L_02200be8: .word func_ov040_021fd740
.L_02200bec: .word data_ov040_02207dd4
.L_02200bf0: .word 0xfd7
    .size func_ov040_022009e8, .-func_ov040_022009e8

