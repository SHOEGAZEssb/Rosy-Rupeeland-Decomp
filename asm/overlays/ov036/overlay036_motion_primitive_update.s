.text

/* Exact fallback; see src/overlays/ov036/overlay036_motion_primitive.c for documented portable C. */

    .extern func_ov036_021fd4b0
    .extern Presentation_AdvanceTransitions
    .extern PresentationScalar_TransitionTo
    .extern PresentationScalar_SetImmediate
    .extern Presentation_SetPosition

    .global func_ov036_021fd31c
func_ov036_021fd31c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrsh r1, [r4, #0x9c]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021fd4a4
L_021fd334: ; jump table
    b L_021fd344 ; case 0
    b L_021fd358 ; case 1
    b L_021fd3e0 ; case 2
    b L_021fd49c ; case 3
L_021fd344:
    ldrsh r1, [r4, #0xa0]
    bl func_ov036_021fd4b0
    ldrsh r0, [r4, #0x9c]
    add r0, r0, #0x1
    strh r0, [r4, #0x9c]
L_021fd358:
    mov r0, r4
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fd4a4
    ldrh r0, [r4, #0x98]
    bic r0, r0, #0x1
    strh r0, [r4, #0x98]
    ldrsh r0, [r4, #0x9a]
    ldr r5, [r4, #0x70]
    cmp r0, #0x0
    beq L_021fd394
    cmp r0, #0x1
    cmpne r0, #0x2
    beq L_021fd3a8
    b L_021fd3c4
L_021fd394:
    add r0, r4, #0x6c
    mov r1, #0x4
    mov r2, #0x0
    bl PresentationScalar_TransitionTo
    b L_021fd3c4
L_021fd3a8:
    add r0, r4, #0x6c
    mov r1, #0x0
    bl PresentationScalar_SetImmediate
    mov r2, r5
    add r0, r4, #0x6c
    mov r1, #0x3
    bl PresentationScalar_TransitionTo
L_021fd3c4:
    ldrsh r1, [r4, #0x9e]
    mov r0, r4
    bl func_ov036_021fd4b0
    ldrsh r0, [r4, #0x9c]
    add r0, r0, #0x1
    strh r0, [r4, #0x9c]
    b L_021fd4a4
L_021fd3e0:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    ldrnesh r0, [r4, #0x9c]
    addne r0, r0, #0x1
    strneh r0, [r4, #0x9c]
    bne L_021fd4a4
    ldr r1, [r4, #0xa4]
    ldr ip, [r4, #0xa8]
    ldr lr, [r4, #0xac]
    mov r0, r1, asr #0x7
    mov r2, ip, asr #0x7
    mov r3, lr, asr #0x7
    ldr r6, [r4, #0x10]
    add r1, r1, r0, lsr #0x18
    ldr r5, [r4, #0x20]
    add r2, ip, r2, lsr #0x18
    ldr ip, [r4, #0x30]
    add r3, lr, r3, lsr #0x18
    mov r0, r4
    add r1, r6, r1, asr #0x8
    add r2, r5, r2, asr #0x8
    add r3, ip, r3, asr #0x8
    bl Presentation_SetPosition
    ldr r0, [r4, #0xa4]
    ldr r1, L_021fd4ac
    mul r2, r0, r1
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    str r0, [r4, #0xa4]
    ldr r0, [r4, #0xa8]
    mul r2, r0, r1
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    str r0, [r4, #0xa8]
    ldr r0, [r4, #0xac]
    mul r1, r0, r1
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    str r0, [r4, #0xac]
    ldr r1, [r4, #0xa8]
    ldr r0, [r4, #0xb0]
    add r0, r1, r0
    str r0, [r4, #0xa8]
    b L_021fd4a4
L_021fd49c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
L_021fd4a4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fd4ac: .word 0xe66
    .size func_ov036_021fd31c, .-func_ov036_021fd31c

