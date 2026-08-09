.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_022130a0
func_ov082_022130a0:
    mov r0, #0x10
    bx lr
.size func_ov082_022130a0, . - func_ov082_022130a0
