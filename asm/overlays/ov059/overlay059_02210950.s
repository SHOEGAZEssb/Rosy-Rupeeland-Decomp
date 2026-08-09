.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_02210950
func_ov059_02210950:
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldrsh r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
.size func_ov059_02210950, . - func_ov059_02210950
