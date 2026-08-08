.text

/* Exact fallback; see src/overlays/ov026/overlay026_state_record.c. */
.extern data_ov026_022048b8


    .global func_ov026_021ff7f0
func_ov026_021ff7f0:
    ldr r2, L_021ff80c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021ff80c: .word data_ov026_022048b8
.size func_ov026_021ff7f0, .-func_ov026_021ff7f0

