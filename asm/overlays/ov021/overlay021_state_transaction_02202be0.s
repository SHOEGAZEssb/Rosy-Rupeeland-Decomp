    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_transaction.c. */
    .extern data_ov021_02202d48
    .extern data_ov021_02202d70
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern func_ov021_021fd7c0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern Overlay021Descriptor_GetFlags16_19

.global func_ov021_02202be0
func_ov021_02202be0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02202c08
    cmp r1, #0x1
    beq L_02202c28
    cmp r1, #0x2
    beq L_02202c74
    b L_02202cb8
L_02202c08:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202c28:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202cb8
    ldr r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x2
    mov r0, r4
    bne L_02202c54
    mov r1, #0x1
    bl func_ov021_021ff0e0
    b L_02202c5c
L_02202c54:
    mov r1, #0x8
    bl func_ov021_021ff0e0
L_02202c5c:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202cb8
L_02202c74:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02202cb8
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_02202ca8
    ldr r1, L_02202cc8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02202cb8
L_02202ca8:
    ldr r1, L_02202ccc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02202cb8:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02202cc8: .word data_ov021_02202d48
L_02202ccc: .word data_ov021_02202d70
.size func_ov021_02202be0, . - func_ov021_02202be0
