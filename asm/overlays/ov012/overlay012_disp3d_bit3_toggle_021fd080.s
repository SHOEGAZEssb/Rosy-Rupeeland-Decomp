    .text
/* Exact compiler-resistant fallback; see src/overlays/ov012/overlay012_disp3d_bit3_toggle.c. */
    .global func_ov012_021fd080
func_ov012_021fd080:
    cmp r0, #0
    ldreq r2, .Lreg
    ldreq r0, .Ldisable_mask
    ldreqh r1, [r2]
    andeq r0, r1, r0
    streqh r0, [r2]
    bxeq lr
    ldr r1, .Lreg
    ldrh r0, [r1]
    bic r0, r0, #0x3000
    orr r0, r0, #8
    strh r0, [r1]
    bx lr
.Lreg:
    .word 0x04000060
.Ldisable_mask:
    .word 0x0000cff7
    .size func_ov012_021fd080, . - func_ov012_021fd080
