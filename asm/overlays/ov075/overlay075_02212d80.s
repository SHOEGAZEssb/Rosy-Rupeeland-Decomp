.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern data_ov075_02216cd8

.global func_ov075_02212d80
func_ov075_02212d80:
    ldr r1, .L_02212dc0
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x10]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_02212dc4
    bne .L_02212db0
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02212db0:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02212dc0: .word data_ov075_02216cc8
.L_02212dc4: .word data_ov075_02216cd8
.size func_ov075_02212d80, . - func_ov075_02212d80
