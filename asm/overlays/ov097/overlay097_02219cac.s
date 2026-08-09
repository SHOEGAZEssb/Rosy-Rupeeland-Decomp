.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219cac
func_ov097_02219cac:
    mov r0, #0x800
    bx lr
.size func_ov097_02219cac, . - func_ov097_02219cac
