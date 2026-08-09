.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221b174
func_ov092_0221b174:
    mov r0, #0x100000
    bx lr
.size func_ov092_0221b174, . - func_ov092_0221b174
