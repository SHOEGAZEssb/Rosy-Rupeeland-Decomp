.text

/* Exact fallback; see src/overlays/ov027/overlay027_motion_renderer.c. */
.extern data_ov027_021fe9a4
.extern data_ov027_021fe9d4
.extern func_ov027_021fd0f0
.extern func_ov027_021fd150


    .global func_ov027_021fd834
func_ov027_021fd834:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r9, r0
    ldr r6, [r9, #0x70]
    cmp r6, #0x0
    ble L_021fd9a8
    ldr r5, L_021fd9b0
    mov r0, #0x0
    str r0, [r5, #0x0]
    ldr r4, [r9, #0x30]
    ldr r3, [r9, #0x20]
    ldr r2, [r9, #0x10]
    mov r1, #0x1000
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r4, [r5, #0x2c]
    str r6, [r5, #0x28]
    str r6, [r5, #0x28]
    str r1, [r5, #0x28]
    mov r1, #0x1f
    str r1, [sp, #0x0]
    mov r1, r0
    mov r3, r0
    mov r2, #0x3
    str r0, [sp, #0x4]
    bl func_ov027_021fd0f0
    add r1, r5, #0xbc
    mov r7, #0x0
    ldr r0, L_021fd9b4
    str r7, [r1, #0x0]
    str r0, [r1, #-0x80]
    ldr r6, L_021fd9b8
    sub r4, r1, #0x6c
    mov r5, r7
    mov r10, #0xc
L_021fd8c0:
    mul r0, r7, r10
    add r8, r6, r0
    ldrsh r0, [r6, r0]
    ldrsh r1, [r8, #0x2]
    mov r2, r5
    bl func_ov027_021fd150
    ldrh r1, [r8, #0x4]
    ldrh r0, [r8, #0x6]
    add r7, r7, #0x1
    cmp r7, #0x4
    orr r0, r1, r0, lsl #0x10
    str r0, [r4, #0x0]
    ldrh r1, [r8, #0x8]
    ldrh r0, [r8, #0xa]
    orr r0, r1, r0, lsl #0x10
    str r0, [r4, #0x0]
    blt L_021fd8c0
    ldr r1, L_021fd9bc
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r1, #0xc
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x1
    str r0, [sp, #0x4]
    bl func_ov027_021fd0f0
    ldr r1, L_021fd9c0
    mov r7, #0x0
    str r7, [r1, #0x0]
    ldrh r0, [r9, #0xb4]
    str r0, [r1, #-0x80]
    ldr r6, L_021fd9c4
    sub r4, r1, #0x6c
    mvn r5, #0x1f
    mov r9, #0xc
L_021fd950:
    mul r0, r7, r9
    add r8, r6, r0
    ldrsh r0, [r6, r0]
    ldrsh r1, [r8, #0x2]
    mov r2, r5
    bl func_ov027_021fd150
    ldrh r1, [r8, #0x4]
    ldrh r0, [r8, #0x6]
    add r7, r7, #0x1
    cmp r7, #0x4
    orr r0, r1, r0, lsl #0x10
    str r0, [r4, #0x0]
    ldrh r1, [r8, #0x8]
    ldrh r0, [r8, #0xa]
    orr r0, r1, r0, lsl #0x10
    str r0, [r4, #0x0]
    blt L_021fd950
    ldr r1, L_021fd9bc
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
L_021fd9a8:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd9b0: .word 0x4000444
L_021fd9b4: .word 0x7fff
L_021fd9b8: .word data_ov027_021fe9a4
L_021fd9bc: .word 0x4000504
L_021fd9c0: .word 0x4000500
L_021fd9c4: .word data_ov027_021fe9d4
.size func_ov027_021fd834, .-func_ov027_021fd834

