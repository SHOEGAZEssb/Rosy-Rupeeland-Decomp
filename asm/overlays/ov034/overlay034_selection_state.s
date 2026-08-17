.text

/* Exact fallback; see src/overlays/ov034/overlay034_selection_state.c for documented portable C. */

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
    .extern Sound_StopDirectSequence
    .extern Sound_Play
    .extern Sound_PlayDirectSequence
    .extern func_ov034_021fd978
    .extern genrand_int32
    .extern func_020bf1f8
    .extern func_ov034_021fce00
    .extern data_020c9670
    .extern data_ov034_021fe740
    .extern gTouchPanelManager
    .extern gSoundContext
    .extern data_ov034_021fe704

    .global func_ov034_021fe2dc

func_ov034_021fe2dc: 
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe65c
    mov r5, r0
    ldr r1, [r1, #0x0]
    mov r4, #0x0
    ldrh r0, [r1, #0x44]
    cmp r0, #0x1
    bne L_021fe308
    ldrh r0, [r1, #0x3c]
    cmp r0, #0x1
    movne r4, #0x1
L_021fe308:
    ldr r0, [r5, #0x1b8]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fe644
L_021fe318: ; jump table
    b L_021fe344 ; case 0
    b L_021fe34c ; case 1
    b L_021fe380 ; case 2
    b L_021fe3b0 ; case 3
    b L_021fe3f8 ; case 4
    b L_021fe464 ; case 5
    b L_021fe4ac ; case 6
    b L_021fe518 ; case 7
    b L_021fe560 ; case 8
    b L_021fe5dc ; case 9
    b L_021fe62c ; case 10
L_021fe344:
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
L_021fe34c:
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
    ldr r0, [r5, #0x0]
    bl func_ov034_021fd9c0
    mov r0, r5
    bl func_ov034_021fe668
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe380:
    ldr r0, [r5, #0x0]
    bl func_ov034_021fd9e8
    cmp r0, #0x0
    bne L_021fe644
    ldr r1, [r5, #0x0]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
L_021fe3b0:
    ldr r0, [r5, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    cmpeq r4, #0x0
    beq L_021fe644
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0x1b4]
    ldr r0, [r0, #0xa0]
    bl func_ov034_021fd3f4
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe3f8:
    ldr r0, [r5, #0x0]
    mov r1, #0x0
    bl func_ov034_021fda00
    cmp r0, #0x0
    beq L_021fe644
    ldr r0, [r5, #0x0]
    mov r1, #0x10
    str r1, [r0, #0xc4]
    ldr r2, [r5, #0x0]
    mov r0, #0x1e
    str r0, [r2, #0x7c]
    mov r1, #0x0
    ldr r0, L_021fe660
    str r1, [r2, #0x80]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe664
    mov r2, #0x3
    bl Sound_Play
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe464:
    ldr r0, [r5, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    cmpeq r4, #0x0
    beq L_021fe644
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0x1b4]
    ldr r0, [r0, #0xa4]
    bl func_ov034_021fd3f4
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe4ac:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl func_ov034_021fda00
    cmp r0, #0x0
    beq L_021fe644
    ldr r0, [r5, #0x0]
    mov r1, #0x10
    str r1, [r0, #0xc4]
    ldr r2, [r5, #0x0]
    mov r0, #0xb4
    str r0, [r2, #0x7c]
    mov r1, #0x0
    ldr r0, L_021fe660
    str r1, [r2, #0x80]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe664
    mov r2, #0x3
    bl Sound_Play
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe518:
    ldr r0, [r5, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    cmpeq r4, #0x0
    beq L_021fe644
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0x1b4]
    ldr r0, [r0, #0xa8]
    bl func_ov034_021fd3f4
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe560:
    ldr r0, [r5, #0x0]
    mov r1, #0x2
    bl func_ov034_021fda00
    cmp r0, #0x0
    beq L_021fe644
    ldr r3, [r5, #0x0]
    mov r2, #0x1e
    str r2, [r3, #0x7c]
    mov r1, #0x0
    ldr r0, L_021fe660
    str r1, [r3, #0x80]
    ldr r0, [r0, #0x0]
    mov r1, #0xba
    bl Sound_StopDirectSequence
    ldr r0, L_021fe660
    ldr r1, L_021fe664
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    ldr r0, [r5, #0x1b4]
    cmp r0, #0x2
    bge L_021fe5cc
    ldr r0, L_021fe660
    mov r1, #0xbb
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
L_021fe5cc:
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe5dc:
    ldr r0, [r5, #0x0]
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x1f
    bl Presentation_InterpolateScalar
    ldr r1, [r5, #0x0]
    str r0, [r1, #0xc4]
    ldr r0, [r5, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    beq L_021fe644
    ldr r1, [r5, #0x0]
    mov r0, #0x78
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r5, #0x1b8]
    add r0, r0, #0x1
    str r0, [r5, #0x1b8]
    b L_021fe644
L_021fe62c:
    ldr r0, [r5, #0x0]
    bl func_ov034_021fe2c4
    cmp r0, #0x0
    cmpeq r4, #0x0
    mvnne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
L_021fe644:
    mov r0, r5
    bl func_ov034_021fdf98
    ldr r0, [r5, #0x0]
    bl func_ov034_021fd978
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe65c: .word gTouchPanelManager
L_021fe660: .word gSoundContext
L_021fe664: .word 0x1cd
.size func_ov034_021fe2dc, .-func_ov034_021fe2dc

