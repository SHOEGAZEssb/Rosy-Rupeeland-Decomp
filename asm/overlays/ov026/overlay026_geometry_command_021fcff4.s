.text

/* Exact fallback; see src/overlays/ov026/overlay026_geometry_command.c. */



    .global func_ov026_021fcff4
func_ov026_021fcff4:
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fd014
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fd014: .word 0x40004c0
.size func_ov026_021fcff4, .-func_ov026_021fcff4

