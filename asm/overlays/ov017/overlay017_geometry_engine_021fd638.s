    .text

/* Exact fallback; see src/overlays/ov017/overlay017_geometry_engine.c. */
.global func_ov017_021fd638
func_ov017_021fd638:
    ldr r0, L_021fd648
    mov r1, #0x0
    str r1, [r0, #0x0]
    bx lr
L_021fd648: .word 0x40004a8
    .size func_ov017_021fd638, . - func_ov017_021fd638

