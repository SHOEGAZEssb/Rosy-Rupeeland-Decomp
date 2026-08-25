    .text

/* Exact fallback; see src/overlays/ov016/overlay016_transition_helpers.c. */
    .extern data_020f4e14
    .extern data_ov016_022013d8
    .extern data_ov016_02201440
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SpriteMotionController_Hide
    .extern ModalState_UpdateInput
    .extern func_ov016_021fd3f8
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021ff848
    .extern func_ov016_021ff908
    .extern func_ov016_021ffba4
    .extern Overlay016_SyncSelectedPanel
    .extern gDebugFont
.global func_ov016_021ffe90
func_ov016_021ffe90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021ffeb0
    cmp r0, #0x1
    beq L_021fff84
    b L_021fffb4
L_021ffeb0:
    ldr r0, L_021fffbc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fffc0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne L_021ffee0
    mov r0, r4
    mov r1, #0x18
    bl func_ov016_021ff848
L_021ffee0:
    ldr r0, [r4, #0x444]
    ldr r1, [r0, #0x50]
    cmp r1, #0x0
    beq L_021fff18
    bl func_ov016_021fd3f8
    mov r0, r4
    bl func_ov016_021ffba4
    mov r0, r4
    bl Overlay016_SyncSelectedPanel
    ldr r1, L_021fffc4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_021fff70
L_021fff18:
    add r0, r4, #0x194
    bl SpriteMotionController_Hide
    ldr ip, [r4, #0xe4]
    mov r0, r4
    ldrh r3, [ip, #0x24]
    mov r1, #0x3
    mov r2, #0x1
    orr r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr ip, [r4, #0x48]
    mov r3, #0x0
    bic ip, ip, #0x4
    str ip, [r4, #0x48]
    ldr ip, [r4, #0x4c]
    bic ip, ip, #0x4
    str ip, [r4, #0x4c]
    bl func_ov016_021ff908
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fff70:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    b L_021fffb4
L_021fff84:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x460]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_021fffb4
    ldr r1, L_021fffc8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_021fffb4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fffbc: .word data_020f4e14
L_021fffc0: .word gDebugFont
L_021fffc4: .word data_ov016_022013d8
L_021fffc8: .word data_ov016_02201440
    .size func_ov016_021ffe90, . - func_ov016_021ffe90

