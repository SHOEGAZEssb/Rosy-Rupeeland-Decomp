    .text
/* Exact fallback; see src/overlays/ov017/overlay017_effect_motion.c. */
    .extern gFx32CosSinTable
    .extern data_ov017_02201414
    .extern data_ov017_022016e0
    .extern PresentationScalar_SetImmediate
    .extern func_020adc90
    .extern func_020ae024
    .extern func_020befec
    .extern Overlay017_WaitForSquareRoot
.global Overlay017_UpdateEffectMotion
Overlay017_UpdateEffectMotion:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r2, [r10, #0xa8]
    ldr r1, [r10, #0x10]
    add r0, r10, #0xc
    add r1, r2, r1
    bl PresentationScalar_SetImmediate
    ldr r2, [r10, #0xb0]
    ldr r1, [r10, #0x30]
    add r0, r10, #0x2c
    add r1, r2, r1
    bl PresentationScalar_SetImmediate
    ldr r1, [r10, #0xa8]
    ldr r2, [r10, #0xdc]
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0xdc]
    ldr r1, [r10, #0xb0]
    ldr r2, [r10, #0xe4]
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0xe4]
    ldr r2, [r10, #0xa8]
    ldr r0, L_021fde2c
    mov r1, #0x0
    umull r4, r3, r2, r0
    adds r4, r4, #0x800
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adc r2, r3, #0x0
    mov r3, r4, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r10, #0xa8]
    ldr r3, [r10, #0xb0]
    ldr r2, L_021fde30
    umull r5, r4, r3, r0
    adds r5, r5, #0x800
    mla r4, r3, r1, r4
    mov r1, r3, asr #0x1f
    mla r4, r1, r0, r4
    adc r0, r4, #0x0
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r10, #0xb0]
    ldr r1, [r10, #0x30]
    ldr r3, [r10, #0x10]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r9, r0, asr #0xc
    mov r0, r3, asr #0xb
    add r0, r3, r0, lsr #0x14
    mul r1, r9, r9
    mov r8, r0, asr #0xc
    mla r1, r8, r8, r1
    ldr r4, [r2, #0xc]
    ldr r3, L_021fde34
    ldr r0, [r10, #0xa4]
    ldr r3, [r3, r4, lsl #0x2]
    sub r3, r3, r0
    mul r0, r3, r3
    cmp r1, r0
    ble L_021fdc44
    mov r0, r8
    mov r1, r9
    bl func_020ae024
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r1, L_021fde38
    mov r2, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldr r3, [r10, #0xb0]
    ldrsh r0, [r1, r0]
    ldr r1, [r10, #0xa8]
    smull r4, r3, r2, r3
    smull r6, r5, r0, r1
    adds r6, r6, #0x800
    adc r5, r5, #0x0
    adds r4, r4, #0x800
    mov r6, r6, lsr #0xc
    adc r3, r3, #0x0
    mov r4, r4, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    orr r4, r4, r3, lsl #0x14
    add r6, r6, r4
    smull r3, r4, r0, r6
    adds r5, r3, #0x800
    smull r3, r0, r2, r6
    adc r4, r4, #0x0
    adds r2, r3, #0x800
    mov r3, r5, lsr #0xc
    orr r3, r3, r4, lsl #0x14
    sub r3, r3, r1
    add r1, r1, r3, lsl #0x1
    str r1, [r10, #0xa8]
    adc r0, r0, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r10, #0xb0]
    orr r1, r1, r0, lsl #0x14
    sub r0, r1, r2
    add r0, r2, r0, lsl #0x1
    str r0, [r10, #0xb0]
    ldr r2, [r10, #0xa8]
    ldr r1, [r10, #0x10]
    add r0, r10, #0xc
    add r1, r2, r1
    bl PresentationScalar_SetImmediate
    ldr r2, [r10, #0xb0]
    ldr r1, [r10, #0x30]
    add r0, r10, #0x2c
    add r1, r2, r1
    bl PresentationScalar_SetImmediate
    b L_021fddb0
L_021fdc44:
    ldr r5, [r2, #0x78]
    mov r11, #0x1
    ldr r4, L_021fde3c
    b L_021fdd00
L_021fdc54:
    cmp r5, r10
    beq L_021fdcfc
    ldr r1, [r5, #0x30]
    ldr r2, [r5, #0x10]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    sub r7, r9, r0, asr #0xc
    mul r1, r7, r7
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    sub r6, r8, r0, asr #0xc
    mla r2, r6, r6, r1
    ldr r1, [r10, #0xa4]
    ldr r0, [r5, #0xa4]
    cmp r2, #0x0
    add r1, r1, r0
    ble L_021fdcfc
    mul r0, r1, r1
    cmp r2, r0
    bgt L_021fdcfc
    strh r11, [r4, #0x0]
    str r2, [r4, #0x8]
    mov r0, r2, asr #0x1f
    str r0, [r4, #0xc]
    bl Overlay017_WaitForSquareRoot
    str r0, [sp, #0x0]
    mov r1, r0
    mov r0, r6, lsl #0xc
    bl func_020befec
    mov r1, r0, asr #0x4
    add r1, r0, r1, lsr #0x1b
    ldr r2, [r10, #0xa8]
    mov r0, r7, lsl #0xc
    add r2, r2, r1, asr #0x5
    ldr r1, [sp, #0x0]
    str r2, [r10, #0xa8]
    bl func_020befec
    mov r1, r0, asr #0x4
    ldr r2, [r10, #0xb0]
    add r0, r0, r1, lsr #0x1b
    add r0, r2, r0, asr #0x5
    str r0, [r10, #0xb0]
L_021fdcfc:
    ldr r5, [r5, #0x8]
L_021fdd00:
    cmp r5, #0x0
    bne L_021fdc54
    ldr r0, L_021fde30
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    beq L_021fddb0
    ldr r1, [r0, #0x34]
    ldr r2, [r0, #0x30]
    sub r1, r9, r1
    mul r0, r1, r1
    sub r1, r8, r2
    mla r2, r1, r1, r0
    cmp r2, #0x900
    bgt L_021fddb0
    cmp r2, #0x0
    mov r4, #0x1
    ble L_021fdd60
    ldr r1, L_021fde3c
    mov r0, r2, asr #0x1f
    strh r4, [r1, #0x0]
    str r2, [r1, #0x8]
    str r0, [r1, #0xc]
    bl Overlay017_WaitForSquareRoot
    mov r4, r0
L_021fdd60:
    ldr r0, L_021fde30
    mov r1, r4
    ldr r0, [r0, #0x54]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r1, r0, asr #0x2
    ldr r2, [r10, #0xa8]
    add r0, r0, r1, lsr #0x1d
    add r1, r2, r0, asr #0x3
    ldr r0, L_021fde30
    str r1, [r10, #0xa8]
    ldr r0, [r0, #0x58]
    mov r1, r4
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r1, r0, asr #0x2
    ldr r2, [r10, #0xb0]
    add r0, r0, r1, lsr #0x1d
    add r0, r2, r0, asr #0x3
    str r0, [r10, #0xb0]
L_021fddb0:
    ldr r2, [r10, #0xb0]
    ldr r1, [r10, #0xa8]
    mul r0, r2, r2
    mla r0, r1, r1, r0
    ldr r1, L_021fde3c
    mov r2, #0x1
    strh r2, [r1, #0x0]
    str r0, [r1, #0x8]
    mov r0, r0, asr #0x1f
    str r0, [r1, #0xc]
    bl Overlay017_WaitForSquareRoot
    mov r1, r0
    cmp r1, #0x2000
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, #0x2000
    bl func_020adc90
    ldr r1, [r10, #0xa8]
    smull r3, r2, r1, r0
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r10, #0xa8]
    ldr r1, [r10, #0xb0]
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r10, #0xb0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fde2c: .word 0xfd7
L_021fde30: .word data_ov017_022016e0
L_021fde34: .word data_ov017_02201414
L_021fde38: .word gFx32CosSinTable
L_021fde3c: .word 0x40002b0

    .size Overlay017_UpdateEffectMotion, . - Overlay017_UpdateEffectMotion
