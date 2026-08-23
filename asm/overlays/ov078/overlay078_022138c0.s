.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02215ca8
.extern data_ov078_02215cd8
.extern data_ov078_02215cf8
.extern data_ov078_02215d00
.extern Actor_PlayHorizontalSpatialSound

.global func_ov078_022138c0
func_ov078_022138c0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, .L_02213a24
    mov r4, r0
    ldr r3, [r4, #0x218]
    ldr r0, [r2, #0x78]
    mov ip, #0x1
    cmp r3, r0
    ldr r0, .L_02213a28
    bne .L_022138f8
    ldr r2, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r2, r0
    cmpne r3, #0x0
    moveq ip, #0x0
.L_022138f8:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, .L_02213a24
    mov r0, #0x1
    ldr lr, [r4, #0x2a4]
    ldr r3, [r2, #0x20]
    mov r2, r0
    mov r5, r0
    cmp lr, r3
    ldr r3, .L_02213a2c
    bne .L_02213944
    ldr ip, [r4, #0x2a8]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r5, #0x0
.L_02213944:
    cmp r5, #0x0
    beq .L_02213984
    ldr r3, .L_02213a24
    ldr lr, [r4, #0x2a4]
    ldr r3, [r3, #0x50]
    mov r5, #0x1
    cmp lr, r3
    ldr r3, .L_02213a30
    bne .L_0221397c
    ldr ip, [r4, #0x2a8]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r5, #0x0
.L_0221397c:
    cmp r5, #0x0
    movne r2, #0x0
.L_02213984:
    cmp r2, #0x0
    bne .L_022139c4
    ldr r2, .L_02213a24
    ldr ip, [r4, #0x2a4]
    ldr r2, [r2, #0x70]
    mov r5, #0x1
    cmp ip, r2
    ldr r2, .L_02213a34
    bne .L_022139bc
    ldr r3, [r4, #0x2a8]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r5, #0x0
.L_022139bc:
    cmp r5, #0x0
    movne r0, #0x0
.L_022139c4:
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x10
    str r0, [r4, #0x260]
    ldr r0, [r1, #0xd0]
    tst r0, #0x100
    bne .L_02213a10
    add r0, r1, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_02213a10
    ldr r1, .L_02213a38
    mov r0, r4
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_02213a10:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_02213a24: .word data_ov078_02215c88
.L_02213a28: .word data_ov078_02215d00
.L_02213a2c: .word data_ov078_02215ca8
.L_02213a30: .word data_ov078_02215cd8
.L_02213a34: .word data_ov078_02215cf8
.L_02213a38: .word 0x3089
.size func_ov078_022138c0, . - func_ov078_022138c0
