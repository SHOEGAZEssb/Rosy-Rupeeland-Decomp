.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b1ec
func_ov095_0221b1ec:
    mov r0, #0x20000
    bx lr
.size func_ov095_0221b1ec, . - func_ov095_0221b1ec
