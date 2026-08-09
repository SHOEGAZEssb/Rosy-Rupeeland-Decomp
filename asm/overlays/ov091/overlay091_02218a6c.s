.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218a6c
func_ov091_02218a6c:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0xe
    moveq r0, #0x2
    bxeq lr
    cmp r0, #0xc
    moveq r0, #0x4
    movne r0, #0x0
    bx lr
.size func_ov091_02218a6c, . - func_ov091_02218a6c
