.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213d54
func_ov083_02213d54:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov083_02213d54, . - func_ov083_02213d54
