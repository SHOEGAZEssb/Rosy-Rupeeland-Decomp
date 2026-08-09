.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern OS_Halt
.extern data_ov081_022153e0
.extern data_ov081_02215428

.global func_ov081_0221367c
func_ov081_0221367c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r1, r5
    mov r4, #0x1
    ldr lr, .L_02213708
    b .L_022136f8
.L_02213694:
    ldr ip, [lr, r5, lsl #0x3]
    ldr r2, [r0, #0x208]
    mov r6, r4
    cmp ip, r2
    add r2, lr, r5, lsl #0x3
    bne .L_022136c0
    ldr r3, [r2, #0x4]
    ldr r2, [r0, #0x20c]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r6, r1
.L_022136c0:
    cmp r6, #0x0
    bne .L_022136f4
    ldr r1, .L_0221370c
    add r3, r1, r5, lsl #0x3
    ldr r1, [r3, #0x4]
    add r0, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r3, #0x0]
    ldrne r1, [r2, r1]
    ldreq r1, [r3, #0x0]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.L_022136f4:
    add r5, r5, #0x1
.L_022136f8:
    cmp r5, #0x9
    blt .L_02213694
    bl OS_Halt
    ldmia sp!, {r4, r5, r6, pc}
.L_02213708: .word data_ov081_022153e0
.L_0221370c: .word data_ov081_02215428
.size func_ov081_0221367c, . - func_ov081_0221367c
