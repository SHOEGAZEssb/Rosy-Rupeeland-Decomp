    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_secondary.c. */
    .extern data_ov021_02202d50
    .extern data_ov021_02202d98
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GamePhaseCurrencyHud_AddCurrency
    .extern func_02062ca8
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern func_ov001_021fc7e4
    .extern Overlay021_SetTransition
    .extern func_ov021_021fecd0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern func_ov021_021ffa10
    .extern func_ov045_0220b924
    .extern func_ov045_0220b9b8
    .extern gGamePhaseCurrencyHud

.global func_ov021_02201f98
func_ov021_02201f98:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_02202178
L_02201fb0: ; jump table
    b L_02201fc8 ; case 0
    b L_02202048 ; case 1
    b L_022020c0 ; case 2
    b L_022020f0 ; case 3
    b L_02202114 ; case 4
    b L_02202154 ; case 5
L_02201fc8:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc7e4
    ldr r1, [r0, #0x1c]
    sub r1, r1, #0x1
    str r1, [r0, #0x1c]
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, L_02202188
    ldr r1, [r4, #0x2bc]
    ldr r0, [r0, #0x0]
    ldr r5, [r1, #0x8]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    mov r2, r5
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02202188
    mov r2, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r0, [r4, #0x380]
    bl func_02062ca8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202048:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202178
    ldr r0, [r4, #0x380]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x0
    beq L_02202074
    ldr r0, [r4, #0x3d8]
    cmp r0, #0x0
    beq L_02202098
L_02202074:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202178
L_02202098:
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x6
    str r2, [r4, #0x380]
    bl func_ov021_021ff0e0
    ldr r1, L_0220218c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02202178
L_022020c0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202178
    mov r0, r4
    mov r1, #0x6
    bl func_ov021_021ff0e0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202178
L_022020f0:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02202178
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202178
L_02202114:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble L_02202178
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202178
L_02202154:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202178
    mov r0, r4
    bl func_ov021_021fecd0
    ldr r1, L_02202190
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_02202178:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02202188: .word gGamePhaseCurrencyHud
L_0220218c: .word data_ov021_02202d98
L_02202190: .word data_ov021_02202d50
.size func_ov021_02201f98, . - func_ov021_02201f98
