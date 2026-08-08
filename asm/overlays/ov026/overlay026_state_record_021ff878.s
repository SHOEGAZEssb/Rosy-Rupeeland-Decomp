.text

/* Exact fallback; see src/overlays/ov026/overlay026_state_record.c. */



    .global func_ov026_021ff878
func_ov026_021ff878:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
.size func_ov026_021ff878, .-func_ov026_021ff878

