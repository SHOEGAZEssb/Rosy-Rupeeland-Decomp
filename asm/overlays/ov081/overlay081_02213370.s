.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_020c9670
.extern data_ov081_02215268
.extern data_ov081_022152d0
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_0204cfa4
.extern func_020ae024
.extern func_020befec
.extern func_ov081_02213528

.global func_ov081_02213370
func_ov081_02213370:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x78
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    add r1, r5, #0x78
    add r2, r5, #0x18
    bl func_ov081_02213528
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    bl func_0204cfa4
    cmp r0, #0x4000
    ble .L_0221347c
    ldr r0, [r5, #0xd0]
    tst r0, #0x2
    ldrne r4, [r5, #0x228]
    movne r0, #0x7
    strneh r0, [r5, #0xd6]
    bne .L_02213408
    ldr r0, .L_0221351c
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x68]
    ldr r4, [r5, #0x224]
    cmp r2, r0
    mov r3, #0x1
    ldr r0, .L_02213520
    bne .L_022133f4
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022133f4:
    cmp r3, #0x0
    moveq r0, #0x6
    streqh r0, [r5, #0xd6]
    movne r0, #0x5
    strneh r0, [r5, #0xd6]
.L_02213408:
    add r0, r5, #0x200
    ldrh r0, [r0, #0x3c]
    tst r0, #0x2
    ldr r0, [r5, #0x14]
    movne r4, r4, lsl #0x1
    tst r0, #0x40
    beq .L_02213434
    mov r0, r4
    mov r1, #0xa
    bl func_020befec
    mov r4, r0
.L_02213434:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r2, .L_02213524
    mov r1, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r0, [r2, r0]
    mul r1, r4, r1
    mul r0, r4, r0
    mov r1, r1, asr #0xc
    str r1, [r5, #0x3c]
    mov r0, r0, asr #0xc
    str r0, [r5, #0x40]
    b .L_022134bc
.L_0221347c:
    ldrsh r0, [r5, #0xd8]
    cmp r0, #0x7
    bne .L_022134a8
    ldr r0, [r5, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x8c]
    ldr r0, [r5, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x90]
.L_022134a8:
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    mov r0, #0x1
    strh r0, [r5, #0xd6]
.L_022134bc:
    ldr r0, [r5, #0x14]
    tst r0, #0x40
    bne .L_022134dc
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x24]
    cmp r1, r0
    movlt r0, #0x8
    strlth r0, [r5, #0xd6]
.L_022134dc:
    ldr r0, [r5, #0xd0]
    tst r0, #0x4
    beq .L_0221350c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x94]
    strne r0, [r5, #0x90]
    strne r0, [r5, #0x8c]
.L_0221350c:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0221351c: .word data_ov081_02215268
.L_02213520: .word data_ov081_022152d0
.L_02213524: .word data_020c9670
.size func_ov081_02213370, . - func_ov081_02213370
