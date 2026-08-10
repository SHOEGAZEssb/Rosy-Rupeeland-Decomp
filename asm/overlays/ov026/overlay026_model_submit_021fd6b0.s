.text

/* Exact fallback; see src/overlays/ov026/overlay026_model_submit.c. */
.extern data_020c9670
.extern func_02070454
.extern func_02070464
.extern Graphics3DResourceBinding_GetTextureFormat
.extern Graphics3DResourceBinding_GetTextureWidthClass
.extern Graphics3DResourceBinding_GetTextureHeightClass
.extern func_020b00f0
.extern func_020b0808
.extern func_020b0844
.extern func_020b0880
.extern func_ov026_021fd900
.extern func_ov026_021fd940
.extern func_ov026_021fd964
.extern func_ov026_021fd990


    .global func_ov026_021fd6b0
func_ov026_021fd6b0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldr r8, [r7, #0x40]
    ldr lr, [r7, #0x50]
    ldr ip, [r7, #0x60]
    ldr r6, [r7, #0x70]
    ldr r5, L_021fd8dc
    mov r0, #0x0
    str r0, [r5, #0x0]
    ldr r4, [r7, #0x30]
    ldr r3, [r7, #0x20]
    ldr r2, [r7, #0x10]
    mov r0, r8, lsl #0x10
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r4, [r5, #0x2c]
    ldr r4, [r7, #0xa0]
    mov r2, lr, lsl #0x10
    mov r3, ip, lsl #0x10
    cmp r4, #0x0
    mov r8, r0, lsr #0x10
    mov r4, r2, lsr #0x10
    mov r5, r3, lsr #0x10
    beq L_021fd71c
    mov r0, r1
    bl func_020b00f0
L_021fd71c:
    mov r0, r8, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd8e0
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd8e0
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    mov r0, r5, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fd8e0
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r0, L_021fd8e4
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    str r6, [r0, #0x0]
    ldr r6, [r7, #0x9c]
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r5, r0
    ldr r0, [r7, #0x9c]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r4, r0
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r2, r4
    mov r3, r0
    mov r0, r5
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r4, [r6, #0x10]
    mov r1, #0x1
    ldr r4, [r4, #0xc]
    str r4, [sp, #0xc]
    bl func_ov026_021fd900
    ldr r0, [r7, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r4, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r1, r0
    mov r0, r4
    bl func_ov026_021fd940
    ldr r0, [r7, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r7, #0x9c]
    add r0, r0, r0, lsl #0x1
    mov r4, r0, lsl #0xc
    ldr r0, [r1, #0x4]
    bl func_02070464
    add r5, r0, r0, lsl #0x1
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x1c
    str r0, [sp, #0x4]
    mov r5, r5, lsl #0xc
    bl func_ov026_021fd964
    mov r0, #0x1
    ldr r3, L_021fd8e8
    mov r1, r5
    str r0, [r3, #0x0]
    rsb r2, r0, #0x8000
    mov r0, #0x0
    str r2, [r3, #-0x80]
    bl func_ov026_021fd990
    ldr r2, L_021fd8ec
    ldr r3, L_021fd8f0
    mov r0, r4
    mov r1, r5
    str r2, [r3, #0x0]
    mov r2, #0x0
    str r2, [r3, #0x0]
    bl func_ov026_021fd990
    ldr r3, L_021fd8f4
    ldr r2, L_021fd8f8
    mov r0, r4
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov026_021fd990
    ldr r0, L_021fd8fc
    ldr r2, L_021fd8f8
    mov r1, #0x0
    str r0, [r2, #0x0]
    str r1, [r2, #-0xc]
    add r0, r0, #0xe000
    str r0, [r2, #0x0]
    str r1, [r2, #0x70]
    mov r0, #0x1
    str r0, [r2, #-0x4c]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd8dc: .word 0x4000444
L_021fd8e0: .word data_020c9670
L_021fd8e4: .word 0x400046c
L_021fd8e8: .word 0x4000500
L_021fd8ec: .word 0xf000f000
L_021fd8f0: .word 0x400048c
L_021fd8f4: .word 0xf0001000
L_021fd8f8: .word 0x4000494
L_021fd8fc: .word 0x10001000
.size func_ov026_021fd6b0, .-func_ov026_021fd6b0

