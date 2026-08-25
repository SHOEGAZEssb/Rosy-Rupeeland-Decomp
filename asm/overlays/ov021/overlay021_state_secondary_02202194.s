    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_secondary.c. */
    .extern data_020f4e14
    .extern data_ov021_02202d88
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern DisplayBrightness_StartMaskedTransitions
    .extern SpriteMotionController_Show
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupMainBackground
    .extern Overlay021_DestroyPrimaryPanel
    .extern func_ov021_021fecd0
    .extern Overlay021_UpdateScene
    .extern func_ov021_021fefcc
    .extern func_ov021_021ff274

.global func_ov021_02202194
func_ov021_02202194:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_022021c0
    cmp r0, #0x1
    beq L_022021e0
    cmp r0, #0x2
    beq L_02202270
    b L_0220228c
L_022021c0:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022021e0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220228c
    mov r0, r4
    bl Overlay021_DestroyPrimaryPanel
    mov r0, r4
    bl func_ov021_021fecd0
    mov r0, r4
    bl Overlay021_SetupMainBackground
    ldr r0, L_0220229c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, [r4, #0x48]
    add r0, r4, #0xa0
    bic r1, r1, #0x2
    str r1, [r4, #0x48]
    ldr r2, [r4, #0x98]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x9c]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl SpriteMotionController_Show
    mov r0, r4
    bl func_ov021_021fefcc
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_0220228c
L_02202270:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220228c
    ldr r1, L_022022a0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_0220228c:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0220229c: .word data_020f4e14
L_022022a0: .word data_ov021_02202d88
.size func_ov021_02202194, . - func_ov021_02202194
