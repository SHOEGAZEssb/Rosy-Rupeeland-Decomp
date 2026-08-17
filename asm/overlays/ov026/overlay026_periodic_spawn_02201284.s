.text

/* Exact fallback; see src/overlays/ov026/overlay026_periodic_spawn.c. */
.extern data_020c9670
.extern data_ov026_02204ad4
.extern TitleRandom_NextBounded
.extern PresentationList_Append
.extern func_ov026_021fe5d8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_02201284
func_ov026_02201284:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r0, [r8, #0x324]
    mov r7, r1
    add r0, r0, #0x1
    str r0, [r8, #0x324]
    cmp r0, #0x2
    ble L_022013a8
    add r0, r8, #0x3a4
    mov r2, #0x0
    add r0, r0, #0x400
    mov r1, #0x1000
    str r2, [r8, #0x324]
    bl TitleRandom_NextBounded
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    ldr r1, L_022013b0
    mov r2, r2, lsl #0x1
    ldrsh r9, [r1, r2]
    mov r0, r0, lsl #0x1
    ldrsh r2, [r1, r0]
    ldr r0, L_022013b4
    mov r1, #0x0
    umull r5, ip, r9, r0
    umull r4, r3, r2, r0
    adds r5, r5, #0x800
    mla ip, r9, r1, ip
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mov r6, r9, asr #0x1f
    mla ip, r6, r0, ip
    mla r3, r1, r0, r3
    adc r6, ip, #0x0
    adds r1, r4, #0x800
    adc r0, r3, #0x0
    mov r4, r1, lsr #0xc
    mov r5, r5, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    ldr r1, L_022013b8
    ldr r3, L_022013bc
    mov r0, #0xb4
    mov r2, #0x4
    orr r5, r5, r6, lsl #0x14
    bl Heap_Alloc
    movs r6, r0
    beq L_0220139c
    add r0, r8, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    add r1, r8, #0x3a4
    mov r9, r0
    add r0, r1, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    str r4, [sp, #0x0]
    mov r1, r9, lsl #0x4
    mov r0, r0, lsl #0x4
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r1, [r8, #0x15c]
    mov r0, r6
    mov r2, r5
    mov r3, r7
    bl func_ov026_021fe5d8
    mov r6, r0
L_0220139c:
    mov r1, r6
    add r0, r8, #0x314
    bl PresentationList_Append
L_022013a8:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_022013b0: .word data_020c9670
L_022013b4: .word 0x1c2
L_022013b8: .word data_ov026_02204ad4
L_022013bc: .word gHeapContext
.size func_ov026_02201284, .-func_ov026_02201284

