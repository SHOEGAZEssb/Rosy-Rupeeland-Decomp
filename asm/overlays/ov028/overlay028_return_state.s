.text

/* Exact fallback; see src/overlays/ov028/overlay028_return_state.c. */
.extern data_ov028_021ff240
.extern func_02092260
.extern func_02092288
.extern func_02093de4
.extern func_02093ffc
.extern func_020946a8
.extern func_020946c8
.extern func_02094738
.extern func_ov028_021fd5e0
.extern func_ov028_021fdad8
.extern func_ov028_021fe438
.extern func_ov028_021fe6bc


    .global func_ov028_021fea98
func_ov028_021fea98:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x220]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x0
    beq L_021feac8
    cmp r0, #0x1
    beq L_021feae8
    cmp r0, #0x2
    beq L_021feb54
    b L_021febbc
L_021feac8:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021feae8:
    mov r0, r4
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021feb38
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021feb20
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_021feb20:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021feb54
L_021feb38:
    ldr r0, [r5, #0x220]
    bl func_ov028_021fd5e0
    cmp r0, #0x0
    beq L_021febbc
    mov r0, r5
    bl func_ov028_021fe6bc
    b L_021febbc
L_021feb54:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021feba4
    bl func_02093de4
    mov r0, r4
    add r1, r5, #0x30
    bl func_020946c8
    cmp r0, #0x0
    beq L_021febbc
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021febbc
L_021feba4:
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_021febcc
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
L_021febbc:
    mov r0, r5
    bl func_ov028_021fe438
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021febcc: .word data_ov028_021ff240
.size func_ov028_021fea98, .-func_ov028_021fea98
