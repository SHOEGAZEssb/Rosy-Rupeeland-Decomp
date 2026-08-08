.text

/* Exact fallback; see src/overlays/ov031/overlay031_wave_effect.c for documented portable C. */


    .global func_ov031_021fce00
func_ov031_021fce00:
    stmdb sp!, {r4, lr}
    str r1, [r0, #0x480]
    str r2, [r0, #0x49c]
    mov lr, #0x0
    str lr, [r0, #0x4a0]
    str lr, [r0, #0x484]
    ldr r1, [r0, #0x480]
    mov r4, #0x0
    cmp r1, #0x1
    subeq lr, lr, #0x10
    mov ip, r4
L_021fce2c:
    add r1, r0, r4, lsl #0x1
    add r1, r1, #0x100
    strh ip, [r1, #0x80]
    ldrsh r1, [r1, #0x80]
    mov r3, r4, lsl #0x1
    add r2, r0, r4
    strh r1, [r0, r3]
    strb lr, [r2, #0x3c0]
    add r1, r2, #0x300
    ldrsb r1, [r1, #0xc0]
    add r4, r4, #0x1
    cmp r4, #0xc0
    strb r1, [r2, #0x300]
    blt L_021fce2c
    str ip, [r0, #0x488]
    str ip, [r0, #0x48c]
    str ip, [r0, #0x490]
    mov r1, #0x3c
    str r1, [r0, #0x494]
    mov r1, #0x82
    str r1, [r0, #0x498]
    ldmia sp!, {r4, pc}
.size func_ov031_021fce00, .-func_ov031_021fce00
    .global func_ov031_021fce84
func_ov031_021fce84:
    str r1, [r0, #0x480]
    str r2, [r0, #0x49c]
    mov r1, #0x0
    str r1, [r0, #0x4a0]
    bx lr
.size func_ov031_021fce84, .-func_ov031_021fce84
