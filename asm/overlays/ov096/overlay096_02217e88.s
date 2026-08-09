.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_02217e88
func_ov096_02217e88:
    ldrb r1, [r0, #0x298]
    cmp r1, #0x0
    ldreqb r0, [r0, #0x299]
    cmpeq r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov096_02217e88, . - func_ov096_02217e88
