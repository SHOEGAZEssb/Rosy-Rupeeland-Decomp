    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_mode_switch.c. */
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern data_020f4e14
    .extern data_ov016_022014b0
    .extern data_ov016_022014b8
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern DisplayBrightness_StartMaskedTransitions
    .extern ModalState_UpdateInput
    .extern Overlay000_SyncSelection
    .extern Overlay016ActorValue_Init
    .extern Overlay016_SetupAlternateModeGraphics
    .extern Overlay016_DestroySceneSprites
    .extern Overlay016_PopulateAuxiliaryList
    .extern Overlay016_UpdateScene
    .extern Overlay016_CreateTransientMessage
    .extern Overlay016_DestroyTransientMessage
    .extern Overlay016_RefreshSelectionPresentation
    .extern gGameWork
.global func_ov016_022005c8
func_ov016_022005c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_02200754
L_022005e0: ; jump table
    b L_0220060c ; case 0
    b L_0220062c ; case 1
    b L_022006d8 ; case 2
    b L_022006fc ; case 3
    b L_02200754 ; case 4
    b L_02200754 ; case 5
    b L_02200754 ; case 6
    b L_02200754 ; case 7
    b L_02200754 ; case 8
    b L_02200754 ; case 9
    b L_02200738 ; case 10
L_0220060c:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220062c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200754
    mov r0, r4
    bl Overlay016_DestroySceneSprites
    ldr r0, L_02200764
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay016_PopulateAuxiliaryList
    mov r0, r4
    bl Overlay016_SetupAlternateModeGraphics
    mov r0, r4
    bl Overlay016_RefreshSelectionPresentation
    ldr r0, [r4, #0x44c]
    bl Overlay000_SyncSelection
    ldr r0, L_02200768
    ldr r1, L_0220076c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0xa
    streq r0, [r4, #0x4]
    moveq r0, #0x0
    beq L_022006c4
    ldr r0, L_02200768
    ldr r1, L_0220076c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl Overlay016_CreateTransientMessage
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
L_022006c4:
    str r0, [r4, #0x8]
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    b L_02200754
L_022006d8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200754
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200754
L_022006fc:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x460]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_02200754
    mov r0, r4
    bl Overlay016_DestroyTransientMessage
    ldr r1, L_02200770
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200754
L_02200738:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200754
    ldr r1, L_02200774
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_02200754:
    mov r0, r4
    bl Overlay016_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200764: .word data_020f4e14
L_02200768: .word gGameWork
L_0220076c: .word 0x3a7
L_02200770: .word data_ov016_022014b8
L_02200774: .word data_ov016_022014b0
    .size func_ov016_022005c8, . - func_ov016_022005c8

