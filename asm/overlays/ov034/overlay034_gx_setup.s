.text

/* Exact fallback; see src/overlays/ov034/overlay034_gx_setup.c for documented portable C. */

    .extern func_020b0880
    .extern func_020b0844
    .extern func_020b0808
    .extern func_ov034_021fcf90
    .extern func_ov034_021fcfb4
    .extern func_ov034_021fcfd8
    .extern func_01ff88c4
    .extern gFx32CosSinTable

    .global func_ov034_021fce50
func_ov034_021fce50:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, L_021fcf80
    mov r1, #0x0
    mov r4, r0
    str r1, [ip, #0x0]
    ldr r3, [r4, #0x30]
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x10]
    ldr r2, L_021fcf84
    str r0, [ip, #0x2c]
    str r1, [ip, #0x2c]
    str r3, [ip, #0x2c]
    ldr r0, [r4, #0x40]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    ldr r0, [r4, #0x50]
    ldr r2, L_021fcf84
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    ldr r0, [r4, #0x60]
    ldr r2, L_021fcf84
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r1, [r4, #0x70]
    ldr r0, L_021fcf88
    mov r2, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    ldrh r0, [r4, #0xa4]
    ldrh r1, [r4, #0xa6]
    bl func_ov034_021fcf90
    ldrh r0, [r4, #0xa4]
    mov r1, #0x0
    mov r2, r1
    bl func_ov034_021fcfb4
    ldr r5, [r4, #0xa0]
    ldr r4, [r4, #0x9c]
    mov r1, r5
    mov r0, r4
    bl func_ov034_021fcfd8
    ldr r3, [r4, #0x24]
    mov r1, r0
    mov r0, #0x3
    mov r2, #0xc
    mul r2, r5, r2
    ldr r2, [r3, r2]
    bl func_01ff88c4
    mov r1, #0x1
    ldr r0, L_021fcf8c
    str r1, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
L_021fcf80: .word 0x4000444
L_021fcf84: .word gFx32CosSinTable
L_021fcf88: .word 0x400046c
L_021fcf8c: .word 0x4000448
.size func_ov034_021fce50, .-func_ov034_021fce50

    .global func_ov034_021fcf90
func_ov034_021fcf90:
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fcfb0
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fcfb0: .word 0x40004c0
.size func_ov034_021fcf90, .-func_ov034_021fcf90

    .global func_ov034_021fcfb4
func_ov034_021fcfb4:
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fcfd4
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fcfd4: .word 0x40004c4
.size func_ov034_021fcfb4, .-func_ov034_021fcfb4

    .global func_ov034_021fcfd8
func_ov034_021fcfd8:
    ldr r2, [r0, #0x24]
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x4]
    add r0, r2, r0
    bx lr
.size func_ov034_021fcfd8, .-func_ov034_021fcfd8

    .global func_ov034_021fcff0
func_ov034_021fcff0:
    mov r2, #0x480
    rsb r3, r1, #0x1
    rsb r2, r2, #0x0
    mul r2, r3, r2
    stmia r0, {r1, r2}
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    bx lr
.size func_ov034_021fcff0, .-func_ov034_021fcff0
