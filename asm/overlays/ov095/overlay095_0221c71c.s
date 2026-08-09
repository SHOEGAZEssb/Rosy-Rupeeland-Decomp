.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221c71c
func_ov095_0221c71c:
    mov r0, #0x100000
    bx lr
.size func_ov095_0221c71c, . - func_ov095_0221c71c
