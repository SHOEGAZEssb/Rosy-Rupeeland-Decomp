.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_022195e0
func_ov097_022195e0:
    ldr r0, .L_022195e8
    bx lr
.L_022195e8: .word 0x10e000
.size func_ov097_022195e0, . - func_ov097_022195e0
