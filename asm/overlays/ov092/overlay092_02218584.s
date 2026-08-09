.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_02218584
func_ov092_02218584:
    add r0, r0, #0x200
    ldrsh r1, [r0, #0x86]
    cmp r1, #0x0
    moveq r1, #0x0
    streqh r1, [r0, #0x88]
    moveq r1, #0x1
    streqh r1, [r0, #0x86]
    bx lr
.size func_ov092_02218584, . - func_ov092_02218584
