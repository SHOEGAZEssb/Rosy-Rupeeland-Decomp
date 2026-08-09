.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02213e48
.extern data_ov083_02213e88

.global func_ov083_02213968
func_ov083_02213968:
    ldr r1, .L_022139a8
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x40]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_022139ac
    bne .L_02213998
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02213998:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_022139a8: .word data_ov083_02213e48
.L_022139ac: .word data_ov083_02213e88
.size func_ov083_02213968, . - func_ov083_02213968
