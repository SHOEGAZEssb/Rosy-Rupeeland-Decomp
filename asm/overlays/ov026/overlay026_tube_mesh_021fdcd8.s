.text

/* Exact fallback; see src/overlays/ov026/overlay026_tube_mesh.c. */
.extern data_ov026_022048e8
.extern func_02002728


    .global func_ov026_021fdcd8
func_ov026_021fdcd8:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdcf8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x28]
    bl func_02002728
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdcf8: .word data_ov026_022048e8
.size func_ov026_021fdcd8, .-func_ov026_021fdcd8

