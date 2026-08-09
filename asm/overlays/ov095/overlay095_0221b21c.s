.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b21c
func_ov095_0221b21c:
    mov r0, #0x29
    bx lr
.size func_ov095_0221b21c, . - func_ov095_0221b21c
