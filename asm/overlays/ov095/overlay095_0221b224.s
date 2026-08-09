.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b224
func_ov095_0221b224:
    mov r0, #0x1a4000
    bx lr
.size func_ov095_0221b224, . - func_ov095_0221b224
