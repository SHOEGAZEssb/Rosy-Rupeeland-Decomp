    .text
/* Exact fallback; see src/overlays/ov017/overlay017_state_handlers.c. */
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern data_020f4e14
    .extern data_ov017_02201540
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_PlayDirectSequence
    .extern ModalState_UpdateInput
    .extern Overlay017_ShowSpritePool
    .extern Overlay017_SetCallbackDescriptor
    .extern Overlay017_CreateModalPanel
    .extern Overlay017_DestroyModalPanel
    .extern Overlay017_RenderScene
    .extern gDebugFont
    .extern gGameWork
.global Overlay017_UpdateOpeningState
Overlay017_UpdateOpeningState:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02200ad8
    cmp r0, #0x1
    beq L_02200b54
    cmp r0, #0x2
    beq L_02200b94
    b L_02200bd0
L_02200ad8:
    ldr r0, L_02200be0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02200be4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02200be8
    ldr r1, L_02200bec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r4, #0x4]
    moveq r0, #0x0
    streq r0, [r4, #0x8]
    beq L_02200bd0
    ldr r0, L_02200be8
    ldr r1, L_02200bec
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x8
    mov r2, #0x1
    mov r3, #0x0
    bl Overlay017_CreateModalPanel
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200bd0
L_02200b54:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_02200bd0
    mov r0, r4
    bl Overlay017_DestroyModalPanel
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200bd0
L_02200b94:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200bd0
    ldr r0, [r4, #0x254]
    bl Overlay017_ShowSpritePool
    ldr r1, L_02200bf0
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    mov r0, r4
    mov r1, #0x5c
    bl SceneSound_PlayDirectSequence
    ldr r1, L_02200bf4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay017_SetCallbackDescriptor
L_02200bd0:
    mov r0, r4
    bl Overlay017_RenderScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200be0: .word data_020f4e14
L_02200be4: .word gDebugFont
L_02200be8: .word gGameWork
L_02200bec: .word 0x3aa
L_02200bf0: .word 0x4114
L_02200bf4: .word data_ov017_02201540
    .size Overlay017_UpdateOpeningState, . - Overlay017_UpdateOpeningState
