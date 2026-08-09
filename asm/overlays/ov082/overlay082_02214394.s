.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02214394
func_ov082_02214394:
    mov r0, #0x800
    bx lr
.size func_ov082_02214394, . - func_ov082_02214394
