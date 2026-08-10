.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_helpers.c. */
.extern data_ov027_021feb54
.extern data_ov027_021fef4c
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern func_020918f4
.extern func_02095274
.extern func_ov027_021fd408
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov027_021fe4d4
func_ov027_021fe4d4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    add r1, r4, #0x74
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldr r1, L_021fe554
    ldr r3, L_021fe558
    mov r0, #0xbc
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq L_021fe538
    add r0, r4, #0x1bc
    add r0, r0, #0x400
    mov r1, #0x3a
    bl func_020918f4
    ldr r2, L_021fe55c
    mov r1, #0xc
    mla r2, r0, r1, r2
    ldr r3, [r4, #0x5c0]
    mov r0, r6
    mov r1, r5
    bl func_ov027_021fd408
    mov r6, r0
L_021fe538:
    mov r1, r6
    add r0, r4, #0x140
    bl func_02095274
    ldr r0, [r4, #0x5c0]
    rsb r0, r0, #0x0
    str r0, [r4, #0x5c0]
    ldmia sp!, {r4, r5, r6, pc}
L_021fe554: .word data_ov027_021fef4c
L_021fe558: .word gHeapContext
L_021fe55c: .word data_ov027_021feb54
.size func_ov027_021fe4d4, .-func_ov027_021fe4d4

