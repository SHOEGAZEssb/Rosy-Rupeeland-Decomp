.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_0221438c
func_ov082_0221438c:
    mov r0, #0x800
    bx lr
.size func_ov082_0221438c, . - func_ov082_0221438c
