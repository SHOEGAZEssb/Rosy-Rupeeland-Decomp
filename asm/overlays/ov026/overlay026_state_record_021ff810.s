.text

/* Exact fallback; see src/overlays/ov026/overlay026_state_record.c. */
.extern data_ov026_022048b8
.extern func_02095308


    .global func_ov026_021ff810
func_ov026_021ff810:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff82c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff82c: .word data_ov026_022048b8
.size func_ov026_021ff810, .-func_ov026_021ff810

