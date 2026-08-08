.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern func_0209548c
.extern Heap_Free


    .global func_ov025_02202c20
func_ov025_02202c20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0209548c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov025_02202c20, .-func_ov025_02202c20

