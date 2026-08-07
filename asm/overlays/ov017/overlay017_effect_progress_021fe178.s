    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_progress.c. */
.global func_ov017_021fe178
func_ov017_021fe178:
    ldrh r1, [r0, #0x9e]
    ldrh r0, [r0, #0x9c]
    cmp r1, r0
    movhs r0, #0x1
    movlo r0, #0x0
    bx lr
    .size func_ov017_021fe178, . - func_ov017_021fe178
