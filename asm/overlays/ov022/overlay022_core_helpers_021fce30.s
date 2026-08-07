    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern func_0209548c

.global func_ov022_021fce30
func_ov022_021fce30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0209548c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov022_021fce30, . - func_ov022_021fce30
