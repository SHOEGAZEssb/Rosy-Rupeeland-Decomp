.text

/* Exact fallback; see src/overlays/ov026/overlay026_periodic_spawn.c. */
.extern data_020c9670
.extern data_ov026_02204ad4
.extern TitleRandom_NextBounded
.extern PresentationList_Append
.extern func_ov026_021fe5d8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_0220112c
func_ov026_0220112c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r10, r0
    ldr r0, [r10, #0x324]
    add r0, r0, #0x1
    str r0, [r10, #0x324]
    cmp r0, #0x2
    ble L_02201268
    add r0, r10, #0x3a4
    mov r2, #0x0
    add r0, r0, #0x400
    mov r1, #0x1000
    str r2, [r10, #0x324]
    bl TitleRandom_NextBounded
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    ldr r1, L_02201270
    mov r2, r2, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r5, [r1, r2]
    ldrsh r2, [r1, r0]
    ldr r0, L_02201274
    mov r1, #0x0
    umull r7, r6, r5, r0
    mla r6, r5, r1, r6
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r5, r5, asr #0x1f
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    mla r6, r5, r0, r6
    adds r7, r7, #0x800
    adc r5, r6, #0x0
    mov r6, r7, lsr #0xc
    adds r2, r4, #0x800
    orr r6, r6, r5, lsl #0x14
    adc r0, r3, #0x0
    mov r5, r2, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    ldr r1, L_02201278
    ldr r3, L_0220127c
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    movs r7, r0
    beq L_0220125c
    ldr r2, [r10, #0x160]
    add r0, r10, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1000
    ldr r8, [r2, #0x20]
    ldr r9, [r2, #0x13c]
    bl TitleRandom_NextBounded
    add r1, r10, #0x3a4
    mov r4, r0
    add r0, r1, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    str r5, [sp, #0x0]
    mov r1, r4, lsl #0x4
    str r1, [sp, #0x4]
    mov r0, r0, lsl #0x4
    str r0, [sp, #0x8]
    mov r0, r9, lsl #0xa
    rsb r1, r0, #0x0
    ldr r0, L_02201280
    add r2, r8, r1
    ldr r1, [r10, #0x15c]
    add r3, r2, r0
    mov r0, r7
    mov r2, r6
    bl func_ov026_021fe5d8
    mov r7, r0
L_0220125c:
    mov r1, r7
    add r0, r10, #0x314
    bl PresentationList_Append
L_02201268:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_02201270: .word data_020c9670
L_02201274: .word 0x19a
L_02201278: .word data_ov026_02204ad4
L_0220127c: .word gHeapContext
L_02201280: .word 0xfffffe66
.size func_ov026_0220112c, .-func_ov026_0220112c

