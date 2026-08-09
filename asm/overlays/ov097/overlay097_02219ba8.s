.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219ba8
func_ov097_02219ba8:
    mov r0, #0xc0000
    bx lr
.size func_ov097_02219ba8, . - func_ov097_02219ba8
