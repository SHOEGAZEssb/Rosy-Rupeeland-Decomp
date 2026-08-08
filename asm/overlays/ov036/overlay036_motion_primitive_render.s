.text

/* Exact fallback; see src/overlays/ov036/overlay036_motion_primitive_render.c for documented portable C. */

    .extern func_020b0808
    .extern func_ov036_021fd660
    .extern data_020c9670
    .extern data_ov036_02205ad0
    .extern data_ov036_02205be4

    .global func_ov036_021fd4c8
func_ov036_021fd4c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldrh r0, [r10, #0x98]
    ldr r1, [r10, #0x70]
    mov r3, r1, lsl #0x4
    tst r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r3, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r10, #0x60]
    ldr r2, L_021fd644
    mov r0, #0x0
    str r0, [r2, #0x0]
    mov r0, r1, asr #0x4
    mov r1, r0, lsl #0x1
    ldr r7, [r10, #0x30]
    ldr r6, [r10, #0x20]
    ldr r5, [r10, #0x10]
    add r0, r1, #0x1
    str r5, [r2, #0x2c]
    str r6, [r2, #0x2c]
    mov r5, r1, lsl #0x1
    str r7, [r2, #0x2c]
    str r3, [r2, #0x28]
    str r3, [r2, #0x28]
    mov r3, #0x1000
    ldr r4, L_021fd648
    mov r1, r0, lsl #0x1
    ldrsh r0, [r4, r5]
    ldrsh r1, [r4, r1]
    str r3, [r2, #0x28]
    bl func_020b0808
    ldr r1, L_021fd64c
    mov r8, #0x0
    str r8, [r1, #0x0]
    ldrsh r0, [r10, #0x9a]
    cmp r0, #0x0
    cmpne r0, #0x1
    beq L_021fd570
    cmp r0, #0x2
    beq L_021fd5c4
    b L_021fd62c
L_021fd570:
    ldrh r2, [r10, #0xb4]
    ldr r0, L_021fd650
    ldr r1, L_021fd654
    str r2, [r0, #0x0]
    ldrsh r0, [r1, #0x90]
    ldrsh r1, [r1, #0x92]
    mov r2, #0x0
    bl func_ov036_021fd660
    ldrh r1, [r10, #0xb6]
    ldr r3, L_021fd650
    ldr r0, L_021fd654
    str r1, [r3, #0x0]
    ldrh r2, [r0, #0x94]
    ldrh r1, [r0, #0x96]
    orr r1, r2, r1, lsl #0x10
    str r1, [r3, #0x14]
    ldrh r1, [r0, #0x98]
    ldrh r0, [r0, #0x9a]
    orr r0, r1, r0, lsl #0x10
    str r0, [r3, #0x14]
    b L_021fd62c
L_021fd5c4:
    ldr r6, L_021fd658
    sub r7, r1, #0x80
    sub r5, r1, #0x6c
    mov r11, r8
    mov r4, #0xc
L_021fd5d8:
    mul r0, r8, r4
    ldrh r1, [r10, #0xb6]
    add r9, r6, r0
    mov r2, r11
    str r1, [r7, #0x0]
    ldrsh r0, [r6, r0]
    ldrsh r1, [r9, #0x2]
    bl func_ov036_021fd660
    ldrh r0, [r10, #0xb4]
    add r8, r8, #0x1
    cmp r8, #0x6
    str r0, [r7, #0x0]
    ldrh r1, [r9, #0x4]
    ldrh r0, [r9, #0x6]
    orr r0, r1, r0, lsl #0x10
    str r0, [r5, #0x0]
    ldrh r1, [r9, #0x8]
    ldrh r0, [r9, #0xa]
    orr r0, r1, r0, lsl #0x10
    str r0, [r5, #0x0]
    blt L_021fd5d8
L_021fd62c:
    ldr r1, L_021fd65c
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd644: .word 0x4000444
L_021fd648: .word data_020c9670
L_021fd64c: .word 0x4000500
L_021fd650: .word 0x4000480
L_021fd654: .word data_ov036_02205ad0
L_021fd658: .word data_ov036_02205be4
L_021fd65c: .word 0x4000504
    .size func_ov036_021fd4c8, .-func_ov036_021fd4c8

