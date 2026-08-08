.text
/* Exact fallback; see src/overlays/ov042/overlay042_late_helpers.c. */
    .global func_ov042_02205d74
func_ov042_02205d74:
    strh r1, [r0, #0x3c]
    strh r2, [r0, #0x3e]
    bx lr
    .size func_ov042_02205d74, . - func_ov042_02205d74
