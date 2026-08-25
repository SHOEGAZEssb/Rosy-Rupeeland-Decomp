    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern data_020f4e14
    .extern data_ov016_02201430
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern DisplayBrightness_StartMaskedTransitions
    .extern Overlay016_RenderList
    .extern Overlay016ActorValue_Init
    .extern Overlay016_SetupPrimaryModeGraphics
    .extern Overlay016_CreateSceneSprite
    .extern Overlay016_DestroyAuxiliaryObjects
    .extern Overlay016_UpdateScene
    .extern Overlay016_DrawStatusMessage
    .extern Overlay016_UpdateCursorPosition
.global func_ov016_022010c0
func_ov016_022010c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_022010e8
    cmp r0, #0x1
    beq L_02201108
    cmp r0, #0x2
    beq L_02201178
    b L_022011a8
L_022010e8:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201108:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022011a8
    mov r0, r4
    bl Overlay016_DestroyAuxiliaryObjects
    ldr r0, L_022011b8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    mov r1, #0x18
    bl Overlay016_DrawStatusMessage
    mov r0, r4
    bl Overlay016_CreateSceneSprite
    mov r0, r4
    bl Overlay016_SetupPrimaryModeGraphics
    ldr r0, [r4, #0x444]
    bl Overlay016_RenderList
    mov r0, r4
    bl Overlay016_UpdateCursorPosition
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022011a8
L_02201178:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022011a8
    ldr r1, L_022011bc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022011a8:
    mov r0, r4
    bl Overlay016_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022011b8: .word data_020f4e14
L_022011bc: .word data_ov016_02201430
    .size func_ov016_022010c0, . - func_ov016_022010c0

