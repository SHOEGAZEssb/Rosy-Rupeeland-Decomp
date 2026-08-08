.text

/* Exact fallback; see src/overlays/ov026/overlay026_disc_mesh.c. */
.extern data_020c9670
.extern data_020f4e18
.extern data_ov026_022048c8
.extern data_ov026_02204a40
.extern data_ov026_02204a48
.extern func_02002700
.extern func_02070454
.extern func_02070464
.extern func_02077ca0
.extern func_02077d4c
.extern func_02077d5c
.extern func_02077d6c
.extern func_020afddc
.extern func_020afe00
.extern func_020afe28
.extern func_020afe64
.extern func_020afebc
.extern func_020aff00
.extern func_020aff38
.extern func_020aff78
.extern func_020affc0
.extern func_020b241c
.extern func_020b24cc
.extern func_020b4554
.extern func_ov026_021fd018
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fdd84
func_ov026_021fdd84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x38
    mov r5, r1
    mov r9, r0
    ldr r4, L_021fe1d8
    ldr r1, L_021fe1dc
    ldr r3, L_021fe1e0
    mov r0, #0x18
    mov r2, #0x4
    str r4, [r9, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fddd4
    ldr r3, L_021fe1e4
    ldr r1, L_021fe1e8
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r5
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fddd4:
    ldr r1, L_021fe1ec
    str r0, [r9, #0x4]
    ldr r3, L_021fe1e0
    mov r0, #0x280
    mov r2, #0x4
    bl func_02002700
    str r0, [r9, #0x1c]
    mov r1, r0
    add r0, r9, #0x8
    mov r2, #0x280
    bl func_020b24cc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    mov r0, #0x8000
    str r0, [sp, #0x8]
    add r0, r9, #0x8
    mov r2, #0x0
    mov r3, #0x2
    bl func_020afebc
    ldr r6, [r9, #0x4]
    mov r0, r6
    bl func_02077d4c
    mov r5, r0
    ldr r0, [r9, #0x4]
    bl func_02077d5c
    mov r4, r0
    mov r0, r6
    bl func_02077d6c
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r2, [r6, #0x10]
    mov r3, r4
    ldr r4, [r2, #0xc]
    mov r1, r5
    add r0, r9, #0x8
    mov r2, #0x1
    str r4, [sp, #0x10]
    bl func_020afe64
    ldr r0, [r9, #0x4]
    ldr r1, [r0, #0x14]
    ldr r4, [r1, #0xc]
    bl func_02077d4c
    mov r2, r0
    mov r1, r4
    add r0, r9, #0x8
    bl func_020afe28
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02070454
    add r0, r0, r0, lsr #0x1f
    mov r5, r0, asr #0x1
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02070464
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [sp, #0x1c]
    mov r0, r5, lsl #0xc
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x1c]
    mov r1, #0x0
    mov r11, r0, lsl #0xc
    add r0, r9, #0x8
    bl func_020afe00
    mov r1, #0x0
    ldr r2, L_021fe1f0
    mov r3, r1
    add r0, r9, #0x8
    bl func_020affc0
    ldr r4, L_021fe1f4
    mov r6, #0x0
    mov r0, r4, lsr #0x2
    str r0, [sp, #0x30]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
L_021fdf1c:
    mov r1, r6, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, L_021fe1f8
    mov r1, r2, lsl #0x1
    ldrsh r0, [r0, r1]
    str r0, [sp, #0x18]
    ldr r0, L_021fe1f8
    add r0, r0, r2, lsl #0x1
    ldrsh r7, [r0, #0x2]
    add r0, r6, #0x1
    mov r1, r0, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, L_021fe1f8
    mov r1, r2, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [sp, #0x34]
    str r0, [sp, #0x14]
    ldr r0, L_021fe1f8
    add r0, r0, r2, lsl #0x1
    ldrsh r8, [r0, #0x2]
    add r0, r9, #0x8
    mov r2, r11
    bl func_020aff78
    mov r1, #0x0
    add r0, r9, #0x8
    mov r2, r1
    mov r3, r1
    bl func_020aff38
    ldr r1, [sp, #0x18]
    add r0, r9, #0x8
    mul r10, r5, r1
    ldr r1, [sp, #0x1c]
    umull lr, ip, r10, r4
    mul r2, r1, r7
    mov r1, r2, asr #0x1f
    str r1, [sp, #0x20]
    mov r1, #0x0
    mla ip, r10, r1, ip
    mov r3, r10, asr #0x1f
    mla ip, r3, r4, ip
    adds r3, lr, #0x800
    adc r1, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    ldr r1, [sp, #0x34]
    mov ip, #0x0
    add r1, r1, r3
    umull r10, r3, r2, r4
    mla r3, r2, ip, r3
    ldr r2, [sp, #0x20]
    adds r10, r10, #0x800
    mla r3, r2, r4, r3
    mov r2, ip
    adc r2, r3, r2
    mov r3, r10, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r11, r3
    bl func_020aff78
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x30]
    mov r10, r1, asr #0x1f
    umull lr, ip, r1, r2
    mov r2, r1
    mov r1, #0x0
    mla ip, r2, r1, ip
    ldr r1, [sp, #0x30]
    adds r2, lr, #0x800
    mla ip, r10, r1, ip
    adc r1, ip, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, r2, lsl #0x10
    ldr r2, [sp, #0x2c]
    mov ip, #0x0
    umull r10, r2, r7, r2
    mla r2, r7, ip, r2
    mov r3, r7, asr #0x1f
    ldr r7, [sp, #0x2c]
    add r0, r9, #0x8
    mla r2, r3, r7, r2
    adds r7, r10, #0x800
    mov r3, ip
    adc r2, r2, r3
    mov r3, r7, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mov r2, r3, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_020aff00
    ldr r1, [sp, #0x14]
    add r0, r9, #0x8
    mul ip, r5, r1
    ldr r1, [sp, #0x1c]
    umull r10, lr, ip, r4
    mul r3, r1, r8
    mov r1, #0x0
    mla lr, ip, r1, lr
    mov r7, ip, asr #0x1f
    mla lr, r7, r4, lr
    adds r7, r10, #0x800
    adc r1, lr, #0x0
    mov r7, r7, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    ldr r1, [sp, #0x34]
    mov ip, #0x0
    add r1, r1, r7
    umull r10, r7, r3, r4
    mla r7, r3, ip, r7
    mov r2, r3, asr #0x1f
    mla r7, r2, r4, r7
    adds r3, r10, #0x800
    mov r2, ip
    adc r2, r7, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r11, r3
    bl func_020aff78
    ldr r10, [sp, #0x14]
    ldr r3, [sp, #0x28]
    ldr r1, [sp, #0x14]
    umull r7, r3, r10, r3
    mov ip, r10
    mov r10, #0x0
    mla r3, ip, r10, r3
    ldr r10, [sp, #0x28]
    mov r1, r1, asr #0x1f
    mla r3, r1, r10, r3
    adds r7, r7, #0x800
    adc r1, r3, #0x0
    mov r3, r7, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    mov r1, r3, lsl #0x10
    ldr r3, [sp, #0x24]
    mov r10, #0x0
    umull r7, r3, r8, r3
    mla r3, r8, r10, r3
    mov r2, r8, asr #0x1f
    ldr r8, [sp, #0x24]
    adds r7, r7, #0x800
    mla r3, r2, r8, r3
    mov r2, r10
    adc r2, r3, r2
    mov r3, r7, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mov r2, r3, lsl #0x10
    add r0, r9, #0x8
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_020aff00
    add r6, r6, #0x1
    cmp r6, #0x10
    blt L_021fdf1c
    add r0, r9, #0x8
    bl func_020afddc
    add r0, r9, #0x8
    bl func_020b241c
    ldr r4, [r9, #0x10]
    add r0, r9, #0x8
    bl func_ov026_021fd018
    mov r1, r0
    mov r0, r4
    bl func_020b4554
    mov r0, r9
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe1d8: .word data_ov026_022048c8
L_021fe1dc: .word data_ov026_02204a40
L_021fe1e0: .word gHeapContext
L_021fe1e4: .word 0x611d
L_021fe1e8: .word data_020f4e18
L_021fe1ec: .word data_ov026_02204a48
L_021fe1f0: .word 0xfff
L_021fe1f4: .word 0xccd
L_021fe1f8: .word data_020c9670
.size func_ov026_021fdd84, .-func_ov026_021fdd84

