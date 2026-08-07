    .text

/* Exact fallback; see src/overlays/ov017/overlay017_geometry_engine.c. */
.global func_ov017_021fd680
func_ov017_021fd680:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, L_021fd6ac
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
L_021fd6ac: .word 0x400048c
    .size func_ov017_021fd680, . - func_ov017_021fd680

