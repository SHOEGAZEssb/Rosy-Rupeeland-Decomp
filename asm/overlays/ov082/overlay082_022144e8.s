.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_02214aac
.extern data_ov082_02214abc
.extern data_ov082_02214ac4
.extern func_0203e7c8

.global func_ov082_022144e8
func_ov082_022144e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_022145b8
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x18]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022145bc
    bne .L_02214538
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02214538:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02214590
    ldr r0, .L_022145b8
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022145c0
    bne .L_0221457c
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0221457c:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022145ac
.L_02214590:
    ldr r1, [r4, #0x298]
    cmp r1, #0x0
    beq .L_022145ac
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xe0]
    blx r2
.L_022145ac:
    mov r0, r4
    bl func_0203e7c8
    ldmia sp!, {r4, pc}
.L_022145b8: .word data_ov082_02214aac
.L_022145bc: .word data_ov082_02214ac4
.L_022145c0: .word data_ov082_02214abc
.size func_ov082_022144e8, . - func_ov082_022144e8
