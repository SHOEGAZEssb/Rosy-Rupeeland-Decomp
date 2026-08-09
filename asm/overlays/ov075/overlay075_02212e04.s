.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern data_ov075_02216cf0

.global func_ov075_02212e04
func_ov075_02212e04:
    ldr r1, .L_02212e44
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x28]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_02212e48
    bne .L_02212e34
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02212e34:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02212e44: .word data_ov075_02216cc8
.L_02212e48: .word data_ov075_02216cf0
.size func_ov075_02212e04, . - func_ov075_02212e04
