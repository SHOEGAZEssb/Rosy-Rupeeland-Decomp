.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218c1c
func_ov091_02218c1c:
    ldr r0, .L_02218c24
    bx lr
.L_02218c24: .word 0x309
.size func_ov091_02218c1c, . - func_ov091_02218c1c
