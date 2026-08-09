.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221a804
func_ov092_0221a804:
    ldr r0, .L_0221a80c
    bx lr
.L_0221a80c: .word 0x309
.size func_ov092_0221a804, . - func_ov092_0221a804
