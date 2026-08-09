.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_02218708
func_ov093_02218708:
    ldrb r0, [r0, #0x1fc]
    cmp r0, #0x9
    moveq r0, #0x3
    movne r0, #0x0
    bx lr
.size func_ov093_02218708, . - func_ov093_02218708
