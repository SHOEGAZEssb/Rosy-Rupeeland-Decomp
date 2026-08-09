.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_022146e0
func_ov076_022146e0:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov076_022146e0, . - func_ov076_022146e0
