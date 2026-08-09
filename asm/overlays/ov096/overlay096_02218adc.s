.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_02218adc
func_ov096_02218adc:
    mov r0, #0x10
    bx lr
.size func_ov096_02218adc, . - func_ov096_02218adc
