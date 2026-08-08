.text

/* Exact fallback; see src/overlays/ov027/overlay027_lifecycle_tail.c. */
.extern data_ov027_021fee60
.extern func_02095308
.extern func_02095670
.extern func_ov027_021fce00
.extern Heap_Free


    .global func_ov027_021fe7f0
func_ov027_021fe7f0:
    bx lr
.size func_ov027_021fe7f0, .-func_ov027_021fe7f0
    .global func_ov027_021fe7f4
func_ov027_021fe7f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov027_021fce00
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe7f4, .-func_ov027_021fe7f4
    .global func_ov027_021fe810
func_ov027_021fe810:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov027_021fce00
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe810, .-func_ov027_021fe810
    .global func_ov027_021fe824
func_ov027_021fe824:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe824, .-func_ov027_021fe824
    .global func_ov027_021fe840
func_ov027_021fe840:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe840, .-func_ov027_021fe840
    .global func_ov027_021fe854
func_ov027_021fe854:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe854, .-func_ov027_021fe854
    .global func_ov027_021fe870
func_ov027_021fe870:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095670
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov027_021fe870, .-func_ov027_021fe870
    .global func_ov027_021fe884
func_ov027_021fe884:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe8a8
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe8a8: .word data_ov027_021fee60
.size func_ov027_021fe884, .-func_ov027_021fe884

