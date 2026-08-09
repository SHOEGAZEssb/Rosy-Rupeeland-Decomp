.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_0221513c
func_ov075_0221513c:
    ldr r1, [r0, #0x298]
    cmp r1, #0x0
    beq .L_02215168
    add r1, r1, #0x200
    ldrh r1, [r1, #0xa4]
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    movne r0, #0x0
    bxne lr
.L_02215168:
    ldrsh r0, [r0, #0xd6]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov075_0221513c, . - func_ov075_0221513c
