.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_callbacks.c. */
.extern data_ov024_021fe210
.extern gSystemState


    .global func_ov024_021fe14c
func_ov024_021fe14c:
    sub sp, sp, #0x40
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe1c8
    ldr ip, L_021fe1d4
    add r3, sp, #0x0
    mov r2, #0x20
L_021fe16c:
    ldrh r1, [ip], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne L_021fe16c
    ldr r1, L_021fe1d8
    ldrh r3, [r1, #0x0]
    cmp r3, #0xc0
    bge L_021fe1c8
    ldr r2, L_021fe1dc
    ldr ip, [r0, #0x2e8]
    ldr r2, [r2, #0x64]
    add r0, r3, ip
    add r0, r0, r2, lsr #0x3
    mov r0, r0, lsl #0x1b
    mov r3, r0, lsr #0x1a
    add r2, sp, #0x0
    ldr r0, L_021fe1e0
    ldrsh r3, [r2, r3]
    mov r2, r0, lsl #0x10
    and r2, r2, ip, lsl #0x10
    and r0, r3, r0
    orr r0, r0, r2
    str r0, [r1, #0x16]
L_021fe1c8:
    mov r0, #0x0
    add sp, sp, #0x40
    bx lr
L_021fe1d4: .word data_ov024_021fe210
L_021fe1d8: .word 0x4000006
L_021fe1dc: .word gSystemState
L_021fe1e0: .word 0x1ff
.size func_ov024_021fe14c, .-func_ov024_021fe14c

