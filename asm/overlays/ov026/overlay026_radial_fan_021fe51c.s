.text

/* Exact fallback; see src/overlays/ov026/overlay026_radial_fan.c. */
.extern data_ov026_022048f8
.extern func_02002728


    .global func_ov026_021fe51c
func_ov026_021fe51c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe53c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    bl func_02002728
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe53c: .word data_ov026_022048f8
.size func_ov026_021fe51c, .-func_ov026_021fe51c

