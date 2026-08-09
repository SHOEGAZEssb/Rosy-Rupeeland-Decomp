.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219cf8
func_ov097_02219cf8:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x80
    str r1, [r0, #0x260]
    bx lr
.size func_ov097_02219cf8, . - func_ov097_02219cf8
