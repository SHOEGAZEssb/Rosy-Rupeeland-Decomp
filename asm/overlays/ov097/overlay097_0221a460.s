.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_0221a460
func_ov097_0221a460:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov097_0221a460, . - func_ov097_0221a460
