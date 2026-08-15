.text

/* Exact fallback; see src/overlays/ov036/overlay036_segment_effect.c for documented portable C. */

    .extern Presentation_Init
    .extern PresentationScalar_SetImmediate
    .extern func_020ae024
    .extern Presentation_InterpolateScalar
    .extern data_ov036_02206044

    .global func_ov036_021fd834
func_ov036_021fd834:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    mov r7, r2
    mov r6, r3
    bl Presentation_Init
    ldr r0, L_021fd8f4
    ldr r1, [sp, #0x18]
    str r0, [r5, #0x0]
    str r7, [r5, #0x9c]
    str r6, [r5, #0xa0]
    ldr r0, [sp, #0x1c]
    str r1, [r5, #0xa4]
    ldr r1, [sp, #0x20]
    str r0, [r5, #0xa8]
    add r0, r5, #0x2c
    bl PresentationScalar_SetImmediate
    ldr r3, [r5, #0xa4]
    ldr r0, [r5, #0x9c]
    ldr r2, [r5, #0xa8]
    ldr r1, [r5, #0xa0]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r0, r5, #0x5c
    bl PresentationScalar_SetImmediate
    mov ip, #0x0
    mov r0, r4, lsl #0x10
    ldr r1, [sp, #0x24]
    str ip, [r5, #0xac]
    ldr r3, [sp, #0x28]
    strh r1, [r5, #0xb0]
    ldr r2, [sp, #0x2c]
    orr r1, r1, r3, lsl #0x5
    strh r3, [r5, #0xb2]
    strh r2, [r5, #0xb4]
    orr r1, r1, r2, lsl #0xa
    strh r1, [r5, #0xb6]
    mov r0, r0, asr #0x10
    str r0, [r5, #0x7c]
    str ip, [r5, #0x80]
    mov r1, #0x1
    mov r0, r5
    str r1, [r5, #0x88]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd8f4: .word data_ov036_02206044
    .size func_ov036_021fd834, .-func_ov036_021fd834

    .global func_ov036_021fd8f8
func_ov036_021fd8f8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x30]
    add r0, r6, #0x2c
    sub r1, r1, #0x2
    bl PresentationScalar_SetImmediate
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    mov r3, #0x80
    bl Presentation_InterpolateScalar
    str r0, [r6, #0xac]
    ldrh r3, [r6, #0xb4]
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x0
    bl Presentation_InterpolateScalar
    mov r5, r0
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x0
    ldrh r3, [r6, #0xb0]
    bl Presentation_InterpolateScalar
    mov r4, r0
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x0
    ldrh r3, [r6, #0xb2]
    bl Presentation_InterpolateScalar
    orr r0, r4, r0, lsl #0x5
    orr r0, r0, r5, lsl #0xa
    strh r0, [r6, #0xb6]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov036_021fd8f8, .-func_ov036_021fd8f8

