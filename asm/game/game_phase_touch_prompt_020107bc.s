; Matching retail form; see src/game/game_phase_touch_prompt_states.c.
.text
.extern data_020c3618
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern SpritePresentation_Hide

    .global GamePhaseTouchPrompt_UpdateAlternateHideSequence
GamePhaseTouchPrompt_UpdateAlternateHideSequence: ; 0x020107bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_020107d4: ; jump table
    b L_020107e8 ; case 0
    b L_020107e8 ; case 1
    b L_020107fc ; case 2
    b L_0201082c ; case 3
    b L_02010844 ; case 4
L_020107e8:
    str r0, [r4, #0x2c]
    mov r0, #0x2
    str r0, [r4, #0x28]
    mov r0, #0x0
    str r0, [r4, #0x24]
L_020107fc:
    ldr r0, [r4, #0x24]
    add r0, r0, #0x1
    str r0, [r4, #0x24]
    cmp r0, #0x2
    ldmleia sp!, {r4, pc}
    ldr r0, [r4, #0x1c]
    ldr r1, L_02010850
    mov r2, #0x0
    bl Presentation_SetScript
    mov r0, #0x3
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
L_0201082c:
    ldr r0, [r4, #0x1c]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    movne r0, #0x4
    strne r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
L_02010844:
    ldr r0, [r4, #0x1c]
    bl SpritePresentation_Hide
    ldmia sp!, {r4, pc}
L_02010850: .word data_020c3618
    .size GamePhaseTouchPrompt_UpdateAlternateHideSequence, . - GamePhaseTouchPrompt_UpdateAlternateHideSequence

