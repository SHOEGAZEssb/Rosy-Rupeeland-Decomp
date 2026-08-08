.text

/* Exact fallback; see src/overlays/ov027/overlay027_state_records.c. */
.extern data_ov027_021fee60


    .global func_ov027_021fd9c8
func_ov027_021fd9c8:
    ldr r2, L_021fd9e4
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fd9e4: .word data_ov027_021fee60
.size func_ov027_021fd9c8, .-func_ov027_021fd9c8

