    .text
/* Exact fallback; see src/overlays/ov017/overlay017_effect_phase.c. */
    .extern data_ov017_022016e0
    .extern Presentation_InterpolateLinear
    .extern PresentationScalar_SetImmediate
    .extern func_020adc90
    .extern Overlay017_WaitForSquareRoot
    .extern Overlay017_UpdateEffectMotion
    .extern Overlay017_UpdateEffectTransform
    .extern Overlay017_AdvanceEffectProgress
    .extern Overlay017_HasEffectCompleted
.global Overlay017_UpdateEffectPhase
Overlay017_UpdateEffectPhase:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xb4]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_021fe09c
L_021fde58: ; jump table
    b L_021fde74 ; case 0
    b L_021fde9c ; case 1
    b L_021fdee0 ; case 2
    b L_021fdf04 ; case 3
    b L_021fdf80 ; case 4
    b L_021fdfdc ; case 5
    b L_021fe09c ; case 6
L_021fde74:
    ldr r0, [r6, #0xb8]
    add r1, r0, #0x1
    str r1, [r6, #0xb8]
    ldrh r0, [r6, #0xa0]
    cmp r1, r0
    movgt r0, #0x1
    strgt r0, [r6, #0xb4]
    movgt r0, #0x0
    strgt r0, [r6, #0xb8]
    b L_021fe09c
L_021fde9c:
    ldr r0, [r6, #0xb8]
    add r3, r0, #0x1
    cmp r3, #0x1e
    str r3, [r6, #0xb8]
    movgt r0, #0x2
    strgt r0, [r6, #0xb4]
    movgt r0, #0x0
    strgt r0, [r6, #0xb8]
    bgt L_021fe09c
    mov r0, #0x200000
    mov r1, #0x0
    mov r2, #0x1e
    bl Presentation_InterpolateLinear
    mov r1, r0
    add r0, r6, #0x1c
    bl PresentationScalar_SetImmediate
    b L_021fe09c
L_021fdee0:
    ldr r0, L_021fe0ac
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    ldreq r1, [r0, #0x14]
    streq r1, [r0, #0x10]
    mov r0, #0x3
    str r0, [r6, #0xb4]
    mov r0, #0x0
    str r0, [r6, #0xb8]
L_021fdf04:
    ldr r0, [r6, #0xb8]
    add r3, r0, #0x1
    str r3, [r6, #0xb8]
    cmp r3, #0x8
    ble L_021fdf58
    mov r1, #0x10000
    add r0, r6, #0x1c
    rsb r1, r1, #0x0
    bl PresentationScalar_SetImmediate
    mov r0, r6
    bl Overlay017_HasEffectCompleted
    cmp r0, #0x0
    movne r0, #0x6
    strne r0, [r6, #0xb4]
    movne r0, #0x0
    strne r0, [r6, #0xb8]
    moveq r0, #0x4
    streq r0, [r6, #0xb4]
    moveq r0, #0x0
    streq r0, [r6, #0xb8]
    b L_021fdf74
L_021fdf58:
    mov r0, #0x0
    sub r1, r0, #0x10000
    mov r2, #0x8
    bl Presentation_InterpolateLinear
    mov r1, r0
    add r0, r6, #0x1c
    bl PresentationScalar_SetImmediate
L_021fdf74:
    mov r0, r6
    bl Overlay017_UpdateEffectMotion
    b L_021fe09c
L_021fdf80:
    ldr r0, [r6, #0xb8]
    mov r1, #0x0
    add r3, r0, #0x1
    str r3, [r6, #0xb8]
    cmp r3, #0x14
    ble L_021fdfb4
    add r0, r6, #0x1c
    bl PresentationScalar_SetImmediate
    mov r0, #0x5
    str r0, [r6, #0xb4]
    mov r0, #0x0
    str r0, [r6, #0xb8]
    b L_021fdfd0
L_021fdfb4:
    mov r0, #0x10000
    rsb r0, r0, #0x0
    mov r2, #0x14
    bl Presentation_InterpolateLinear
    mov r1, r0
    add r0, r6, #0x1c
    bl PresentationScalar_SetImmediate
L_021fdfd0:
    mov r0, r6
    bl Overlay017_UpdateEffectMotion
    b L_021fe09c
L_021fdfdc:
    ldr r1, L_021fe0ac
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq L_021fe094
    ldr r3, [r6, #0x30]
    ldr r4, [r6, #0x10]
    mov r0, r3, asr #0xb
    ldr r2, [r1, #0x34]
    add r0, r3, r0, lsr #0x14
    rsb r5, r2, r0, asr #0xc
    mul r3, r5, r5
    mov r0, r4, asr #0xb
    ldr r2, [r6, #0xa4]
    ldr r1, [r1, #0x30]
    add r0, r4, r0, lsr #0x14
    rsb r4, r1, r0, asr #0xc
    mla r3, r4, r4, r3
    mul r0, r2, r2
    cmp r3, r0
    bgt L_021fe094
    cmp r4, #0x0
    beq L_021fe078
    ldr r1, L_021fe0b0
    mov r2, #0x1
    mov r0, r3, lsl #0x18
    strh r2, [r1, #0x0]
    str r0, [r1, #0x8]
    mov r0, r0, asr #0x1f
    str r0, [r1, #0xc]
    bl Overlay017_WaitForSquareRoot
    mov r1, r0
    cmp r1, #0x0
    ble L_021fe078
    mov r0, #0x2000
    bl func_020adc90
    mul r1, r4, r0
    mul r0, r5, r0
    str r1, [r6, #0xa8]
    str r0, [r6, #0xb0]
L_021fe078:
    mov r0, r6
    bl Overlay017_AdvanceEffectProgress
    mov r0, #0x2
    str r0, [r6, #0xb4]
    mov r0, #0x0
    str r0, [r6, #0xb8]
    b L_021fe09c
L_021fe094:
    mov r0, r6
    bl Overlay017_UpdateEffectMotion
L_021fe09c:
    mov r0, r6
    bl Overlay017_UpdateEffectTransform
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fe0ac: .word data_ov017_022016e0
L_021fe0b0: .word 0x40002b0

    .size Overlay017_UpdateEffectPhase, . - Overlay017_UpdateEffectPhase
