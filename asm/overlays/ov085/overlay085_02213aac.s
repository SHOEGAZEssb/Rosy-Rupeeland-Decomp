.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.

.global func_ov085_02213aac
func_ov085_02213aac:
    str r1, [r0, #0x210]
    bx lr
.size func_ov085_02213aac, . - func_ov085_02213aac
