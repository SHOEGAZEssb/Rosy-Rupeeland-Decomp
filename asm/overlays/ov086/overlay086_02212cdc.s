.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212cdc
func_ov086_02212cdc:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov086_02212cdc, . - func_ov086_02212cdc
