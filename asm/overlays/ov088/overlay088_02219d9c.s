.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_020c9670
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_02032228
.extern func_02034a60
.extern func_ov088_02218280
.extern gSystemState

.global func_ov088_02219d9c
func_ov088_02219d9c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    ldr r0, .L_02219fe8
    tst r1, #0x1
    ldrh r4, [r0, #0x1a]
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02219de8
    mov r1, #0x5
    mov r0, #0x0
    strh r1, [r5, #0xd6]
    strh r0, [r5, #0xda]
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    b .L_02219fe0
.L_02219de8:
    tst r1, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02219e50
    mov r1, #0x0
    mov r0, #0x1
    mov r2, r1
    mov r3, r1
    strh r0, [r5, #0xd6]
    mov r4, #0x3
    add r0, r5, #0x38
    strh r4, [r5, #0xda]
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov088_02218280
    mov r0, #0x0
    b .L_02219fe0
.L_02219e50:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x30]
    cmp r1, #0x0
    bne .L_02219e80
    mov r0, #0x1
    strh r0, [r5, #0xd6]
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x2
    moveq r0, #0x3
    streqh r0, [r5, #0xda]
    mov r0, #0x0
    b .L_02219fe0
.L_02219e80:
    ldrsh r1, [r5, #0xda]
    cmp r1, #0x1
    cmpne r1, #0x3
    moveq r0, #0x0
    streq r0, [r5, #0x208]
    moveq r1, #0x3
    streqh r1, [r5, #0xd6]
    beq .L_02219fe0
    tst r4, #0xf0
    beq .L_02219f94
    mov r1, #0xb4
    strh r1, [r0, #0x40]
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    bne .L_02219ed8
    mov r0, #0x1
    strh r0, [r5, #0xda]
    mov r0, #0x0
    str r0, [r5, #0x208]
    mov r1, #0x3
    strh r1, [r5, #0xd6]
    b .L_02219fe0
.L_02219ed8:
    tst r4, #0x20
    beq .L_02219efc
    tst r4, #0x40
    movne r0, #0x3
    bne .L_02219f2c
    tst r4, #0x80
    movne r0, #0x1
    moveq r0, #0x2
    b .L_02219f2c
.L_02219efc:
    tst r4, #0x10
    beq .L_02219f20
    tst r4, #0x40
    movne r0, #0x5
    bne .L_02219f2c
    tst r4, #0x80
    movne r0, #0x7
    moveq r0, #0x6
    b .L_02219f2c
.L_02219f20:
    tst r4, #0x40
    movne r0, #0x4
    moveq r0, #0x0
.L_02219f2c:
    mov r0, r0, lsl #0xd
    mov r2, r0, asr #0x4
    add r0, sp, #0x0
    add r1, r5, #0x38
    mov r6, r2, lsl #0x1
    bl VecFx32Object_InitCopy
    add r0, r6, #0x1
    ldr r2, .L_02219fec
    mov r1, r6, lsl #0x1
    ldrsh r1, [r2, r1]
    mov r0, r0, lsl #0x1
    ldrsh r2, [r2, r0]
    mov r0, r5
    rsb r1, r1, #0x0
    mov r3, #0x800
    bl func_02032228
    add r1, sp, #0x0
    add r0, r5, #0x38
    bl VecFx32Object_Assign
    ldr r1, [r5, #0x20c]
    add r0, sp, #0x0
    str r1, [r5, #0x208]
    mov r1, #0x4
    strh r1, [r5, #0xd6]
    bl VecFx32Object_Destroy
    b .L_02219fbc
.L_02219f94:
    cmp r1, #0x2
    bne .L_02219fac
    ldrsh r1, [r0, #0x40]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x40]
.L_02219fac:
    mov r0, #0x0
    str r0, [r5, #0x208]
    mov r0, #0x3
    strh r0, [r5, #0xd6]
.L_02219fbc:
    tst r4, #0x200
    beq .L_02219fdc
    tst r4, #0x100
    beq .L_02219fdc
    ldr r1, .L_02219ff0
    mov r0, r5
    mov r2, #0x0
    bl func_02034a60
.L_02219fdc:
    mov r0, #0x1
.L_02219fe0:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02219fe8: .word gSystemState
.L_02219fec: .word data_020c9670
.L_02219ff0: .word 0xfd88
.size func_ov088_02219d9c, . - func_ov088_02219d9c
