.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern func_0209548c


    .global func_ov025_02202c3c
func_ov025_02202c3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0209548c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov025_02202c3c, .-func_ov025_02202c3c

