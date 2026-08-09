.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02213210
func_ov082_02213210:
    mov r0, #0x100
    bx lr
.size func_ov082_02213210, . - func_ov082_02213210
