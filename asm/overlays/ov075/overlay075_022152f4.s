.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern data_ov075_02217298
.extern data_ov075_022172c0
.extern data_ov075_02217308
.extern ActorExtendedLinked_UpdateFrame
.extern func_ov075_02215044
.extern func_ov075_022152ac
.extern func_ov075_022154e8

.global func_ov075_022152f4
func_ov075_022152f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x68
    add r1, r4, #0x29c
    bl func_ov075_02215044
    ldr r0, .L_022154d8
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x78]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022154dc
    bne .L_02215350
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02215350:
    cmp r3, #0x0
    beq .L_02215444
    ldr r0, .L_022154d8
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x30]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022154e0
    bne .L_02215388
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02215388:
    cmp r3, #0x0
    beq .L_02215444
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    bne .L_02215444
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02215444
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02215444
    ldr r1, [r0, #0x29c]
    tst r1, #0x1
    beq .L_022153f0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1e0]
    blx r1
    mov r0, r0, asr #0xc
    ldrsh r1, [r4, #0x6a]
    add r0, r0, #0x10
    sub r0, r1, r0
    strh r0, [r4, #0x6a]
    b .L_02215444
.L_022153f0:
    mov r0, r4
    bl func_ov075_022152ac
    cmp r0, #0x0
    bne .L_02215444
    mov r0, r4
    bl func_ov075_022154e8
    cmp r0, #0x0
    bne .L_02215444
    ldr r0, [r4, #0x298]
    ldr r1, [r0, #0xd0]
    tst r1, #0x100
    bne .L_02215444
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldreq r0, .L_022154d8
    ldreq r1, [r0, #0x28]
    ldreq r0, [r0, #0x2c]
    streq r1, [r4, #0x218]
    streq r0, [r4, #0x21c]
.L_02215444:
    ldr r0, [r4, #0x2a4]
    cmp r0, #0x0
    ldr r0, [r4, #0x260]
    orrne r0, r0, #0x8000
    biceq r0, r0, #0x8000
    str r0, [r4, #0x260]
    mov r0, r4
    bl ActorExtendedLinked_UpdateFrame
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02215488
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    ldrne r0, [r4, #0x260]
    bicne r0, r0, #0x2
    strne r0, [r4, #0x260]
    ldmneia sp!, {r4, pc}
.L_02215488:
    ldr r0, .L_022154d8
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022154e4
    bne .L_022154b8
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022154b8:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldreq r0, [r4, #0x260]
    orreq r0, r0, #0xa
    streq r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_022154d8: .word data_ov075_02217290
.L_022154dc: .word data_ov075_02217308
.L_022154e0: .word data_ov075_022172c0
.L_022154e4: .word data_ov075_02217298
.size func_ov075_022152f4, . - func_ov075_022152f4
