.text

/* Exact fallback; see src/overlays/ov026/overlay026_geometry_command.c. */
.extern data_020c9670
.extern func_01ff88c4
.extern func_020b0808
.extern func_020b0844
.extern func_020b0880
.extern func_ov026_021fcff4


    .global func_ov026_021fcea4
func_ov026_021fcea4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldr r0, [r6, #0xac]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r6, #0x40]
    ldr r3, [r6, #0x50]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    ldr r2, [r6, #0x60]
    add r0, r1, #0x1
    ldr r5, [r6, #0x70]
    mov r3, r3, lsl #0x10
    mov r4, r2, lsl #0x10
    ldr r2, L_021fcfe0
    mov r7, #0x0
    str r7, [r2, #0x0]
    ldr ip, L_021fcfe4
    mov lr, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldr r9, [r6, #0x30]
    ldr r8, [r6, #0x20]
    ldr r7, [r6, #0x10]
    ldrsh r0, [ip, lr]
    str r7, [r2, #0x2c]
    str r8, [r2, #0x2c]
    ldrsh r1, [ip, r1]
    mov r7, r3, lsr #0x10
    str r9, [r2, #0x2c]
    mov r4, r4, lsr #0x10
    bl func_020b0880
    mov r0, r7, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fcfe4
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fcfe4
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r0, L_021fcfe8
    mov r2, #0x0
    str r5, [r0, #0x0]
    str r5, [r0, #0x0]
    str r5, [r0, #0x0]
    ldrh r0, [r6, #0xa4]
    ldrh r1, [r6, #0xa6]
    bl func_ov026_021fcff4
    ldrh r3, [r6, #0xa8]
    ldrh r2, [r6, #0xaa]
    ldr r1, L_021fcfec
    mov r0, #0xc
    orr r2, r3, r2, lsl #0x10
    str r2, [r1, #0x0]
    ldr r2, [r6, #0xa0]
    ldr r1, [r6, #0x9c]
    mul r4, r2, r0
    ldr r3, [r1, #0x24]
    mov r0, #0x3
    add r1, r3, r4
    ldr r1, [r1, #0x4]
    ldr r2, [r3, r4]
    add r1, r3, r1
    bl func_01ff88c4
    ldr r0, L_021fcff0
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fcfe0: .word 0x4000444
L_021fcfe4: .word data_020c9670
L_021fcfe8: .word 0x400046c
L_021fcfec: .word 0x40004c4
L_021fcff0: .word 0x4000448
.size func_ov026_021fcea4, .-func_ov026_021fcea4

