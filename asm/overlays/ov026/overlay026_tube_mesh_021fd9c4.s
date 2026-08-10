.text

/* Exact fallback; see src/overlays/ov026/overlay026_tube_mesh.c. */
.extern data_020c9670
.extern data_ov026_022048e8
.extern data_ov026_02204a48
.extern func_02002700
.extern Graphics3DResourceBinding_GetTextureFormat
.extern Graphics3DResourceBinding_GetTextureWidthClass
.extern Graphics3DResourceBinding_GetTextureHeightClass
.extern func_020afddc
.extern func_020afe00
.extern func_020afe28
.extern func_020afe64
.extern func_020afebc
.extern func_020aff38
.extern func_020aff78
.extern func_020affc0
.extern func_020b241c
.extern func_020b24cc
.extern func_020b4554
.extern func_ov026_021fd018
.extern gHeapContext


    .global func_ov026_021fd9c4
func_ov026_021fd9c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    ldr r4, L_021fdcc0
    mov r6, r0
    str r4, [r6, #0x0]
    str r3, [sp, #0x14]
    str r1, [r6, #0x4]
    mov r5, r2
    ldr r1, L_021fdcc4
    ldr r3, L_021fdcc8
    mov r0, #0x300
    mov r2, #0x4
    bl func_02002700
    str r0, [r6, #0x28]
    mov r1, r0
    add r0, r6, #0x14
    mov r2, #0x300
    bl func_020b24cc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    mov r0, #0x8000
    str r0, [sp, #0x8]
    add r0, r6, #0x14
    mov r2, #0x0
    mov r3, #0x2
    bl func_020afebc
    ldr r8, [r6, #0x4]
    mov r0, r8
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r7, r0
    ldr r0, [r6, #0x4]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r4, r0
    mov r0, r8
    bl Graphics3DResourceBinding_GetTextureHeightClass
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r2, [r8, #0x10]
    mov r3, r4
    ldr r4, [r2, #0xc]
    mov r1, r7
    add r0, r6, #0x14
    mov r2, #0x1
    str r4, [sp, #0x10]
    bl func_020afe64
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x14]
    ldr r4, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r2, r0
    mov r1, r4
    add r0, r6, #0x14
    bl func_020afe28
    add r0, r6, #0x14
    mov r1, #0x2
    bl func_020afe00
    mov r0, r5, lsl #0x12
    str r0, [sp, #0x18]
    mov r0, r5, lsl #0xa
    rsb r0, r0, #0x0
    sub r0, r0, #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r4, #0x0
    str r0, [sp, #0x20]
L_021fdae0:
    mov r1, r4, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, L_021fdccc
    mov r1, r2, lsl #0x1
    ldrsh r10, [r0, r1]
    ldr r3, L_021fdcd0
    add r0, r0, r2, lsl #0x1
    umull r11, r3, r10, r3
    adds r5, r11, #0x800
    mov r2, #0x0
    mov r11, r2
    mla r3, r10, r11, r3
    ldr r11, L_021fdcd0
    mov r9, r10, asr #0x1f
    mla r3, r9, r11, r3
    mov r11, r2
    ldrsh r8, [r0, #0x2]
    mov r5, r5, lsr #0xc
    adc r3, r3, r11
    orr r5, r5, r3, lsl #0x14
    mov r3, r5, lsl #0x10
    mov r11, r3, asr #0x10
    ldr r3, L_021fdcd0
    mov r1, r4, lsl #0x14
    umull ip, r3, r8, r3
    adds r5, ip, #0x800
    mov ip, r2
    mla r3, r8, ip, r3
    ldr ip, L_021fdcd0
    mov r7, r8, asr #0x1f
    mla r3, r7, ip, r3
    mov ip, r2
    mov r5, r5, lsr #0xc
    adc r3, r3, ip
    orr r5, r5, r3, lsl #0x14
    mov r3, r5, lsl #0x10
    mov r5, r3, asr #0x10
    ldr r3, L_021fdcd4
    mov r0, r1, asr #0x3
    umull lr, ip, r10, r3
    mov r3, r2
    mla ip, r10, r3, ip
    ldr r3, L_021fdcd4
    add r0, r1, r0, lsr #0x1c
    mla ip, r9, r3, ip
    adds r9, lr, #0x800
    mov r3, r2
    adc r3, ip, r3
    mov r9, r9, lsr #0xc
    orr r9, r9, r3, lsl #0x14
    mov r3, r9, lsl #0x10
    mov r9, r3, asr #0x10
    ldr r3, L_021fdcd4
    mov r0, r0, asr #0x4
    str r0, [sp, #0x1c]
    mov ip, r2
    umull r10, r3, r8, r3
    mla r3, r8, ip, r3
    ldr r8, L_021fdcd4
    ldr r1, [sp, #0x1c]
    mla r3, r7, r8, r3
    adds r8, r10, #0x800
    mov r7, r2
    adc r3, r3, r7
    mov r7, r8, lsr #0xc
    orr r7, r7, r3, lsl #0x14
    mov r3, r7, lsl #0x10
    add r0, r6, #0x14
    mov r7, r3, asr #0x10
    bl func_020aff78
    add r0, r6, #0x14
    mov r1, r9
    mov r2, #0x0
    mov r3, r7
    bl func_020affc0
    add r0, r6, #0x14
    mov r1, r11
    mov r2, #0x0
    mov r3, r5
    bl func_020aff38
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x18]
    add r0, r6, #0x14
    bl func_020aff78
    mov r1, r9
    mov r3, r7
    add r0, r6, #0x14
    mov r2, #0x0
    bl func_020affc0
    ldr r2, [sp, #0x20]
    mov r1, r11
    mov r3, r5
    add r0, r6, #0x14
    bl func_020aff38
    add r4, r4, #0x1
    cmp r4, #0x10
    ble L_021fdae0
    add r0, r6, #0x14
    bl func_020afddc
    add r0, r6, #0x14
    bl func_020b241c
    ldr r4, [r6, #0x1c]
    add r0, r6, #0x14
    bl func_ov026_021fd018
    mov r1, r0
    mov r0, r4
    bl func_020b4554
    mov r1, #0x0
    ldr r0, [sp, #0x14]
    str r1, [r6, #0x8]
    str r0, [r6, #0xc]
    mov r0, r6
    str r1, [r6, #0x10]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdcc0: .word data_ov026_022048e8
L_021fdcc4: .word data_ov026_02204a48
L_021fdcc8: .word gHeapContext
L_021fdccc: .word data_020c9670
L_021fdcd0: .word 0x333
L_021fdcd4: .word 0xfd7
.size func_ov026_021fd9c4, .-func_ov026_021fd9c4

