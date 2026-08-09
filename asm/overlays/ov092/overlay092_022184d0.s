.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_022184d0
func_ov092_022184d0:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x8
    moveq r0, #0x5
    movne r0, #0x0
    bx lr
.size func_ov092_022184d0, . - func_ov092_022184d0
