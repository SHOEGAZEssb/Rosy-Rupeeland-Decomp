.text

/* Exact fallback; see src/overlays/ov023/overlay023_entry_helpers.c. */
.extern func_02071eb8


    .global func_ov023_021fce2c
func_ov023_021fce2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov023_021fce2c, .-func_ov023_021fce2c

