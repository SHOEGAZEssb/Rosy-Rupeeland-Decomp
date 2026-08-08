.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_orbit.c. */



    .global func_ov026_02200d08
func_ov026_02200d08:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov026_02200d08, .-func_ov026_02200d08

