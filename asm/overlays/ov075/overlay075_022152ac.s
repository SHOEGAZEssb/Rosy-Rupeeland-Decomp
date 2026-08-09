.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern data_ov075_022172b0

.global func_ov075_022152ac
func_ov075_022152ac:
    ldr r1, .L_022152ec
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x20]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_022152f0
    bne .L_022152dc
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_022152dc:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_022152ec: .word data_ov075_02217290
.L_022152f0: .word data_ov075_022172b0
.size func_ov075_022152ac, . - func_ov075_022152ac
