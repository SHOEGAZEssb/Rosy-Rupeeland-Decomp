.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214544
func_ov075_02214544:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr
.size func_ov075_02214544, . - func_ov075_02214544
