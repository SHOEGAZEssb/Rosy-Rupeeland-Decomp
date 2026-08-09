.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221a794
func_ov092_0221a794:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov092_0221a794, . - func_ov092_0221a794
