.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213d70
func_ov080_02213d70:
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov080_02213d70, . - func_ov080_02213d70
