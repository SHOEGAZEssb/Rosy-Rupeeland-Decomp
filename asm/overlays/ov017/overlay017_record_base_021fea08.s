    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
.global func_ov017_021fea08
func_ov017_021fea08:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
    .size func_ov017_021fea08, . - func_ov017_021fea08
