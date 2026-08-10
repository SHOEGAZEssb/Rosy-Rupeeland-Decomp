.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_021052fc
.extern data_02105310
.extern data_ov081_02215268
.extern data_ov081_02215270
.extern data_ov081_02215340
.extern data_ov081_02215358
.extern data_ov081_02215360
.extern func_02009d78
.extern func_0200b04c
.extern Type7MarkerPresentation_SelectAnimation
.extern Type7MarkerPresentation_ReloadResources
.extern func_020573e4
.extern func_020593ac
.extern func_020adae4
.extern func_020be328
.extern func_ov081_02212de0
.extern func_ov081_02214524
.extern gSoundContext

.global func_ov081_02214104
func_ov081_02214104:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r1, [r6, #0xd0]
    add r0, r6, #0x200
    bic r1, r1, #0x10
    str r1, [r6, #0xd0]
    ldr r1, [r6, #0x14]
    bic r1, r1, #0x40
    str r1, [r6, #0x14]
    ldrh r1, [r0, #0x3c]
    bic r1, r1, #0x2
    strh r1, [r0, #0x3c]
    ldr r0, [r6, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214214
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x54]
    cmp r1, #0x0
    ble .L_02214214
    sub r1, r1, #0x1
    strh r1, [r0, #0x54]
    ldrsh r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_02214214
    ldr r0, .L_02214500
    mov r1, #0x0
    str r0, [r6, #0x44]
    ldr r0, [r6, #0x3c]
    str r0, [r6, #0x8c]
    ldr r2, [r6, #0x40]
    ldr r0, .L_02214504
    str r2, [r6, #0x90]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r2, [r6, #0x1c]
    ldr r0, [r0, #0x4]
    mvn r1, #0x5f
    sub r0, r2, r0
    sub r0, r0, #0x80000
    mov r0, r0, asr #0xc
    add r0, r0, r0, lsr #0x1f
    mov r4, r0, asr #0x1
    cmp r1, r0, asr #0x1
    movgt r4, r1
    bgt .L_022141e0
    cmp r4, #0x60
    movgt r4, #0x60
.L_022141e0:
    mov r0, r4
    bl func_020be328
    mov r1, #0x3
    bl func_020adae4
    mov r2, #0x100
    str r4, [sp, #0x0]
    ldr r1, .L_02214508
    str r2, [sp, #0x4]
    rsb r3, r0, #0x40
    ldr r0, [r1, #0x0]
    add r1, r2, #0x33
    mov r2, #0x1
    bl func_020593ac
.L_02214214:
    mov r1, #0x0
    mov r0, r6
    strh r1, [r6, #0xda]
    bl func_ov081_02212de0
    ldr r0, [r6, #0x10]
    tst r0, #0x1000000
    bne .L_02214258
    ldr r0, .L_0221450c
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02214258
    ldr r0, [r6, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02214260
.L_02214258:
    mov r5, #0x1
    b .L_02214264
.L_02214260:
    mov r5, #0x0
.L_02214264:
    ldr r0, [r6, #0x114]
    mvn r4, #0x0
    cmp r0, #0x0
    bne .L_022143c8
    ldr r0, [r6, #0x1e0]
    cmp r0, #0x0
    beq .L_0221428c
    bl func_020573e4
    cmp r0, #0x0
    bne .L_022143c8
.L_0221428c:
    ldr r0, .L_02214510
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xf8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02214514
    bne .L_022142bc
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022142bc:
    cmp r3, #0x0
    moveq r4, #0x2
    beq .L_022143c8
    cmp r5, #0x0
    bne .L_022143c8
    ldr r0, .L_02214510
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xf0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02214518
    bne .L_02214300
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02214300:
    cmp r3, #0x0
    moveq r4, #0xd
    beq .L_022143c8
    ldr r0, .L_02214510
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0x8]
    mov r3, #0x0
    cmp r2, r0
    mov ip, #0x1
    ldr r0, .L_0221451c
    bne .L_02214340
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02214340:
    cmp ip, #0x0
    bne .L_02214354
    ldr r0, [r6, #0x230]
    cmp r0, #0xa
    movlt r3, #0x1
.L_02214354:
    cmp r3, #0x0
    movne r4, #0xc
    bne .L_022143c8
    ldr r0, .L_02214510
    mov r3, #0x0
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xd8]
    mov ip, r3
    cmp r2, r0
    mov lr, #0x1
    ldr r0, .L_02214520
    bne .L_02214398
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq lr, #0x0
.L_02214398:
    cmp lr, #0x0
    ldreq r0, [r6, #0x54]
    ldreqb r0, [r0, #0x38]
    cmpeq r0, #0x1a
    moveq ip, #0x1
    cmp ip, #0x0
    beq .L_022143c0
    ldr r0, [r6, #0x230]
    cmp r0, #0x96
    movlt r3, #0x1
.L_022143c0:
    cmp r3, #0x0
    movne r4, #0x4
.L_022143c8:
    mvn r0, #0x0
    cmp r4, r0
    beq .L_02214408
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x52]
    cmp r0, #0x0
    beq .L_022143ec
    add r0, r6, #0x244
    bl Type7MarkerPresentation_ReloadResources
.L_022143ec:
    add r0, r6, #0x244
    and r1, r4, #0xff
    bl Type7MarkerPresentation_SelectAnimation
    add r0, r6, #0x244
    mov r1, #0x1
    bl func_ov081_02214524
    b .L_02214414
.L_02214408:
    add r0, r6, #0x244
    mov r1, #0x0
    bl func_ov081_02214524
.L_02214414:
    add r0, r6, #0x244
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r5, #0x0
    bne .L_022144f8
    add r0, r6, #0x200
    ldrsb r0, [r0, #0x56]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgtb r0, [r6, #0x256]
    bgt .L_022144f8
    ldr r1, [r6, #0x54]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x0
    blt .L_022144f8
    cmp r0, #0x7
    bgt .L_022144f8
    ldrsh r0, [r1, #0x36]
    cmp r0, #0x0
    ble .L_022144f8
    ldr r0, [r1, #0x20]
    cmp r0, #0x0
    bne .L_022144f8
    ldr r0, .L_02214504
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r2, [r6, #0x1c]
    ldr r0, [r0, #0x4]
    mvn r1, #0x5f
    sub r0, r2, r0
    sub r0, r0, #0x80000
    mov r0, r0, asr #0xc
    add r0, r0, r0, lsr #0x1f
    mov r4, r0, asr #0x1
    cmp r1, r0, asr #0x1
    movgt r4, r1
    bgt .L_022144bc
    cmp r4, #0x60
    movgt r4, #0x60
.L_022144bc:
    mov r0, r4
    bl func_020be328
    mov r1, #0x3
    bl func_020adae4
    mov r1, #0x5
    str r4, [sp, #0x0]
    mov r3, #0x0
    ldr r2, .L_02214508
    str r3, [sp, #0x4]
    rsb r3, r0, #0x40
    ldr r0, [r2, #0x0]
    mov r2, r1
    bl func_020593ac
    mov r0, #0xa
    strb r0, [r6, #0x256]
.L_022144f8:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02214500: .word 0x2666
.L_02214504: .word data_021052fc
.L_02214508: .word gSoundContext
.L_0221450c: .word data_02105310
.L_02214510: .word data_ov081_02215268
.L_02214514: .word data_ov081_02215360
.L_02214518: .word data_ov081_02215358
.L_0221451c: .word data_ov081_02215270
.L_02214520: .word data_ov081_02215340
.size func_ov081_02214104, . - func_ov081_02214104
