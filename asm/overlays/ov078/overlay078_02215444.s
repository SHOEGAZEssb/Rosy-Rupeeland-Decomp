.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern func_02034a60
.extern func_ov078_02213a74
.extern func_ov078_02213c3c
.extern genrand_int32

.global func_ov078_02215444
func_ov078_02215444:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r3, [r4, #0x260]
    add r2, r4, #0x200
    bic r3, r3, #0x20
    orr r3, r3, #0xb
    str r3, [r4, #0x260]
    ldrsh r3, [r2, #0xb0]
    ldrsh r2, [r2, #0xb2]
    mov r5, r1
    cmp r3, r2
    bne .L_022154d4
    bl genrand_int32
    and r2, r0, #0x1
    add r0, r4, #0x200
    ldr r1, .L_02215504
    strh r2, [r0, #0xa2]
    ldr r3, [r1, #0xa0]
    ldr r1, [r1, #0xa4]
    mov r2, #0x0
    str r3, [r4, #0x2a4]
    str r1, [r4, #0x2a8]
    strh r2, [r0, #0x98]
    mov r0, #0xe
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x2b8]
    ldrh r1, [r0, #0x20]
    cmp r1, #0x0
    beq .L_022154c0
    mov r0, r4
    bl func_02034a60
.L_022154c0:
    mov r0, r4
    mov r1, #0x5e
    mov r2, #0x0
    bl func_02034a60
    ldmia sp!, {r3, r4, r5, pc}
.L_022154d4:
    bl func_ov078_02213a74
    add r2, r4, #0x200
    ldrsh r3, [r2, #0xb0]
    mov r0, r4
    mov r1, r5
    add r3, r3, #0x1
    strh r3, [r2, #0xb0]
    ldr r2, [r4, #0x260]
    orr r2, r2, #0x20
    str r2, [r4, #0x260]
    bl func_ov078_02213c3c
    ldmia sp!, {r3, r4, r5, pc}
.L_02215504: .word data_ov078_02215c88
.size func_ov078_02215444, . - func_ov078_02215444
