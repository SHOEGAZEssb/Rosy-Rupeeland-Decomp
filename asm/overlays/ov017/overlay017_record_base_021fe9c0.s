    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
    .extern data_ov017_02201628
.global func_ov017_021fe9c0
func_ov017_021fe9c0:
    ldr r2, L_021fe9dc
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fe9dc: .word data_ov017_02201628
    .size func_ov017_021fe9c0, . - func_ov017_021fe9c0
