.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221c05c
func_ov095_0221c05c:
    mov r0, #0x10
    bx lr
.size func_ov095_0221c05c, . - func_ov095_0221c05c
