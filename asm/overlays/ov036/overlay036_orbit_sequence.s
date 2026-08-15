.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_handles.c for documented portable C. */

    .extern PresentationScalar_TransitionBy
    .extern func_ov036_022002b8
    .extern Presentation_AdvanceTransitions
    .extern Sound_Play
    .extern func_ov036_02200318
    .extern gSoundContext

    .global func_ov036_022003d4
func_ov036_022003d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_0220058c
L_022003ec: ; jump table
    b L_022003fc ; case 0
    b L_02200458 ; case 1
    b L_022004dc ; case 2
    b L_02200510 ; case 3
L_022003fc:
    add r0, r4, #0x1c
    mov r1, #0x4
    mov r2, #0x500
    bl PresentationScalar_TransitionBy
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r2, #0x0
    str r2, [r4, #0x80]
    ldr r1, [r4, #0x9c]
    ldrh r0, [r1, #0x50]
    bic r0, r0, #0x4
    strh r0, [r1, #0x50]
L_0220042c:
    add r0, r4, r2, lsl #0x2
    ldr r1, [r0, #0xa0]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x50]
    cmp r2, #0x4
    bic r0, r0, #0x4
    strh r0, [r1, #0x50]
    blt L_0220042c
    ldr r0, [r4, #0xb4]
    add r0, r0, #0x1
    str r0, [r4, #0xb4]
L_02200458:
    mov r0, r4
    bl func_ov036_022002b8
    mov r0, r4
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_022004d0
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    bne L_02200494
    ldr r0, L_02200594
    ldr r1, L_02200598
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b L_022004b0
L_02200494:
    cmp r0, #0x1
    bne L_022004b0
    ldr r0, L_02200594
    ldr r1, L_02200598
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
L_022004b0:
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xb4]
    add r0, r0, #0x1
    str r0, [r4, #0xb4]
    b L_0220058c
L_022004d0:
    mov r0, r4
    bl func_ov036_02200318
    b L_0220058c
L_022004dc:
    bl func_ov036_022002b8
    mov r0, r4
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_0220058c
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xb4]
    add r0, r0, #0x1
    str r0, [r4, #0xb4]
    b L_0220058c
L_02200510:
    bl func_ov036_022002b8
    mov r0, r4
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_02200584
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    bne L_02200548
    ldr r0, L_02200594
    ldr r1, L_02200598
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b L_02200564
L_02200548:
    cmp r0, #0x1
    bne L_02200564
    ldr r0, L_02200594
    ldr r1, L_02200598
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
L_02200564:
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xb4]
    sub r0, r0, #0x1
    str r0, [r4, #0xb4]
    b L_0220058c
L_02200584:
    mov r0, r4
    bl func_ov036_02200318
L_0220058c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200594: .word gSoundContext
L_02200598: .word 0x1af
    .size func_ov036_022003d4, .-func_ov036_022003d4

