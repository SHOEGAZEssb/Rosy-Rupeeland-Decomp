.text

/* Exact fallback; see src/overlays/ov026/overlay026_lifecycle_tail.c. */
.extern data_ov026_022048b8
.extern func_02095308
.extern Heap_Free


    .global func_ov026_02204070
func_ov026_02204070:
    stmdb sp!, {r4, lr}
    ldr r1, L_02204094
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02204094: .word data_ov026_022048b8
.size func_ov026_02204070, .-func_ov026_02204070

