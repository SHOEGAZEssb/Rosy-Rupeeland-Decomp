.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02213208
func_ov082_02213208:
    mov r0, #0x400
    bx lr
.size func_ov082_02213208, . - func_ov082_02213208
