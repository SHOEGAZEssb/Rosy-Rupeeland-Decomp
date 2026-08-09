.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214620
func_ov076_02214620:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov076_02214620, . - func_ov076_02214620
