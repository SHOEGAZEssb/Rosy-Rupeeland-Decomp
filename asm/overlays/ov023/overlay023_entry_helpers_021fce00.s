.text

/* Exact fallback; see src/overlays/ov023/overlay023_entry_helpers.c. */
.extern func_02071ea4

    .global func_ov023_021fce00
func_ov023_021fce00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4
    bl func_02071ea4
    mov r1, #0x0
    str r1, [r4, #0x0]
    str r1, [r4, #0x10]
    strh r1, [r4, #0x16]
    mov r0, r4
    strh r1, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov023_021fce00, .-func_ov023_021fce00

