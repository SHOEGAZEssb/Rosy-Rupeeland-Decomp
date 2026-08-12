.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_direction_query.c.
.extern gSystemState

.global func_ov090_0221aab8
func_ov090_0221aab8:
    ldr r0, .L_0221ab28
    ldrh r0, [r0, #0x1a]
    tst r0, #0x20
    beq .L_0221aae4
    tst r0, #0x40
    movne r0, #0x3
    bxne lr
    tst r0, #0x80
    movne r0, #0x1
    moveq r0, #0x2
    bx lr
.L_0221aae4:
    tst r0, #0x10
    beq .L_0221ab08
    tst r0, #0x40
    movne r0, #0x5
    bxne lr
    tst r0, #0x80
    movne r0, #0x7
    moveq r0, #0x6
    bx lr
.L_0221ab08:
    tst r0, #0x40
    movne r0, #0x4
    bxne lr
    tst r0, #0x80
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    bx lr
.L_0221ab28: .word gSystemState
.size func_ov090_0221aab8, . - func_ov090_0221aab8
