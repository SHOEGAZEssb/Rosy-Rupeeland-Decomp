.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b214
func_ov095_0221b214:
    mov r0, #0x1800
    bx lr
.size func_ov095_0221b214, . - func_ov095_0221b214
