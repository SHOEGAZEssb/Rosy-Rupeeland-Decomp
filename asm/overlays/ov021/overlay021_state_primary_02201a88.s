    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_primary.c. */
    .extern data_020f4e14
    .extern data_ov021_02202dd0
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_020755bc
    .extern func_02092c8c
    .extern func_02095940
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe458
    .extern func_ov021_021feb60
    .extern func_ov021_021feea4
    .extern func_ov021_021ff050
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern GameWork_ClearFlag
    .extern gGameWork

.global func_ov021_02201a88
func_ov021_02201a88:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02201b88
L_02201aa4: ; jump table
    b L_02201ab4 ; case 0
    b L_02201ae8 ; case 1
    b L_02201b34 ; case 2
    b L_02201b6c ; case 3
L_02201ab4:
    ldr r0, L_02201b98
    ldr r1, L_02201b9c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02201b98
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201ae8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201b88
    add r0, r4, #0xa0
    bl func_02095940
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl func_ov021_021ff050
    ldr r0, L_02201ba0
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov021_021feb60
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201b88
L_02201b34:
    mov r0, r4
    bl func_ov021_021fe458
    mov r0, r4
    mov r1, #0x2
    bl func_ov021_021ff0e0
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201b88
L_02201b6c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201b88
    ldr r1, L_02201ba4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02201b88:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201b98: .word gGameWork
L_02201b9c: .word 0x387
L_02201ba0: .word data_020f4e14
L_02201ba4: .word data_ov021_02202dd0
.size func_ov021_02201a88, . - func_ov021_02201a88
