    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_variant.c. */
    .extern data_ov017_02201654
    .extern PresentationScalar_SetImmediate
    .extern PresentationScalar_TransitionTo
    .extern PresentationScalar_TransitionBy
    .extern Presentation_Init
    .extern Presentation_SetPosition
.global func_ov017_021fe190
func_ov017_021fe190:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x18]
    bl Presentation_Init
    ldr r0, L_021fe2d0
    cmp r8, #0x0
    str r0, [r4, #0x0]
    str r8, [r4, #0x9c]
    beq L_021fe1d4
    cmp r8, #0x1
    beq L_021fe218
    cmp r8, #0x2
    beq L_021fe25c
    b L_021fe29c
L_021fe1d4:
    mov r0, r4
    mov r1, r7
    mov r3, r6
    mov r2, #0x0
    bl Presentation_SetPosition
    mov r2, r5
    add r0, r4, #0x1c
    mov r1, #0x3
    bl PresentationScalar_TransitionBy
    add r0, r4, #0x6c
    mov r1, #0x0
    bl PresentationScalar_SetImmediate
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x100
    bl PresentationScalar_TransitionTo
    b L_021fe29c
L_021fe218:
    mov r0, r4
    mov r1, r7
    mov r2, r5
    mov r3, r6
    bl Presentation_SetPosition
    add r0, r4, #0x1c
    rsb r2, r5, #0x0
    mov r1, #0x4
    bl PresentationScalar_TransitionBy
    add r0, r4, #0x6c
    mov r1, #0x80
    bl PresentationScalar_SetImmediate
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x100
    bl PresentationScalar_TransitionTo
    b L_021fe29c
L_021fe25c:
    mov r0, r4
    mov r1, r7
    mov r2, r5
    mov r3, r6
    bl Presentation_SetPosition
    add r0, r4, #0x1c
    rsb r2, r5, #0x0
    mov r1, #0x4
    bl PresentationScalar_TransitionBy
    add r0, r4, #0x6c
    mov r1, #0x100
    bl PresentationScalar_SetImmediate
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x400
    bl PresentationScalar_TransitionTo
L_021fe29c:
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x20]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r4, #0x7c]
    mov r2, #0x0
    add r0, r4, #0x3c
    str r2, [r4, #0x80]
    bl PresentationScalar_SetImmediate
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe2d0: .word data_ov017_02201654
    .size func_ov017_021fe190, . - func_ov017_021fe190
