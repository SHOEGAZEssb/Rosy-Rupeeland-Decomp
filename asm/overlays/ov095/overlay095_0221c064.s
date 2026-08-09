.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221c064
func_ov095_0221c064:
    mov r0, #0xc0000
    bx lr
.size func_ov095_0221c064, . - func_ov095_0221c064
