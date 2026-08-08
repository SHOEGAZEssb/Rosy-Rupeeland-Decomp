.text

/* Exact fallback; see src/overlays/ov026/overlay026_particle_renderer.c. */
.extern data_020c9670
.extern func_0209189c
.extern func_020918f4
.extern func_ov026_021fd900
.extern func_ov026_021fd964


    .global func_ov026_021fe72c
func_ov026_021fe72c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    ldr r1, [r10, #0xc4]
    ldr r5, L_021fe8f0
    str r1, [r10, #0xc0]
    mov r0, #0x0
    str r0, [r5, #0x0]
    ldr r4, [r10, #0x30]
    ldr r3, [r10, #0x20]
    ldr r2, [r10, #0x10]
    mov r1, #0x1f
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r4, [r5, #0x2c]
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x17
    str r0, [sp, #0x4]
    bl func_ov026_021fd964
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov026_021fd900
    mov r7, #0x0
    ldrh r0, [r10, #0xbc]
    add r6, r5, #0x3c
    ldr r4, L_021fe8f4
    str r0, [r6, #0x0]
    str r7, [r6, #0x80]
    mov r11, r7
    b L_021fe8c8
L_021fe7c4:
    ldr r1, [r10, #0x9c]
    ldr r2, [r10, #0xa0]
    add r0, r10, #0xc0
    bl func_0209189c
    mov r5, r0
    mov r1, #0x1000
    add r0, r10, #0xc0
    bl func_020918f4
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x10
    ldr r2, [r10, #0xa8]
    mov r0, r0, asr #0x4
    mov r9, r0, lsl #0x1
    add r0, r10, #0xc0
    rsb r1, r2, #0x0
    bl func_0209189c
    ldr r1, [r10, #0xac]
    ldr r2, [r10, #0xa8]
    add r8, r1, r0
    add r0, r10, #0xc0
    rsb r1, r2, #0x0
    bl func_0209189c
    mov r1, r8, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    ldr r8, [r10, #0xac]
    ldr r3, [r10, #0xa4]
    mov r1, r9, lsl #0x1
    sub r3, r8, r3
    add r0, r3, r0
    ldrsh r3, [r4, r1]
    add r1, r4, r9, lsl #0x1
    mov r0, r0, lsl #0x10
    smull r9, r8, r3, r5
    adds r9, r9, #0x800
    adc r3, r8, #0x0
    mov r8, r9, lsr #0xc
    orr r8, r8, r3, lsl #0x14
    mov r3, r8, lsl #0x10
    mov r0, r0, asr #0x10
    mov r3, r3, asr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    orr r2, r2, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    str r2, [r6, #0xc]
    orr r3, r0, r3, lsr #0x10
    ldrsh r0, [r1, #0x2]
    add r7, r7, #0x1
    smull r5, r1, r0, r5
    mov r0, #0x800
    adds r5, r5, r0
    adc r0, r1, r11
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r6, #0xc]
    str r3, [r6, #0x14]
    str r2, [r6, #0x14]
L_021fe8c8:
    ldr r0, [r10, #0xb8]
    cmp r7, r0
    blt L_021fe7c4
    ldr r1, L_021fe8f8
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe8f0: .word 0x4000444
L_021fe8f4: .word data_020c9670
L_021fe8f8: .word 0x4000504
.size func_ov026_021fe72c, .-func_ov026_021fe72c

