.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_02210098
func_ov060_02210098:
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldrsh r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
.size func_ov060_02210098, . - func_ov060_02210098
