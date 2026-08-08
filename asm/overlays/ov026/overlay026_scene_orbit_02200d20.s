.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_orbit.c. */
.extern func_ov026_02200d38


    .global func_ov026_02200d20
func_ov026_02200d20:
    str r1, [r0, #0x35c]
    str r2, [r0, #0x360]
    ldr ip, L_02200d34
    str r3, [r0, #0x364]
    bx ip
L_02200d34: .word func_ov026_02200d38
.size func_ov026_02200d20, .-func_ov026_02200d20

