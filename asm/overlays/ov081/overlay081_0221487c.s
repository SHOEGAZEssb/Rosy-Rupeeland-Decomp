.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_021052fc
.extern data_02105310
.extern data_ov081_02215268
.extern data_ov081_02215278
.extern data_ov081_02215308
.extern data_ov081_02215310
.extern data_ov081_02215378
.extern data_ov081_02215380
.extern data_ov081_0221551c
.extern func_0200b04c
.extern func_02038d38
.extern func_0203bab0
.extern func_020573e4
.extern func_020593dc
.extern func_ov081_02213710
.extern gSoundContext

.global func_ov081_0221487c
func_ov081_0221487c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r0, .L_02214b24
    mov r4, r1
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02214b10
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214b10
    ldr r0, [r5, #0x1e0]
    cmp r0, #0x0
    beq .L_022148cc
    bl func_020573e4
    cmp r0, #0x0
    bne .L_02214b10
.L_022148cc:
    ldr r1, .L_02214b28
    mov r0, #0x0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xa8]
    mov ip, r0
    cmp r3, r1
    mov lr, #0x1
    ldr r1, .L_02214b2c
    bne .L_02214904
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq lr, #0x0
.L_02214904:
    cmp lr, #0x0
    bne .L_02214930
    ldr r1, [r5, #0xd0]
    tst r1, #0x10
    ldreq r2, [r5, #0x24]
    ldreq r1, [r5, #0x1dc]
    cmpeq r2, r1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    movne ip, #0x1
.L_02214930:
    cmp ip, #0x0
    beq .L_02214948
    add r1, r5, #0x200
    ldrsh r1, [r1, #0x54]
    cmp r1, #0x0
    moveq r0, #0x1
.L_02214948:
    cmp r0, #0x0
    beq .L_022149cc
    add r0, r5, #0x200
    mov r1, #0x4
    strh r1, [r0, #0x54]
    ldr r1, [r5, #0xd0]
    ldr r0, .L_02214b30
    orr r1, r1, #0x1000
    str r1, [r5, #0xd0]
    ldr r0, [r0, #0x0]
    ldr r1, [r5, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r2, [r5, #0x1c]
    ldr r3, [r0, #0x20]
    mov r1, r1, asr #0xc
    rsb ip, r1, r3, asr #0xc
    mul r1, ip, ip
    ldr r3, [r0, #0x1c]
    mov r2, r2, asr #0xc
    rsb r3, r2, r3, asr #0xc
    mla r1, r3, r3, r1
    ldr r2, .L_02214b34
    str r3, [sp, #0xc]
    str r2, [sp, #0x8]
    str ip, [sp, #0x10]
    cmp r1, #0x4
    ble .L_02214b10
    mov r2, #0x14
    add r1, r5, #0x18
    sub r3, r2, #0x16
    bl func_02038d38
    b .L_02214b10
.L_022149cc:
    ldr r0, .L_02214b28
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0xa0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02214b38
    bne .L_022149fc
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022149fc:
    cmp r3, #0x0
    bne .L_02214a50
    ldr r1, .L_02214b3c
    mov r0, r5
    ldmia r1, {r1, r2}
    mov r3, #0xc8
    bl func_ov081_02213710
    mov r3, #0x0
    strb r3, [r5, #0x257]
    add r0, r5, #0x200
    ldrh r2, [r0, #0x3a]
    mov r1, #0x100
    ldr r0, .L_02214b40
    str r3, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
    b .L_02214b10
.L_02214a50:
    ldr r0, .L_02214b28
    ldr r3, [r5, #0x208]
    ldr r1, [r0, #0x10]
    mov r0, #0x0
    cmp r3, r1
    mov ip, #0x1
    ldr r1, .L_02214b44
    bne .L_02214a84
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02214a84:
    cmp ip, #0x0
    beq .L_02214ac4
    ldr r1, .L_02214b28
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x118]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02214b48
    bne .L_02214abc
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02214abc:
    cmp ip, #0x0
    movne r0, #0x1
.L_02214ac4:
    cmp r0, #0x0
    beq .L_02214b10
    add r0, r5, #0x200
    ldrh r2, [r0, #0x3a]
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02214b40
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
    ldr r1, .L_02214b4c
    mov r0, r5
    mov r3, #0x1e
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
.L_02214b10:
    mov r0, r5
    mov r1, r4
    bl func_0203bab0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_02214b24: .word data_02105310
.L_02214b28: .word data_ov081_02215268
.L_02214b2c: .word data_ov081_02215310
.L_02214b30: .word data_021052fc
.L_02214b34: .word data_ov081_0221551c
.L_02214b38: .word data_ov081_02215308
.L_02214b3c: .word data_ov081_02215268
.L_02214b40: .word gSoundContext
.L_02214b44: .word data_ov081_02215278
.L_02214b48: .word data_ov081_02215380
.L_02214b4c: .word data_ov081_02215378
.size func_ov081_0221487c, . - func_ov081_0221487c
