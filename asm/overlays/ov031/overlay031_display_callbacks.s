.text

/* Exact fallback; see src/overlays/ov031/overlay031_display_callbacks.c for documented portable C. */
.extern func_ov031_021fd160
.extern func_ov031_021fd17c
.extern GXx_SetMasterBrightness_


    .global func_ov031_021fdc48
func_ov031_021fdc48:
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fdc7c
    ldr r1, [r0, #0x528]
    ldr r2, L_021fdc84
    rsb r1, r1, #0x1
    str r1, [r0, #0x528]
    ldr r1, [r2, #0x0]
    ldr r0, [r0, #0x4c]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021fdc7c:
    mov r0, #0x0
    bx lr
L_021fdc84: .word 0x4001000
.size func_ov031_021fdc48, .-func_ov031_021fdc48
    .global func_ov031_021fdc88
func_ov031_021fdc88:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    ldrne r0, [r4, #0xa0]
    cmpne r0, #0x0
    beq L_021fdcec
    ldr r0, L_021fdcf4
    ldrh r5, [r0, #0x0]
    cmp r5, #0xc0
    bge L_021fdcec
    mov r1, r5
    add r0, r4, #0xa4
    bl func_ov031_021fd160
    ldr r1, L_021fdcf8
    ldr r2, L_021fdcfc
    and r3, r0, r1
    mov r1, r5
    add r0, r4, #0xa4
    str r3, [r2, #0x0]
    bl func_ov031_021fd17c
    mov r1, r0
    ldr r0, L_021fdd00
    bl GXx_SetMasterBrightness_
L_021fdcec:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fdcf4: .word 0x4000006
L_021fdcf8: .word 0x1ff
L_021fdcfc: .word 0x4001010
L_021fdd00: .word 0x400106c
.size func_ov031_021fdc88, .-func_ov031_021fdc88
