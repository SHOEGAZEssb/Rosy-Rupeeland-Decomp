.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_02218380
func_ov092_02218380:
    add r0, r0, r2, lsl #0x2
    cmp r1, #0x0
    ldreq r0, [r0, #0x3cc]
    ldrne r0, [r0, #0x5cc]
    bx lr
.size func_ov092_02218380, . - func_ov092_02218380
