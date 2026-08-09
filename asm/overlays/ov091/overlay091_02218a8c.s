.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218a8c
func_ov091_02218a8c:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov091_02218a8c, . - func_ov091_02218a8c
