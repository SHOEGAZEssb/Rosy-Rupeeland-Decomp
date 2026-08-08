.text

/* Exact fallback; see src/overlays/ov036/overlay036_terminal_teardown_thunks.c for documented portable C. */

    .extern func_ov036_021fcf30

    .global func_ov036_02204ca4
func_ov036_02204ca4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov036_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov036_02204ca4, .-func_ov036_02204ca4

