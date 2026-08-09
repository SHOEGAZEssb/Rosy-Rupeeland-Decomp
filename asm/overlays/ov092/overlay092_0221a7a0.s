.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221a7a0
func_ov092_0221a7a0:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov092_0221a7a0, . - func_ov092_0221a7a0
