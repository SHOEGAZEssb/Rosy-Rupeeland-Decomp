    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_progress.c. */
.global func_ov017_021fe160
func_ov017_021fe160:
    ldrh r2, [r0, #0x9e]
    ldrh r1, [r0, #0x9c]
    cmp r2, r1
    addlo r1, r2, #0x1
    strloh r1, [r0, #0x9e]
    bx lr
    .size func_ov017_021fe160, . - func_ov017_021fe160
