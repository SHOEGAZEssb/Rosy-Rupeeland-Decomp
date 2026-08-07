    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
.global func_ov017_021fea00
func_ov017_021fea00:
    stmib r0, {r1, r2, r3}
    bx lr
    .size func_ov017_021fea00, . - func_ov017_021fea00
