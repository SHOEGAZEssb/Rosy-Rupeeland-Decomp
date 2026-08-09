.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218b80
func_ov091_02218b80:
    mov r0, #0x40000
    bx lr
.size func_ov091_02218b80, . - func_ov091_02218b80
