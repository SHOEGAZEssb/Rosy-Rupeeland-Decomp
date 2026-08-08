.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern data_ov025_02203318
.extern func_02095308
.extern Heap_Free


    .global func_ov025_02202c50
func_ov025_02202c50:
    stmdb sp!, {r4, lr}
    ldr r1, L_02202c74
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02202c74: .word data_ov025_02203318
.size func_ov025_02202c50, .-func_ov025_02202c50

