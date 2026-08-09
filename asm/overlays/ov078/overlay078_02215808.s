.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern func_02005030
.extern func_02005058
.extern func_020adae4

.global func_ov078_02215808
func_ov078_02215808:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldr r2, [r7, #0x260]
    add r0, r7, #0x200
    orr r2, r2, #0x2b
    str r2, [r7, #0x260]
    ldrsh r3, [r0, #0xb4]
    ldrsh r2, [r0, #0xb6]
    mov r6, r1
    cmp r3, r2
    bge .L_022158fc
    add r1, r3, #0x1
    strh r1, [r0, #0xb4]
    ldr r2, [r7, #0x228]
    ldr r1, [r7, #0x20]
    ldr r0, [r2, #0x20]
    ldr r3, [r7, #0x1c]
    sub r1, r1, r0
    ldr r2, [r2, #0x1c]
    mov r5, r1, asr #0xc
    sub r2, r3, r2
    add r0, sp, #0x0
    add r1, r7, #0x18
    mov r4, r2, asr #0xc
    bl func_02005030
    mul r0, r5, r5
    mla r1, r4, r4, r0
    ldrsh r2, [r6, #0x12]
    smulbb r0, r2, r2
    cmp r1, r0
    bge .L_022158a4
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r4, lsl #0xc
    add r0, r0, r5, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_022158bc
.L_022158a4:
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r4, lsl #0xc
    sub r0, r0, r5, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_022158bc:
    mov r0, r7
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r7, #0x3c]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r7, #0x3c]
    ldr r0, [r7, #0x40]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r7, #0x40]
    add r0, sp, #0x0
    bl func_02005058
    b .L_02215918
.L_022158fc:
    mov r2, #0x0
    ldr r1, .L_02215928
    strh r2, [r0, #0xb0]
    ldr r2, [r1, #0x80]
    ldr r0, [r1, #0x84]
    str r2, [r7, #0x2a4]
    str r0, [r7, #0x2a8]
.L_02215918:
    mov r0, #0xd
    strh r0, [r7, #0xd6]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02215928: .word data_ov078_02215c88
.size func_ov078_02215808, . - func_ov078_02215808
