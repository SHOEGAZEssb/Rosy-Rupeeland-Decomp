.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214688
func_ov076_02214688:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr
.size func_ov076_02214688, . - func_ov076_02214688
