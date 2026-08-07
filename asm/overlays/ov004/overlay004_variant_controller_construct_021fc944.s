    .text
    .extern func_02091e28
    .extern func_02027f94
    .extern func_02027828
    .extern Heap_Alloc
    .extern func_ov026_021ff8a0
    .extern func_ov004_021fb6e4
    .extern data_ov004_021fcdbc
    .extern data_ov004_021fcddc
    .extern gHeapContext
    .extern data_ov004_021fcd48

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov004/overlay004_variant_controller_construct.c. */
    .global func_ov004_021fc944
func_ov004_021fc944: ; 0x021fc944
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02091e28
    ldr r0, L_021fc9ec
    cmp r4, #0x1
    movlt r4, #0x1
    str r0, [r5, #0x0]
    cmp r4, #0xa
    str r4, [r5, #0x58]
    movgt r0, #0x0
    strgt r0, [r5, #0x5c]
    bgt L_021fc994
    bl func_02027f94
    sub r1, r4, #0x1
    bl func_02027828
    str r0, [r5, #0x5c]
    bl func_02027f94
    ldr r1, [r5, #0x58]
    bl func_02027828
L_021fc994:
    str r0, [r5, #0x60]
    ldr r0, L_021fc9f0
    ldr r1, L_021fc9f4
    ldr r3, L_021fc9f8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fc9c4
    ldr r2, [r5, #0x5c]
    ldr r3, [r5, #0x60]
    mov r1, r4
    bl func_ov026_021ff8a0
L_021fc9c4:
    str r0, [r5, #0x54]
    ldr r0, [r5, #0x20]
    ldr r1, L_021fc9fc
    orr r0, r0, #0x400
    str r0, [r5, #0x20]
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fc9ec: .word data_ov004_021fcdbc
L_021fc9f0: .word 0x7c4
L_021fc9f4: .word data_ov004_021fcddc
L_021fc9f8: .word gHeapContext
L_021fc9fc: .word data_ov004_021fcd48
    .size func_ov004_021fc944, .-func_ov004_021fc944
