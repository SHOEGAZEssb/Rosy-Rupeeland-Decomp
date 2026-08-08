.text
/* Exact fallback; see src/overlays/ov042/overlay042_late_helpers.c. */
.extern func_02099fb0
    .global func_ov042_02208894
func_ov042_02208894:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov042_02208894, . - func_ov042_02208894
