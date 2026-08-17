.text

/* Exact fallback; see src/overlays/ov031/overlay031_dialog_runtime.c for documented portable C. */
.extern data_ov031_021fe6e4
.extern GraphicsSpriteState_SetAnimationIndex
.extern TitleDialog_UpdateTextPage
.extern func_ov031_021fdf20


    .global func_ov031_021fddbc
func_ov031_021fddbc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r3, [r4, #0x2c]
    add r2, sp, #0x18
    mov r1, #0xb
L_021fddd4:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fddd4
    ldr r0, [r4, #0x98]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x4]
    str r1, [sp, #0x10]
    movne r0, #0x1
    bne L_021fdf14
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    mov r0, r1, lsl #0x1e
    beq L_021fde8c
    str r1, [sp, #0xc]
    movs r0, r0, asr #0x1f
    beq L_021fde7c
    mov r0, r4
    mov r1, #0x1
    bl func_ov031_021fdf20
    ldr r0, [r4, #0x68]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x2
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne L_021fde6c
    ldr r2, [r4, #0x9c]
    ldr r1, L_021fdf1c
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x68]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
L_021fde6c:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x1
    strh r0, [sp, #0x1a]
    b L_021fdea4
L_021fde7c:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x2
    strh r0, [sp, #0x1a]
    b L_021fdea4
L_021fde8c:
    str r1, [sp, #0x8]
    movs r0, r0, asr #0x1f
    ldrne r1, [r4, #0x68]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strneh r0, [r1, #0x24]
L_021fdea4:
    ldr r0, [r4, #0x98]
    add r1, sp, #0x18
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x14]
    movs r0, r1, asr #0x1f
    beq L_021fdeec
    ldr r1, [r4, #0x98]
    ldr r0, L_021fdf1c
    ldr r1, [r1, #0xe8]
    str r1, [r4, #0x9c]
    ldrb r1, [r0, r1]
    ldr r0, [r4, #0x68]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r4
    mov r1, #0x1
    bl func_ov031_021fdf20
L_021fdeec:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    moveq r0, #0x0
    beq L_021fdf14
    ldr r2, [r4, #0x68]
    mov r0, #0x1
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
L_021fdf14:
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
L_021fdf1c: .word data_ov031_021fe6e4
.size func_ov031_021fddbc, .-func_ov031_021fddbc
