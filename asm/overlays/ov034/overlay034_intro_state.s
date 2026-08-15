.text

/* Exact fallback; see src/overlays/ov034/overlay034_intro_state.c for documented portable C. */

    .extern func_ov034_021fe2c4
    .extern PresentationScalar_TransitionTo
    .extern func_ov034_021fda1c
    .extern Presentation_InterpolateScalar
    .extern PresentationScalar_SetImmediate
    .extern func_ov034_021fdac0
    .extern func_ov034_021fdf98
    .extern func_ov034_021fd9c0
    .extern func_ov034_021fe668
    .extern func_ov034_021fd9e8
    .extern func_ov034_021fd3f4
    .extern func_ov034_021fda00
    .extern func_0205929c
    .extern Sound_Play
    .extern func_02059278
    .extern func_ov034_021fd978
    .extern genrand_int32
    .extern func_020bf1f8
    .extern func_ov034_021fce00
    .extern data_020c9670
    .extern data_ov034_021fe740
    .extern gTouchPanelManager
    .extern gSoundContext
    .extern data_ov034_021fe704

    .global func_ov034_021fdfe0

func_ov034_021fdfe0: 
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, r0
    ldr r0, [r4, #0x1b8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_021fe2a8
L_021fdff8: ; jump table
    b L_021fe00c ; case 0
    b L_021fe040 ; case 1
    b L_021fe10c ; case 2
    b L_021fe23c ; case 3
    b L_021fe284 ; case 4
L_021fe00c:
    ldr r0, [r4, #0x8]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    beq L_021fe2a8
    ldr r1, [r4, #0x8]
    mov r0, #0x3c
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x1b8]
    add r0, r0, #0x1
    str r0, [r4, #0x1b8]
    b L_021fe2a8
L_021fe040:
    ldr r0, [r4, #0x8]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    beq L_021fe0ac
    mov r5, #0x0
    mov r7, #0x3
    ldr r6, L_021fe2b8
    b L_021fe090
L_021fe060:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r7
    mov r2, r6
    add r0, r0, #0x6c
    bl PresentationScalar_TransitionTo
    add r0, r4, r5, lsl #0x2
    mov r1, r5, lsl #0x1
    ldr r0, [r0, #0x8]
    add r1, r1, #0x10
    bl func_ov034_021fda1c
    add r5, r5, #0x1
L_021fe090:
    ldr r0, [r4, #0x1b0]
    cmp r5, r0
    blt L_021fe060
    ldr r0, [r4, #0x1b8]
    add r0, r0, #0x1
    str r0, [r4, #0x1b8]
    b L_021fe2a8
L_021fe0ac:
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x20000
    bl Presentation_InterpolateScalar
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, L_021fe2bc
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r6, #0x0
    mov r5, r0, lsl #0x1
    b L_021fe0fc
L_021fe0e4:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r5
    add r0, r0, #0x4c
    bl PresentationScalar_SetImmediate
    add r6, r6, #0x1
L_021fe0fc:
    ldr r0, [r4, #0x1b0]
    cmp r6, r0
    blt L_021fe0e4
    b L_021fe2a8
L_021fe10c:
    ldr r0, [r4, #0x1b0]
    sub r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    mov r10, #0x0
    beq L_021fe1d0
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    add r0, r0, #0x6c
    mov r2, #0x1800
    bl PresentationScalar_TransitionTo
    mov r8, #0x4000
    mov r9, #0x1
    ldr r1, [r4, #0x0]
    mov r0, #0x10
    str r0, [r1, #0x7c]
    str r10, [r1, #0x80]
    rsb r8, r8, #0x0
    mov r7, r9
    mov r11, r10
    mov r6, #0xc
    mov r5, r10
    b L_021fe1b4
L_021fe170:
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r9
    mov r2, r8
    add r0, r0, #0x3c
    bl PresentationScalar_TransitionTo
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r7
    mov r2, r11
    add r0, r0, #0x6c
    bl PresentationScalar_TransitionTo
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x8]
    add r10, r10, #0x1
    str r6, [r0, #0x7c]
    str r5, [r0, #0x80]
L_021fe1b4:
    ldr r0, [r4, #0x1b0]
    cmp r10, r0
    blt L_021fe170
    ldr r0, [r4, #0x1b8]
    add r0, r0, #0x1
    str r0, [r4, #0x1b8]
    b L_021fe2a8
L_021fe1d0:
    mov r7, #0x1f
    mov r9, #0x3
    mov r8, r10
    mov r5, r7
    mov r6, r10
    b L_021fe22c
L_021fe1e8:
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl Presentation_InterpolateScalar
    cmp r0, #0x0
    movlt r0, r6
    blt L_021fe214
    cmp r0, #0x1f
    movgt r0, r5
L_021fe214:
    add r1, r4, r10, lsl #0x2
    orr r2, r0, r0, lsl #0x5
    ldr r1, [r1, #0x8]
    orr r0, r2, r0, lsl #0xa
    strh r0, [r1, #0xa6]
    add r10, r10, #0x1
L_021fe22c:
    ldr r0, [r4, #0x1b0]
    cmp r10, r0
    blt L_021fe1e8
    b L_021fe2a8
L_021fe23c:
    ldr r0, [r4, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    beq L_021fe2a8
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    add r0, r0, #0x6c
    mov r2, #0x1000
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x0]
    mov r0, #0x8
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x1b8]
    add r0, r0, #0x1
    str r0, [r4, #0x1b8]
    b L_021fe2a8
L_021fe284:
    ldr r0, [r4, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    beq L_021fe2a8
    ldr r1, L_021fe2c0
    mov r0, r4
    mov r3, #0x2
    ldmia r1, {r1, r2}
    bl func_ov034_021fdac0
L_021fe2a8:
    mov r0, r4
    bl func_ov034_021fdf98
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe2b8: .word 0x266
L_021fe2bc: .word data_020c9670
L_021fe2c0: .word data_ov034_021fe740
.size func_ov034_021fdfe0, .-func_ov034_021fdfe0

