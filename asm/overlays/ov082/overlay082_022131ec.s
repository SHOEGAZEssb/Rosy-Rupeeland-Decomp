.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_022131ec
func_ov082_022131ec:
    mov r0, #0x20000
    bx lr
.size func_ov082_022131ec, . - func_ov082_022131ec
