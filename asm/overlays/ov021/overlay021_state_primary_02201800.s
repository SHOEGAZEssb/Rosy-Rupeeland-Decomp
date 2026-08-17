    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_primary.c. */
    .extern data_ov021_02202dd8
    .extern data_ov021_02202de0
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GamePhaseCurrencyHud_AddCurrency
    .extern ActorDescriptor_IsInvalid
    .extern func_02062ca8
    .extern func_02092c8c
    .extern TitleDialog_ClearTextRect
    .extern func_ov000_021fc714
    .extern Overlay000_GetActiveMetadata
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fea68
    .extern func_ov021_021feea4
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern func_ov021_021ffa10
    .extern func_ov045_0220b924
    .extern func_ov045_0220b9b8
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern gGameWork
    .extern gLupyContext

.global func_ov021_02201800
func_ov021_02201800:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_02201a64
L_02201818: ; jump table
    b L_02201830 ; case 0
    b L_022018b8 ; case 1
    b L_02201998 ; case 2
    b L_022019c8 ; case 3
    b L_022019ec ; case 4
    b L_02201a2c ; case 5
L_02201830:
    ldr r0, [r4, #0x354]
    bl Overlay000_GetActiveMetadata
    ldr r1, [r0, #0x1c]
    sub r1, r1, #0x1
    str r1, [r0, #0x1c]
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc714
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, L_02201a74
    ldr r1, [r4, #0x2bc]
    ldr r0, [r0, #0x0]
    ldr r5, [r1, #0x8]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    mov r2, r5
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02201a74
    mov r2, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r0, [r4, #0x37c]
    bl func_02062ca8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022018b8:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02201a64
    ldr r0, L_02201a78
    ldr r1, L_02201a7c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_02201934
    ldr r0, L_02201a78
    mov r1, #0x71
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02201934
    ldr r0, L_02201a78
    ldr r1, L_02201a7c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    mov r0, #0x1
    str r0, [r4, #0x3d8]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201a64
L_02201934:
    ldr r0, [r4, #0x37c]
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    ldreq r0, [r4, #0x3d8]
    cmpeq r0, #0x0
    beq L_02201970
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201a64
L_02201970:
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x6
    str r2, [r4, #0x37c]
    bl func_ov021_021ff0e0
    ldr r1, L_02201a80
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201a64
L_02201998:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201a64
    mov r0, r4
    mov r1, #0x6
    bl func_ov021_021ff0e0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201a64
L_022019c8:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02201a64
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201a64
L_022019ec:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble L_02201a64
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201a64
L_02201a2c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201a64
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    mov r0, r4
    bl func_ov021_021fea68
    ldr r1, L_02201a84
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02201a64:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201a74: .word gLupyContext
L_02201a78: .word gGameWork
L_02201a7c: .word 0x3df
L_02201a80: .word data_ov021_02202de0
L_02201a84: .word data_ov021_02202dd8
.size func_ov021_02201800, . - func_ov021_02201800
