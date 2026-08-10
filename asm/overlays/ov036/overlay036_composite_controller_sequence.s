.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_controller_sequence.c for documented portable C. */

    .extern func_02059278
    .extern func_02091b98
    .extern func_02091c7c
    .extern func_02094cf0
    .extern func_ov036_02203024
    .extern func_02095224
    .extern Sound_Play
    .extern GraphicsAnimationInstance_SetAnimation
    .extern func_02095248
    .extern func_ov036_021fdc1c
    .extern func_0205929c
    .extern func_ov036_02202fb8
    .extern gSoundContext
    .extern data_ov036_02204f8c
    .extern data_ov036_0220506c
    .extern data_ov036_022058e4
    .extern data_ov036_02205400

    .global func_ov036_022032a8
func_ov036_022032a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b L_02203748
L_022032c0: ; jump table
    b L_022032f0 ; case 0
    b L_02203320 ; case 1
    b L_02203374 ; case 2
    b L_022033b0 ; case 3
    b L_02203444 ; case 4
    b L_02203498 ; case 5
    b L_02203518 ; case 6
    b L_0220356c ; case 7
    b L_022035fc ; case 8
    b L_02203650 ; case 9
    b L_022036e0 ; case 10
    b L_0220373c ; case 11
L_022032f0:
    ldr r0, L_02203758
    mov r1, #0xb2
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    add r0, r4, #0xa4
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_02203748
L_02203320:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02203360
    ldr r0, [r4, #0xfc]
    ldr r1, L_0220375c
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xd8]
    ldr r1, L_02203760
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203360:
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x1
    bl func_ov036_02203024
    b L_02203748
L_02203374:
    ldr r0, [r4, #0xfc]
    bl func_02095224
    cmp r0, #0x0
    beq L_0220339c
    add r0, r4, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_0220339c:
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x1
    bl func_ov036_02203024
    b L_02203748
L_022033b0:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02203430
    ldr r0, L_02203758
    ldr r1, L_02203764
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, [r4, #0x154]
    ldr r1, L_02203768
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x158]
    ldr r1, L_02203768
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xf8]
    ldr r1, L_0220376c
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x1a0]
    mov r1, #0x7e00
    strh r1, [r0, #0x14]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203430:
    mov r1, #0x1
    mov r0, r4
    mov r2, r1
    bl func_ov036_02203024
    b L_02203748
L_02203444:
    ldr r0, [r4, #0x154]
    bl func_02095248
    cmp r0, #0x0
    beq L_02203474
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdc1c
    add r0, r4, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203474:
    ldr r0, [r4, #0x154]
    ldrh r0, [r0, #0x98]
    tst r0, #0x4
    beq L_02203748
    mov r1, #0x1
    mov r0, r4
    mov r2, r1
    bl func_ov036_02203024
    b L_02203748
L_02203498:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02203504
    ldr r0, L_02203758
    ldr r1, L_02203764
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r4, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, [r4, #0x154]
    mov r2, #0x0
    str r2, [r0, #0x90]
    ldr r0, [r4, #0x158]
    ldr r1, L_02203770
    str r2, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    str r2, [r0, #0x90]
    ldr r0, [r4, #0x1a0]
    strh r1, [r0, #0x14]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203504:
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov036_02203024
    b L_02203748
L_02203518:
    ldr r0, [r4, #0x154]
    bl func_02095248
    cmp r0, #0x0
    beq L_02203548
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdc1c
    add r0, r4, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203548:
    ldr r0, [r4, #0x154]
    ldrh r0, [r0, #0x98]
    tst r0, #0x4
    beq L_02203748
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov036_02203024
    b L_02203748
L_0220356c:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022035e8
    ldr r0, L_02203758
    ldr r1, L_02203764
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, [r4, #0x154]
    mov r3, #0x0
    str r3, [r0, #0x90]
    ldr r0, [r4, #0x158]
    mov r2, #0x8000
    str r3, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    mov r1, #0x4000
    str r3, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    ldr r0, [r0, #0x9c]
    strh r2, [r0, #0x4c]
    ldr r0, [r4, #0x1a0]
    strh r1, [r0, #0x14]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_022035e8:
    mov r0, r4
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov036_02203024
    b L_02203748
L_022035fc:
    ldr r0, [r4, #0x154]
    bl func_02095248
    cmp r0, #0x0
    beq L_0220362c
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdc1c
    add r0, r4, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_0220362c:
    ldr r0, [r4, #0x154]
    ldrh r0, [r0, #0x98]
    tst r0, #0x4
    beq L_02203748
    mov r0, r4
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov036_02203024
    b L_02203748
L_02203650:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022036cc
    ldr r0, L_02203758
    ldr r1, L_02203764
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r4, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, [r4, #0x154]
    mov r3, #0x0
    str r3, [r0, #0x90]
    ldr r0, [r4, #0x158]
    mov r2, #0x4000
    str r3, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    mov r1, #0x3f0
    str r3, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    ldr r0, [r0, #0x9c]
    strh r2, [r0, #0x4c]
    ldr r0, [r4, #0x1a0]
    strh r1, [r0, #0x14]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_022036cc:
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov036_02203024
    b L_02203748
L_022036e0:
    ldr r0, [r4, #0x154]
    bl func_02095248
    cmp r0, #0x0
    beq L_02203718
    ldr r0, L_02203758
    mov r1, #0xb2
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdc1c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02203718:
    ldr r0, [r4, #0x154]
    ldrh r0, [r0, #0x98]
    tst r0, #0x4
    beq L_02203748
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov036_02203024
    b L_02203748
L_0220373c:
    bl func_ov036_02202fb8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203748:
    mov r0, r4
    bl func_ov036_02202fb8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02203758: .word gSoundContext
L_0220375c: .word data_ov036_02204f8c
L_02203760: .word data_ov036_0220506c
L_02203764: .word 0x1b2
L_02203768: .word data_ov036_022058e4
L_0220376c: .word data_ov036_02205400
L_02203770: .word 0x401f
    .size func_ov036_022032a8, .-func_ov036_022032a8

