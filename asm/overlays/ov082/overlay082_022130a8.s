.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_022130a8
func_ov082_022130a8:
    add r0, r0, #0x18
    bx lr
.size func_ov082_022130a8, . - func_ov082_022130a8
