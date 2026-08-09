.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cba8
.extern data_ov095_0221cc00

.global func_ov095_0221ae14
func_ov095_0221ae14:
    ldr r1, .L_0221ae54
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x58]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_0221ae58
    bne .L_0221ae44
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_0221ae44:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_0221ae54: .word data_ov095_0221cba8
.L_0221ae58: .word data_ov095_0221cc00
.size func_ov095_0221ae14, . - func_ov095_0221ae14
