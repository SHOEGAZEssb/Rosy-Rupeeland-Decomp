    .text
    .extern GameWork_TestFlag
    .extern func_ov005_021fbe1c
    .extern func_02028100
    .extern Presentation_SetScript
    .extern PresentationScalar_TransitionTo
    .extern Presentation_InterpolateScalar
    .extern func_ov005_021fc5e4
    .extern gGameWork

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_entry_transition_update.c. */
    .global func_ov005_021fc638
func_ov005_021fc638: ; 0x021fc638
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fc77c
L_021fc650: ; jump table
    b L_021fc660 ; case 0
    b L_021fc670 ; case 1
    b L_021fc6c0 ; case 2
    b L_021fc734 ; case 3
L_021fc660:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fc670:
    ldr r0, L_021fc78c
    ldr r1, L_021fc790
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fc77c
    ldr r0, [r4, #0x64]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0x74]
    bl func_ov005_021fbe1c
    ldr r0, [r4, #0x78]
    ldr r1, [r4, #0x68]
    bl func_02028100
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fc77c
L_021fc6c0:
    ldr r0, L_021fc78c
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fc77c
    mov r1, #0x0
    ldr r0, [r4, #0x64]
    mov r2, r1
    bl Presentation_SetScript
    ldr r0, [r4, #0x64]
    ldr r2, [r4, #0x7c]
    add r0, r0, #0xc
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    ldr r0, [r4, #0x64]
    ldr r2, [r4, #0x80]
    add r0, r0, #0x1c
    mov r1, #0x5
    bl PresentationScalar_TransitionTo
    ldr r2, [r4, #0x64]
    mov r0, #0x3c
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_021fc77c
L_021fc734:
    ldr r0, [r4, #0x64]
    ldr r2, [r0, #0x80]
    ldr r1, [r0, #0x7c]
    cmp r2, r1
    movge r1, #0x1
    movlt r1, #0x0
    cmp r1, #0x0
    bne L_021fc77c
    mov r1, #0x2
    mov r2, #0x200
    mov r3, #0x80
    bl Presentation_InterpolateScalar
    ldr r1, [r4, #0x64]
    mov r0, r0, lsl #0x10
    ldr r1, [r1, #0x9c]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
L_021fc77c:
    mov r0, r4
    bl func_ov005_021fc5e4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fc78c: .word gGameWork
L_021fc790: .word 0x3d3

    .size func_ov005_021fc638, .-func_ov005_021fc638
