.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02215cc8

.global func_ov078_02213574
func_ov078_02213574:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2a8]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r3, [r0, #0x0]
    ldrne r2, [r4, #0x2a4]
    ldrne r2, [r3, r2]
    ldreq r2, [r4, #0x2a4]
    blx r2
    ldrsh r0, [r4, #0xac]
    mov r3, #0x0
    cmp r0, #0xff
    moveq r0, #0x1
    movne r0, r3
    cmp r0, #0x0
    bne .L_022135f0
    ldr r0, .L_02213614
    ldr r2, [r4, #0x2a4]
    ldr r0, [r0, #0x40]
    mov ip, #0x1
    cmp r2, r0
    ldr r0, .L_02213618
    bne .L_022135e8
    ldr r1, [r4, #0x2a8]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_022135e8:
    cmp ip, #0x0
    movne r3, #0x1
.L_022135f0:
    cmp r3, #0x0
    beq .L_02213608
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
.L_02213608:
    mov r0, #0x0
    str r0, [r4, #0x2ac]
    ldmia sp!, {r4, pc}
.L_02213614: .word data_ov078_02215c88
.L_02213618: .word data_ov078_02215cc8
.size func_ov078_02213574, . - func_ov078_02213574
