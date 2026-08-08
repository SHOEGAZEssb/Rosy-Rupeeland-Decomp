.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_render.c for documented portable C. */

    .extern func_ov036_021fd128
    .extern func_ov036_021fdef0
    .extern func_020b0880
    .extern func_020b0844
    .extern func_020b0808
    .extern func_ov036_021fcfa0
    .extern data_020c9670

    .global func_ov036_02203c44
func_ov036_02203c44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r0, [r8, #0xac]
    mov r7, r1
    cmp r0, #0x0
    beq L_02203d98
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x10
    str r0, [sp, #0x4]
    bl func_ov036_021fd128
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov036_021fdef0
    ldr r0, [r8, #0x40]
    ldr r1, [r8, #0x50]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov ip, r0, lsl #0x1
    ldr r0, [r8, #0x60]
    add r3, ip, #0x1
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    ldr r6, [r8, #0x70]
    ldr r0, L_02203da0
    mov r4, r1, lsr #0x10
    mov r5, r2, lsr #0x10
    mov ip, ip, lsl #0x1
    mov r1, r3, lsl #0x1
    mov r2, #0x0
    str r2, [r0, #0x0]
    ldr r9, [r8, #0x30]
    ldr lr, [r8, #0x20]
    ldr r3, [r8, #0x10]
    ldr r2, L_02203da4
    str r3, [r0, #0x2c]
    str lr, [r0, #0x2c]
    str r9, [r0, #0x2c]
    ldrsh r0, [r2, ip]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldr r2, L_02203da4
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    mov r0, r5, asr #0x4
    mov r0, r0, lsl #0x1
    mov r3, r0, lsl #0x1
    add r0, r0, #0x1
    mov r1, r0, lsl #0x1
    ldr r2, L_02203da4
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r0, L_02203da8
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    ldr r4, [r8, #0xa0]
    b L_02203d84
L_02203d74:
    mov r0, r4
    mov r1, r7
    bl func_ov036_021fcfa0
    ldr r4, [r4, #0x8]
L_02203d84:
    cmp r4, #0x0
    bne L_02203d74
    ldr r0, L_02203dac
    mov r1, #0x1
    str r1, [r0, #0x0]
L_02203d98:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02203da0: .word 0x4000444
L_02203da4: .word data_020c9670
L_02203da8: .word 0x400046c
L_02203dac: .word 0x4000448
    .size func_ov036_02203c44, .-func_ov036_02203c44

