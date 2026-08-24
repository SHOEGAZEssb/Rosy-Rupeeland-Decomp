.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_transition_point.c for documented portable C. */

    .extern func_ov036_021fdc5c
    .extern gFx32CosSinTable

    .global func_ov036_02203228
func_ov036_02203228:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0x154]
    ldr lr, L_022032a4
    ldr r2, [r1, #0x60]
    mov ip, #0xe0
    rsb r2, r2, #0x0
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r4, r2, lsl #0x1
    add r2, r4, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r3, [lr, r2]
    mov r2, r4, lsl #0x1
    ldrsh r2, [lr, r2]
    smulbb r4, r3, ip
    mov r3, r4, asr #0x7
    smulbb lr, r2, ip
    mov ip, lr, asr #0x7
    ldr r2, [r1, #0x20]
    add r3, r4, r3, lsr #0x18
    ldr r1, [r1, #0x10]
    add r3, r2, r3, asr #0x8
    str r3, [sp, #0x0]
    add r3, lr, ip, lsr #0x18
    ldr r0, [r0, #0x1a0]
    add r3, r1, r3, asr #0x8
    bl func_ov036_021fdc5c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_022032a4: .word gFx32CosSinTable
    .size func_ov036_02203228, .-func_ov036_02203228

