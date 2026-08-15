    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_progress.c. */
    .extern Presentation_InterpolateLinear
    .extern func_ov017_021fe178
.global func_ov017_021fe0b4
func_ov017_021fe0b4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov017_021fe178
    cmp r0, #0x0
    beq L_021fe0e4
    ldr r3, [r4, #0xb8]
    mov r0, #0x100
    mov r1, #0x0
    mov r2, #0x8
    bl Presentation_InterpolateLinear
    mov r5, r0
    b L_021fe114
L_021fe0e4:
    ldrh r2, [r4, #0x9c]
    ldrh r3, [r4, #0x9e]
    mov r0, #0x400
    mov r1, #0x100
    bl Presentation_InterpolateLinear
    mov r5, r0
    ldrh r2, [r4, #0x9c]
    ldrh r3, [r4, #0x9e]
    mov r0, #0xc
    mov r1, #0x3
    bl Presentation_InterpolateLinear
    str r0, [r4, #0xa4]
L_021fe114:
    str r5, [r4, #0xd8]
    str r5, [r4, #0xd4]
    str r5, [r4, #0xd0]
    ldr r1, [r4, #0x10]
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r4, #0xc4]
    ldr r1, [r4, #0x20]
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r4, #0xc8]
    ldr r1, [r4, #0x30]
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r4, #0xcc]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov017_021fe0b4, . - func_ov017_021fe0b4
