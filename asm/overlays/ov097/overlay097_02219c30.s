.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219c30
func_ov097_02219c30:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov097_02219c30, . - func_ov097_02219c30
