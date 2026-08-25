    .text
/* Exact fallback; see src/overlays/ov021/overlay021_action_helpers.c. */
    .extern data_ov021_02202f00
    .extern data_ov021_02202f08
.extern RecordDescriptor_IsDiscovered
    .extern func_02092260
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern func_ov021_021fd1b8
    .extern func_ov021_021fd6e8
    .extern func_ov021_021fd7c0

.global func_ov021_021ffcb4
func_ov021_021ffcb4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd6e8
    ldr r0, [r0, #0x0]
    str r0, [r4, #0x2bc]
    bl func_ov021_021fd1b8
    cmp r0, #0x1
    bne L_021ffd34
    ldr r0, [r4, #0x2bc]
    ldr r0, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x2
    blt L_021ffd34
    mov r0, #0x1
    str r0, [r4, #0x3e0]
    ldr r0, [r4, #0x2bc]
    bl RecordDescriptor_IsDiscovered
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [r4, #0x3dc]
    ldr r1, L_021ffd54
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    ldmia sp!, {r4, pc}
L_021ffd34:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_021ffd58
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    ldmia sp!, {r4, pc}
L_021ffd54: .word data_ov021_02202f08
L_021ffd58: .word data_ov021_02202f00
    .size func_ov021_021ffcb4, . - func_ov021_021ffcb4
