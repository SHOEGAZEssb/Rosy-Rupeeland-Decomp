.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214d88
func_ov075_02214d88:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0xd0]
    mov r3, #0x0
    mov r2, r3
    mov ip, r3
    tst lr, #0x100
    bne .L_02214dcc
    tst lr, #0x10000
    bne .L_02214db8
    ldr r1, [r0, #0x230]
    tst r1, #0x980000
    beq .L_02214dc0
.L_02214db8:
    mov r1, #0x1
    b .L_02214dc4
.L_02214dc0:
    mov r1, r3
.L_02214dc4:
    cmp r1, #0x0
    moveq ip, #0x1
.L_02214dcc:
    cmp ip, #0x0
    beq .L_02214de0
    ldr r1, [r0, #0x270]
    cmp r1, #0x0
    moveq r2, #0x1
.L_02214de0:
    cmp r2, #0x0
    beq .L_02214e20
    tst lr, #0x10
    ldreq r2, [r0, #0x24]
    ldreq r1, [r0, #0x1dc]
    cmpeq r2, r1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02214e20
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne .L_02214e20
    tst lr, #0x4000
    moveq r3, #0x1
.L_02214e20:
    mov r0, r3
    ldmia sp!, {r3, pc}
.size func_ov075_02214d88, . - func_ov075_02214d88
