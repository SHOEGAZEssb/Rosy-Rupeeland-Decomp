.text

/* Exact fallback; see src/overlays/ov036/overlay036_terminal_teardown_thunks.c for documented portable C. */

    .extern func_020720d4

    .global func_ov036_02204d2c
func_ov036_02204d2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov036_02204d2c, .-func_ov036_02204d2c

