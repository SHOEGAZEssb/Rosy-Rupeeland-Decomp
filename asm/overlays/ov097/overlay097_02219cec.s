.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219cec
func_ov097_02219cec:
    mov r0, #0x1000
    bx lr
.size func_ov097_02219cec, . - func_ov097_02219cec
