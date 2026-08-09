.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b13c
func_ov095_0221b13c:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov095_0221b13c, . - func_ov095_0221b13c
