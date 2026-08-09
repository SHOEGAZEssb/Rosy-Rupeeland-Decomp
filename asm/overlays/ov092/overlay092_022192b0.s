.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_022192b0
func_ov092_022192b0:
    add r0, r0, #0x200
    ldrsh r1, [r0, #0x9c]
    cmp r1, #0x2
    moveq r1, #0x32
    streqh r1, [r0, #0x9c]
    bx lr
.size func_ov092_022192b0, . - func_ov092_022192b0
