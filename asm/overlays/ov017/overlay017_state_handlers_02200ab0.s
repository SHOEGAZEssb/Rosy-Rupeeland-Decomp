    .text
/* Exact fallback; see src/overlays/ov017/overlay017_state_handlers.c. */
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern data_020f4e14
    .extern data_ov017_02201540
    .extern func_02002d94
    .extern func_020755bc
    .extern func_02092260
    .extern func_020922f0
    .extern func_02095dd4
    .extern func_ov017_021fe6dc
    .extern func_ov017_021fea8c
    .extern func_ov017_021ffcc8
    .extern func_ov017_021ffd74
    .extern func_ov017_022008ac
    .extern gDebugFont
    .extern gGameWork
.global func_ov017_02200ab0
func_ov017_02200ab0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02200ad8
    cmp r0, #0x1
    beq L_02200b54
    cmp r0, #0x2
    beq L_02200b94
    b L_02200bd0
L_02200ad8:
    ldr r0, L_02200be0
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_02200be4
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_02200be8
    ldr r1, L_02200bec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r4, #0x4]
    moveq r0, #0x0
    streq r0, [r4, #0x8]
    beq L_02200bd0
    ldr r0, L_02200be8
    ldr r1, L_02200bec
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x8
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200bd0
L_02200b54:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02200bd0
    mov r0, r4
    bl func_ov017_021ffd74
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200bd0
L_02200b94:
    bl func_02002d94
    cmp r0, #0x0
    beq L_02200bd0
    ldr r0, [r4, #0x254]
    bl func_ov017_021fe6dc
    ldr r1, L_02200bf0
    mov r0, r4
    bl func_02092260
    mov r0, r4
    mov r1, #0x5c
    bl func_020922f0
    ldr r1, L_02200bf4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov017_021fea8c
L_02200bd0:
    mov r0, r4
    bl func_ov017_022008ac
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200be0: .word data_020f4e14
L_02200be4: .word gDebugFont
L_02200be8: .word gGameWork
L_02200bec: .word 0x3aa
L_02200bf0: .word 0x4114
L_02200bf4: .word data_ov017_02201540
    .size func_ov017_02200ab0, . - func_ov017_02200ab0
