.text

/* Exact fallback; see src/overlays/ov035/overlay035_callback_vtable_tail.c for documented portable C. */

    .extern func_02059230
    .extern func_ov035_02202350
    .extern func_ov035_021fce5c
    .extern func_ov035_022028b4
    .extern func_ov035_021fcf30
    .extern func_02095670
    .extern GraphicsResourceSetVariant_Destroy
    .extern PresentationList_DeleteAll
    .extern Heap_Free
    .extern gSoundContext
    .extern gSystemState
    .extern data_ov035_022038f8
    .extern data_ov035_02203af8

    .global func_ov035_02202948
func_ov035_02202948:
    ldr r0, L_02202950
    bx lr
L_02202950: .word 0x47e
    .size func_ov035_02202948, .-func_ov035_02202948

    .global func_ov035_02202954
func_ov035_02202954:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02202974
    cmp r0, #0x1
    beq L_0220299c
    b L_022029bc
L_02202974:
    ldr r0, L_022029c4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_02059230
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220299c:
    ldr r0, [r4, #0x20]
    ldr r1, L_022029c8
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov035_02202350
L_022029bc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022029c4: .word gSoundContext
L_022029c8: .word data_ov035_022038f8
    .size func_ov035_02202954, .-func_ov035_02202954

    .global func_ov035_022029cc
func_ov035_022029cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_022029f4
    cmp r1, #0x1
    beq L_02202a10
    cmp r1, #0x2
    beq L_02202a38
    b L_02202a44
L_022029f4:
    ldr r0, L_02202a54
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    str r0, [r4, #0x4bc]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
L_02202a10:
    ldr r0, [r4, #0x60]
    bl func_ov035_021fce5c
    cmp r0, #0x0
    beq L_02202a44
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202a44
L_02202a38:
    bl func_ov035_022028b4
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02202a44:
    mov r0, r4
    bl func_ov035_022028b4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02202a54: .word gSystemState
    .size func_ov035_022029cc, .-func_ov035_022029cc

    .global func_ov035_02202a58
func_ov035_02202a58:
    ldr r0, L_02202a60
    bx lr
L_02202a60: .word 0x23f
    .size func_ov035_02202a58, .-func_ov035_02202a58

    .global func_ov035_02202a64
func_ov035_02202a64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202a64, .-func_ov035_02202a64

    .global func_ov035_02202a80
func_ov035_02202a80:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202a80, .-func_ov035_02202a80

    .global func_ov035_02202a94
func_ov035_02202a94:
    bx lr
    .size func_ov035_02202a94, .-func_ov035_02202a94

    .global func_ov035_02202a98
func_ov035_02202a98:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202a98, .-func_ov035_02202a98

    .global func_ov035_02202ab4
func_ov035_02202ab4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202ab4, .-func_ov035_02202ab4

    .global func_ov035_02202ac8
func_ov035_02202ac8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202ac8, .-func_ov035_02202ac8

    .global func_ov035_02202ae4
func_ov035_02202ae4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202ae4, .-func_ov035_02202ae4

    .global func_ov035_02202af8
func_ov035_02202af8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202af8, .-func_ov035_02202af8

    .global func_ov035_02202b14
func_ov035_02202b14:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202b14, .-func_ov035_02202b14

    .global func_ov035_02202b28
func_ov035_02202b28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202b28, .-func_ov035_02202b28

    .global func_ov035_02202b44
func_ov035_02202b44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov035_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202b44, .-func_ov035_02202b44

    .global func_ov035_02202b58
func_ov035_02202b58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_02202b58, .-func_ov035_02202b58

    .global func_ov035_02202b70
func_ov035_02202b70:
    stmdb sp!, {r4, lr}
    ldr r1, L_02202b94
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02202b94: .word data_ov035_02203af8
    .size func_ov035_02202b70, .-func_ov035_02202b70

