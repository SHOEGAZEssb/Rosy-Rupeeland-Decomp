    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_exchange.c. */
    .extern data_021f5128
    .extern data_ov021_02202db0
    .extern data_ov021_02202e38
    .extern data_ov021_02202e40
    .extern data_ov021_02202e48
    .extern data_ov021_02202e58
    .extern data_ov021_02202e60
    .extern data_ov021_02202e68
    .extern data_ov021_02202e70
    .extern data_ov021_02202e78
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GamePhaseCurrencyHud_AddCurrency
    .extern func_02062ca8
    .extern RecordCategory_PublishById
    .extern RecordDescriptor_SetValue
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern func_ov021_021fd1b8
    .extern func_ov021_021fd1cc
    .extern func_ov021_021fd39c
    .extern func_ov021_021fd490
    .extern func_ov021_021fd7c0
    .extern Overlay021_SetupMainBackground
    .extern func_ov021_021fe6b0
    .extern Overlay021_DestroyAuxiliaryPanel
    .extern func_ov021_021fee54
    .extern func_ov021_021feea4
    .extern func_ov021_021ff050
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern func_ov021_021ffa10
    .extern func_ov045_0220b924
    .extern func_ov045_0220b9b8
    .extern func_ov045_0220bc34
    .extern gGamePhaseCurrencyHud

.global func_ov021_02200d10
func_ov021_02200d10:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0xb
    bgt L_02200d60
    cmp r1, #0x0
    addge pc, pc, r1, lsl #0x2
    b L_02201168
L_02200d30: ; jump table
    b L_02200d6c ; case 0
    b L_02200d8c ; case 1
    b L_02200ee0 ; case 2
    b L_02200f24 ; case 3
    b L_02200f48 ; case 4
    b L_02200f78 ; case 5
    b L_02201168 ; case 6
    b L_02201168 ; case 7
    b L_02201168 ; case 8
    b L_02201168 ; case 9
    b L_02200f98 ; case 10
    b L_02200fe4 ; case 11
L_02200d60:
    cmp r1, #0x1e
    beq L_02201024
    b L_02201168
L_02200d6c:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02200d8c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201168
    ldr r0, [r4, #0x3e0]
    cmp r0, #0x0
    beq L_02200df4
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x394]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x10]
    cmp r1, r0
    ble L_02200dd8
    mov r0, #0x4
    ldr r1, L_02201178
    str r0, [r4, #0x2c8]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02200dd8:
    mov r0, #0x3
    ldr r1, L_0220117c
    str r0, [r4, #0x2c8]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02200df4:
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021fd1b8
    cmp r0, #0x1
    bne L_02200eb0
    ldr r0, [r4, #0x2bc]
    ldr r5, [r4, #0x394]
    ldr r1, [r0, #0x4]
    ldr r1, [r1, #0x10]
    cmp r1, r5
    ble L_02200e6c
    ldr r0, L_02201180
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    mov r2, r5
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r3, [r4, #0x394]
    ldr r1, L_02201180
    mov r2, r0
    ldr r0, [r1, #0x0]
    rsb r1, r3, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201168
L_02200e6c:
    mov r1, r5
    ldr r5, [r0, #0x8]
    bl RecordDescriptor_SetValue
    ldr r0, [r4, #0x2bc]
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x3dc]
    ldr r0, [r4, #0x394]
    cmp r5, r0
    ble L_02200e9c
    ldr r0, [r4, #0x2bc]
    mov r1, r5
    bl RecordDescriptor_SetValue
L_02200e9c:
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201168
L_02200eb0:
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x394]
    ldr r1, [r1, #0x8]
    cmp r1, r0
    movlt r0, #0x2
    movge r0, #0x1
    str r0, [r4, #0x2c8]
    ldr r1, L_02201184
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02200ee0:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02201168
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02201168
    mov r0, r4
    mov r1, #0xa
    bl func_ov021_021ff0e0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201168
L_02200f24:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02201168
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201168
L_02200f48:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble L_02201168
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    ldr r1, L_02201188
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02200f78:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201168
    ldr r1, L_0220118c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02200f98:
    ldr r0, L_02201180
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r3, [r4, #0x394]
    ldr r1, L_02201180
    mov r2, r0
    ldr r0, [r1, #0x0]
    rsb r1, r3, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02200fe4:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02201168
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02201168
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201168
L_02201024:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201168
    mov r0, r4
    bl Overlay021_DestroyAuxiliaryPanel
    mov r0, r4
    bl func_ov021_021fe6b0
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl func_ov021_021ff050
    ldr r0, [r4, #0x37c]
    cmp r0, #0x0
    beq L_02201088
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x37c]
    bl func_02062ca8
    ldr r1, L_02201190
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02201088:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_022010c4
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x380]
    bl func_02062ca8
    ldr r1, L_02201194
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_022010c4:
    mov r0, r4
    bl Overlay021_SetupMainBackground
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd1cc
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd39c
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd490
    mov r0, r4
    bl func_ov021_021fee54
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021fd1b8
    cmp r0, #0x1
    bne L_02201124
    mov r0, #0x1
    mov r2, #0x0
    sub r1, r0, #0x9
    str r2, [r4, #0x3e0]
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_02201198
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201168
L_02201124:
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r1, [r4, #0x2bc]
    ldr r0, L_0220119c
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl RecordCategory_PublishById
    ldr r1, L_022011a0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02201168:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201178: .word data_ov021_02202e78
L_0220117c: .word data_ov021_02202e70
L_02201180: .word gGamePhaseCurrencyHud
L_02201184: .word data_ov021_02202e68
L_02201188: .word data_ov021_02202e60
L_0220118c: .word data_ov021_02202e58
L_02201190: .word data_ov021_02202db0
L_02201194: .word data_ov021_02202e48
L_02201198: .word data_ov021_02202e40
L_0220119c: .word data_021f5128
L_022011a0: .word data_ov021_02202e38
.size func_ov021_02200d10, . - func_ov021_02200d10
