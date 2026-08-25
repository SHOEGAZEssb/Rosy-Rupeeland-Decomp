.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern TitleScrollValue_Advance


    .global func_ov025_02202b88
func_ov025_02202b88:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_02202be8
    mov ip, #0x4000000
    ldr r2, [ip, #0x0]
    ldr r1, [r0, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [ip, #0x0]
    add r3, ip, #0x1000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x4c]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldr r1, [r0, #0x598]
    cmp r1, #0x0
    moveq r0, #0x0
    streq r0, [ip, #0x1c]
    beq L_02202be8
    add r0, r0, #0x5a0
    bl TitleScrollValue_Advance
L_02202be8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov025_02202b88, .-func_ov025_02202b88

