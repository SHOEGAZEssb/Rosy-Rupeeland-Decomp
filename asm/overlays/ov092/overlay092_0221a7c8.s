.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221a7c8
func_ov092_0221a7c8:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov092_0221a7c8, . - func_ov092_0221a7c8
