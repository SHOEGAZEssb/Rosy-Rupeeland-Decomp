.text

/* Exact fallback; see src/overlays/ov036/overlay036_render_object.c for documented portable C. */

    .extern func_020b00f0
    .extern func_020b0880
    .extern func_020b0844
    .extern func_020b0808
    .extern func_01ff88c4
    .extern func_ov036_021fd128
    .extern func_ov036_021fd154
    .extern func_ov036_021fd178
    .extern data_020c9670

    .global func_ov036_021fcfa0
func_ov036_021fcfa0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldrh r0, [r7, #0x98]
    tst r0, #0x1
    bne L_021fd110
    ldr r8, [r7, #0x40]
    ldr lr, [r7, #0x50]
    ldr ip, [r7, #0x60]
    ldr r6, [r7, #0x70]
    ldr r5, L_021fd118
    mov r0, #0x0
    str r0, [r5, #0x0]
    ldr r4, [r7, #0x30]
    ldr r3, [r7, #0x20]
    ldr r2, [r7, #0x10]
    mov r0, r8, lsl #0x10
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r4, [r5, #0x2c]
    ldrh r4, [r7, #0x98]
    mov r2, lr, lsl #0x10
    mov r3, ip, lsl #0x10
    tst r4, #0x2
    mov r8, r0, lsr #0x10
    mov r4, r2, lsr #0x10
    mov r5, r3, lsr #0x10
    beq L_021fd018
    mov r0, r1
    bl func_020b00f0
L_021fd018:
    mov r0, r8, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd11c
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd11c
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    mov r0, r5, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd11c
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r0, L_021fd120
    mov r1, #0x0
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    ldr r0, [r7, #0xac]
    mov r2, #0x2
    str r0, [sp, #0x0]
    ldr r0, [r7, #0xb8]
    str r0, [sp, #0x4]
    ldr r0, [r7, #0xa4]
    ldr r3, [r7, #0xa8]
    bl func_ov036_021fd128
    ldrh r0, [r7, #0xbc]
    ldrh r1, [r7, #0xbe]
    mov r2, #0x0
    bl func_ov036_021fd154
    ldrh r0, [r7, #0xc0]
    ldrh r1, [r7, #0xc2]
    mov r2, #0x0
    bl func_ov036_021fd178
    ldr r2, [r7, #0xa0]
    ldr r1, [r7, #0x9c]
    mov r0, #0xc
    mul r4, r2, r0
    ldr r3, [r1, #0x24]
    mov r0, #0x3
    add r1, r3, r4
    ldr r1, [r1, #0x4]
    ldr r2, [r3, r4]
    add r1, r3, r1
    bl func_01ff88c4
    mov r1, #0x1
    ldr r0, L_021fd124
    str r1, [r0, #0x0]
L_021fd110:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd118: .word 0x4000444
L_021fd11c: .word data_020c9670
L_021fd120: .word 0x400046c
L_021fd124: .word 0x4000448
    .size func_ov036_021fcfa0, .-func_ov036_021fcfa0

