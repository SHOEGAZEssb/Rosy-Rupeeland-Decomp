.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221a774
func_ov092_0221a774:
    mov r0, #0x40000
    bx lr
.size func_ov092_0221a774, . - func_ov092_0221a774
