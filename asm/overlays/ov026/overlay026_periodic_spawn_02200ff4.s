.text

/* Exact fallback; see src/overlays/ov026/overlay026_periodic_spawn.c. */
.extern gFx32CosSinTable
.extern data_ov026_02204ad4
.extern TitleRandom_NextBounded
.extern PresentationList_Append
.extern func_ov026_021fe5d8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_02200ff4
func_ov026_02200ff4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, [r7, #0x324]
    add r0, r0, #0x1
    str r0, [r7, #0x324]
    cmp r0, #0x1
    ble L_02201114
    add r0, r7, #0x3a4
    mov r2, #0x0
    add r0, r0, #0x400
    mov r1, #0x1000
    str r2, [r7, #0x324]
    bl TitleRandom_NextBounded
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    ldr r1, L_0220111c
    mov r2, r2, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r5, [r1, r2]
    ldrsh r2, [r1, r0]
    ldr r0, L_02201120
    mov r1, #0x0
    umull r8, r6, r5, r0
    mla r6, r5, r1, r6
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r5, r5, asr #0x1f
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    mla r6, r5, r0, r6
    adds r8, r8, #0x800
    adc r6, r6, #0x0
    adds r2, r4, #0x800
    adc r0, r3, #0x0
    mov r4, r2, lsr #0xc
    mov r5, r8, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    ldr r1, L_02201124
    ldr r3, L_02201128
    mov r0, #0xb4
    mov r2, #0x4
    orr r5, r5, r6, lsl #0x14
    bl Heap_Alloc
    movs r6, r0
    beq L_02201108
    add r0, r7, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    add r1, r7, #0x3a4
    mov r8, r0
    add r0, r1, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mov r0, r0, lsl #0x4
    str r4, [sp, #0x0]
    mov r1, r8, lsl #0x4
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r1, [r7, #0x15c]
    mov r0, r6
    mov r2, r5
    mov r3, #0x52
    bl func_ov026_021fe5d8
    mov r6, r0
L_02201108:
    mov r1, r6
    add r0, r7, #0x314
    bl PresentationList_Append
L_02201114:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_0220111c: .word gFx32CosSinTable
L_02201120: .word 0x385
L_02201124: .word data_ov026_02204ad4
L_02201128: .word gHeapContext
.size func_ov026_02200ff4, .-func_ov026_02200ff4

