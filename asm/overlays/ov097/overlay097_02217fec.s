.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221a4c8
.extern data_ov097_0221a500

.global func_ov097_02217fec
func_ov097_02217fec:
    ldr r1, .L_0221802c
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x38]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_02218030
    bne .L_0221801c
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_0221801c:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_0221802c: .word data_ov097_0221a4c8
.L_02218030: .word data_ov097_0221a500
.size func_ov097_02217fec, . - func_ov097_02217fec
