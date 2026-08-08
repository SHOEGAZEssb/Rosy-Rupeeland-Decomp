.text

/* Exact fallback; see src/overlays/ov026/overlay026_radial_fan.c. */
.extern data_020c9670
.extern data_ov026_022048f8
.extern data_ov026_02204a48
.extern func_02002700
.extern func_020afddc
.extern func_020afe00
.extern func_020afe64
.extern func_020afebc
.extern func_020aff00
.extern func_020aff38
.extern func_020b0000
.extern func_020b241c
.extern func_020b24cc
.extern func_020b4554
.extern func_ov026_021fd018
.extern gHeapContext


    .global func_ov026_021fe2c8
func_ov026_021fe2c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    ldr r2, L_021fe508
    mov r10, r0
    str r2, [r10, #0x0]
    str r1, [r10, #0x1c]
    ldr r1, L_021fe50c
    ldr r3, L_021fe510
    mov r0, #0x200
    mov r2, #0x4
    bl func_02002700
    str r0, [r10, #0x18]
    mov r1, r0
    add r0, r10, #0x4
    mov r2, #0x200
    bl func_020b24cc
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x1f
    mov r1, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x8000
    str r0, [sp, #0x8]
    mov r2, r1
    add r0, r10, #0x4
    mov r3, #0x2
    bl func_020afebc
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r10, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x10]
    bl func_020afe64
    add r0, r10, #0x4
    mov r1, #0x0
    bl func_020afe00
    mov r7, #0x0
    ldr r6, L_021fe514
    ldr r4, L_021fe518
    mov r5, r7
    mov r11, #0x800
L_021fe37c:
    mov r1, r7, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r8, r0, lsl #0x1
    add r0, r7, #0x1
    mov r1, r0, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r9, r0, lsl #0x1
    add r0, r10, #0x4
    mov r1, #0x18
    bl func_020b0000
    mov r1, #0x0
    add r0, r10, #0x4
    mov r2, r1
    mov r3, r1
    bl func_020aff38
    add r0, r10, #0x4
    mov r1, #0x0
    bl func_020b0000
    mov r1, r9, lsl #0x1
    ldrsh r3, [r6, r1]
    add r1, r6, r9, lsl #0x1
    ldrsh r9, [r1, #0x2]
    mov r1, #0x0
    umull lr, ip, r3, r4
    mla ip, r3, r1, ip
    mov r2, r3, asr #0x1f
    mla ip, r2, r4, ip
    adds r2, lr, #0x800
    adc r1, ip, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, r2, lsl #0x10
    mov r2, #0x0
    umull lr, ip, r9, r4
    mla ip, r9, r2, ip
    mov r3, r9, asr #0x1f
    mla ip, r3, r4, ip
    adds r3, lr, #0x800
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mov r2, r3, lsl #0x10
    add r0, r10, #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_020aff00
    mov r1, r8, lsl #0x1
    ldrsh r1, [r6, r1]
    add r2, r6, r8, lsl #0x1
    mov r9, #0x0
    umull r8, r3, r1, r4
    mla r3, r1, r9, r3
    mov ip, r1, asr #0x1f
    mla r3, ip, r4, r3
    adds r8, r8, #0x800
    mov r1, r9
    ldrsh r2, [r2, #0x2]
    adc r1, r3, r1
    mov r3, r8, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    mov r1, r3, lsl #0x10
    mov r3, #0x0
    umull ip, r9, r2, r4
    mla r9, r2, r3, r9
    mov r8, r2, asr #0x1f
    adds r3, ip, r11
    mla r9, r8, r4, r9
    adc r2, r9, r5
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mov r2, r3, lsl #0x10
    add r0, r10, #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_020aff00
    add r7, r7, #0x1
    cmp r7, #0x10
    blt L_021fe37c
    add r0, r10, #0x4
    bl func_020afddc
    add r0, r10, #0x4
    bl func_020b241c
    ldr r4, [r10, #0xc]
    add r0, r10, #0x4
    bl func_ov026_021fd018
    mov r1, r0
    mov r0, r4
    bl func_020b4554
    mov r0, r10
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe508: .word data_ov026_022048f8
L_021fe50c: .word data_ov026_02204a48
L_021fe510: .word gHeapContext
L_021fe514: .word data_020c9670
L_021fe518: .word 0x333
.size func_ov026_021fe2c8, .-func_ov026_021fe2c8

