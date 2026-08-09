.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_022130b0
func_ov082_022130b0:
    mov r0, #0xc0000
    bx lr
.size func_ov082_022130b0, . - func_ov082_022130b0
