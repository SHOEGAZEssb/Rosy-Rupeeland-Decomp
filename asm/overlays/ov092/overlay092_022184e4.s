.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_022184e4
func_ov092_022184e4:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x2
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x5
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x1
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x6
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov092_022184e4, . - func_ov092_022184e4
