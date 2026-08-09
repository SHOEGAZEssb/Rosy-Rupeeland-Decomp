.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b0e4
func_ov095_0221b0e4:
    add r0, r0, #0x18
    bx lr
.size func_ov095_0221b0e4, . - func_ov095_0221b0e4
