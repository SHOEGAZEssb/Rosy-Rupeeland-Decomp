.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_activation.c for documented portable C. */

    .extern Presentation_SetPosition
    .extern PresentationScalar_TransitionTo
    .extern func_020956fc
    .extern func_020ae024
    .extern PresentationScalar_TransitionBy
    .extern gFx32CosSinTable
    .extern data_ov036_022051f0

    .global func_ov036_022018a8
func_ov036_022018a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x11c]
    ldr r0, [r10, #0x120]
    ldr r6, [r1, #0x20]
    ldr r5, [r1, #0x10]
    mov r2, r6
    mov r1, r5
    mvn r3, #0x1f
    bl Presentation_SetPosition
    ldr r0, [r10, #0x120]
    mov r1, #0x3
    add r0, r0, #0x6c
    mov r2, #0x4000
    bl PresentationScalar_TransitionTo
    ldr r1, [r10, #0x120]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r10, #0x120]
    mov r1, #0x1
    str r1, [r0, #0x88]
    ldr r0, [r10, #0x120]
    bl func_020956fc
    ldr r0, [r10, #0x124]
    mov r1, r5
    mov r2, r6
    mvn r3, #0x1f
    bl Presentation_SetPosition
    ldr r0, [r10, #0x124]
    mov r1, #0x3
    add r0, r0, #0x6c
    mov r2, #0x4000
    bl PresentationScalar_TransitionTo
    ldr r1, [r10, #0x124]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r10, #0x124]
    mov r1, #0x1
    str r1, [r0, #0x88]
    ldr r0, [r10, #0x124]
    bl func_020956fc
    ldr r11, L_02201a6c
    mov r4, #0x0
L_02201964:
    ldr r0, L_02201a70
    mov r1, #0x14
    mla r7, r4, r1, r0
    ldr r8, [r7, #0x8]
    ldr r9, [r7, #0x4]
    add r2, r8, #0x100
    mov r0, r9, asr #0x3
    mov r1, r2, asr #0x3
    add r0, r9, r0, lsr #0x1c
    add r1, r2, r1, lsr #0x1c
    mov r0, r0, asr #0x4
    mov r1, r1, asr #0x4
    bl func_020ae024
    mov r0, r0, lsl #0x10
    ldr r3, [r7, #0xc]
    mov r7, r0, lsr #0x10
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x128]
    add r1, r5, r9
    add r2, r6, r8
    bl Presentation_SetPosition
    mov r0, r7, asr #0x4
    mov r7, r0, lsl #0x1
    mov r2, r7, lsl #0x1
    ldrsh r2, [r11, r2]
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x128]
    mov r3, r2, lsl #0x7
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    mov r1, #0x4
    add r0, r0, #0xc
    mov r2, r2, asr #0x8
    bl PresentationScalar_TransitionBy
    add r0, r11, r7, lsl #0x1
    ldrsh r0, [r0, #0x2]
    add r1, r10, r4, lsl #0x2
    ldr r1, [r1, #0x128]
    mov r3, r0, lsl #0x7
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    add r0, r1, #0x1c
    mov r1, #0x4
    mov r2, r2, asr #0x8
    bl PresentationScalar_TransitionBy
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x128]
    ldr r2, L_02201a74
    mov r1, #0x2
    add r0, r0, #0x6c
    bl PresentationScalar_TransitionTo
    add r2, r10, r4, lsl #0x2
    ldr r1, [r2, #0x128]
    mov r0, #0x3c
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r1, [r2, #0x128]
    mov r0, #0x1
    str r0, [r1, #0x88]
    ldr r0, [r2, #0x128]
    bl func_020956fc
    add r4, r4, #0x1
    cmp r4, #0x8
    blt L_02201964
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201a6c: .word gFx32CosSinTable
L_02201a70: .word data_ov036_022051f0
L_02201a74: .word 0x19a
    .size func_ov036_022018a8, .-func_ov036_022018a8

