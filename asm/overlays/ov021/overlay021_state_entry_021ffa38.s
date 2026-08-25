    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_entry.c. */
    .extern data_ov021_02202f10
    .extern data_ov021_02202f18
    .extern data_ov021_02202f20
    .extern data_ov021_02202f28
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern SceneSound_PlayPackedEffect
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern SpriteMotionController_BeginHitResponse
    .extern SpriteMotionController_Show
    .extern Overlay021_List_Show
    .extern Overlay021_List_RenderVisibleRows
    .extern Overlay021_List_UpdateSelectionDisplay
    .extern Overlay021_SetTransition
    .extern Overlay021_IsAuxiliaryRecordAvailable
    .extern func_ov021_021fee54
    .extern func_ov021_021feea4
    .extern func_ov021_021fefcc
    .extern func_ov021_021ff050
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274

.global func_ov021_021ffa38
func_ov021_021ffa38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r8, r0
    bl func_ov021_021ff274
    ldr r0, [r8, #0x4]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_021ffc94
L_021ffa54: ; jump table
    b L_021ffa68 ; case 0
    b L_021ffab8 ; case 1
    b L_021ffadc ; case 2
    b L_021ffc1c ; case 3
    b L_021ffc78 ; case 4
L_021ffa68:
    ldr r1, [r8, #0x48]
    mov r0, r8
    bic r1, r1, #0x2
    str r1, [r8, #0x48]
    ldr r2, [r8, #0x98]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r8, #0x9c]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov021_021fefcc
    add r0, r8, #0xa0
    bl SpriteMotionController_Show
    ldr r1, [r8, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r8, #0x4]
    str r0, [r8, #0x8]
L_021ffab8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ffc94
    ldr r1, [r8, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r8, #0x4]
    str r0, [r8, #0x8]
    b L_021ffc94
L_021ffadc:
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021ffc94
    add r0, r8, #0xa0
    add r1, r8, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021ffb30
    ldr r0, [r8, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r8
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r1, L_021ffca4
    mov r0, r8
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_021ffc94
L_021ffb30:
    mov r7, #0x0
    add r6, r8, #0x14c
    mov r10, #0x9
    mov r5, r7
    mov r4, #0x4
    mov r9, #0xac
    b L_021ffc10
L_021ffb4c:
    mla r0, r7, r9, r6
    mov r2, r5
    mov r3, r4
    add r1, r8, #0x30
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021ffc0c
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x2a4]
    cmp r0, #0x0
    beq L_021ffc00
    ldr r0, [r8, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r8
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    mov r0, #0x1
    str r7, [r8, #0x2c4]
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r8, #0x2c4]
    cmp r0, #0x1
    mov r0, r8
    bne L_021ffbe0
    bl Overlay021_IsAuxiliaryRecordAvailable
    cmp r0, #0x0
    beq L_021ffbcc
    ldr r1, L_021ffca8
    mov r0, r8
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_021ffc94
L_021ffbcc:
    ldr r1, L_021ffcac
    mov r0, r8
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_021ffc94
L_021ffbe0:
    mov r1, #0x3
    bl func_ov021_021ff0e0
    ldr r1, [r8, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r8, #0x4]
    str r0, [r8, #0x8]
    b L_021ffc94
L_021ffc00:
    mov r0, r8
    mov r1, r10
    bl SceneSound_PlayPackedEffect
L_021ffc0c:
    add r7, r7, #0x1
L_021ffc10:
    cmp r7, #0x2
    blt L_021ffb4c
    b L_021ffc94
L_021ffc1c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ffc94
    ldr r1, [r8, #0x2c4]
    mov r0, r8
    bl func_ov021_021ff050
    ldr r0, [r8, #0x2c0]
    bl Overlay021_List_Show
    ldr r0, [r8, #0x2c0]
    bl Overlay021_List_RenderVisibleRows
    ldr r0, [r8, #0x2c0]
    bl Overlay021_List_UpdateSelectionDisplay
    mov r0, r8
    bl func_ov021_021fee54
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r8, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r8, #0x4]
    str r0, [r8, #0x8]
    b L_021ffc94
L_021ffc78:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ffc94
    ldr r1, L_021ffcb0
    mov r0, r8
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_021ffc94:
    mov r0, r8
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021ffca4: .word data_ov021_02202f28
L_021ffca8: .word data_ov021_02202f20
L_021ffcac: .word data_ov021_02202f18
L_021ffcb0: .word data_ov021_02202f10
    .size func_ov021_021ffa38, . - func_ov021_021ffa38
