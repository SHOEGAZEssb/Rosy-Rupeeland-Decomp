.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_main_state.c for documented portable C. */

    .extern Sound_PlayDirectSequence
    .extern Sound_StopDirectSequence
    .extern Presentation_SetScript
    .extern func_ov035_021fd25c
    .extern func_02091c7c
    .extern func_ov035_022011a8
    .extern Presentation_IsScriptComplete
    .extern func_ov035_022012ac
    .extern func_ov035_02201000
    .extern gSoundContext
    .extern data_ov035_022030a0
    .extern data_ov035_02202c34
    .extern data_ov035_02202c6c
    .extern data_ov035_02202e0c

    .global func_ov035_02201360
func_ov035_02201360:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_022014ac
L_02201378: ; jump table
    b L_0220138c ; case 0
    b L_022013ec ; case 1
    b L_02201414 ; case 2
    b L_02201468 ; case 3
    b L_022014a0 ; case 4
L_0220138c:
    ldr r0, L_022014bc
    mov r1, #0xb8
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    ldr r0, [r4, #0xfc]
    ldr r1, L_022014c0
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x100]
    ldr r1, L_022014c4
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x104]
    ldr r1, L_022014c8
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xd8]
    ldr r1, L_022014cc
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_022013ec:
    ldr r0, [r4, #0xfc]
    bl func_ov035_021fd25c
    cmp r0, #0x0
    beq L_022014ac
    mov r0, #0x3
    str r0, [r4, #0x16c]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022014ac
L_02201414:
    add r0, r4, #0x138
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02201444
    mov r0, r4
    bl func_ov035_022011a8
    cmp r0, #0x0
    ldrne r0, [r4, #0xa0]
    addne r0, r0, #0x1
    strne r0, [r4, #0xa0]
    b L_022014ac
L_02201444:
    mov r0, #0x1
    str r0, [r4, #0x174]
    ldr r0, [r4, #0x104]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    bne L_022014ac
    mov r0, r4
    bl func_ov035_022012ac
    b L_022014ac
L_02201468:
    add r0, r4, #0x138
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022014ac
    ldr r0, L_022014bc
    mov r1, #0xb8
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl Sound_StopDirectSequence
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022014ac
L_022014a0:
    bl func_ov035_02201000
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_022014ac:
    mov r0, r4
    bl func_ov035_02201000
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022014bc: .word gSoundContext
L_022014c0: .word data_ov035_022030a0
L_022014c4: .word data_ov035_02202c34
L_022014c8: .word data_ov035_02202c6c
L_022014cc: .word data_ov035_02202e0c
    .size func_ov035_02201360, .-func_ov035_02201360

