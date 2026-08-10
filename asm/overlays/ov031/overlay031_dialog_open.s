.text

/* Exact fallback; see src/overlays/ov031/overlay031_dialog_runtime.c for documented portable C. */
.extern data_021f4020
.extern data_021f5ed0
.extern data_ov031_021fe6e4
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02079408
.extern func_02092e9c
.extern func_02093360
.extern func_02093998
.extern func_020939d8
.extern func_ov031_021fdf20


    .global func_ov031_021fdd04
func_ov031_021fdd04:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    movs r5, r1
    ldr r0, [r4, #0x98]
    bmi L_021fdda4
    bl func_020939d8
    mov r1, r5, lsl #0x10
    ldr r0, L_021fddb0
    mov r1, r1, lsr #0x10
    bl func_02079408
    mov r1, r0
    ldr r0, [r4, #0x98]
    mov r2, #0x0
    bl func_02092e9c
    ldr r0, [r4, #0x98]
    ldr r1, L_021fddb4
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    ldrne r0, [r4, #0x98]
    ldr r1, L_021fddb8
    ldrne r0, [r0, #0xe8]
    moveq r0, #0x0
    str r0, [r4, #0x9c]
    ldr r2, [r4, #0x9c]
    ldr r0, [r4, #0x68]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r4, #0x68]
    mov r0, r4
    ldrh r2, [r3, #0x24]
    mov r1, #0x1
    orr r2, r2, #0x2
    bic r2, r2, #0x1
    strh r2, [r3, #0x24]
    bl func_ov031_021fdf20
    b L_021fdda8
L_021fdda4:
    bl func_02093998
L_021fdda8:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_021fddb0: .word data_021f4020
L_021fddb4: .word data_021f5ed0
L_021fddb8: .word data_ov031_021fe6e4
.size func_ov031_021fdd04, .-func_ov031_021fdd04
