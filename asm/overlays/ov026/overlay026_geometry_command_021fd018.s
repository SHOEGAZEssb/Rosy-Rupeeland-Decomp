.text

/* Exact fallback; see src/overlays/ov026/overlay026_geometry_command.c. */



    .global func_ov026_021fd018
func_ov026_021fd018:
    ldr r1, [r0, #0x0]
    tst r1, #0x3
    ldrne r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    sub r0, r1, r0
    bx lr
.size func_ov026_021fd018, .-func_ov026_021fd018

