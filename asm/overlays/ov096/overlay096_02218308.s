.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_02218308
func_ov096_02218308:
    mov r0, #0x20000
    bx lr
.size func_ov096_02218308, . - func_ov096_02218308
