.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern data_ov075_02216ce0

.global func_ov075_02213c04
func_ov075_02213c04:
    stmdb sp!, {r4, lr}
    ldr r2, .L_02213c98
    mov r1, #0x0
    ldr ip, [r0, #0x218]
    ldr r2, [r2, #0x0]
    mov lr, r1
    cmp ip, r2
    mov r4, #0x1
    ldr r2, .L_02213c9c
    bne .L_02213c40
    ldr r3, [r0, #0x21c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r4, #0x0
.L_02213c40:
    cmp r4, #0x0
    beq .L_02213c80
    ldr r2, .L_02213c98
    ldr ip, [r0, #0x218]
    ldr r2, [r2, #0x18]
    mov r4, #0x1
    cmp ip, r2
    ldr r2, .L_02213ca0
    bne .L_02213c78
    ldr r3, [r0, #0x21c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r4, #0x0
.L_02213c78:
    cmp r4, #0x0
    movne lr, #0x1
.L_02213c80:
    cmp lr, #0x0
    ldrne r0, [r0, #0x298]
    cmpne r0, #0x3
    movne r1, #0x1
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_02213c98: .word data_ov075_02216cc8
.L_02213c9c: .word data_ov075_02216cc8
.L_02213ca0: .word data_ov075_02216ce0
.size func_ov075_02213c04, . - func_ov075_02213c04
