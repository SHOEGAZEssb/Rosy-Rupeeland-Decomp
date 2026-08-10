.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_021052fc
.extern data_02105310
.extern data_ov081_02215268
.extern data_ov081_022152c0
.extern data_ov081_02215318
.extern data_ov081_02215320
.extern data_ov081_02215328
.extern data_ov081_02215330
.extern data_ov081_02215338
.extern func_0200b04c
.extern ActorDerivedRuntime_HandlePairActive
.extern func_0204cfa4
.extern func_020593dc
.extern func_020adc90
.extern func_ov081_02213710
.extern gSoundContext

.global func_ov081_022145c8
func_ov081_022145c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x10]
    mov r5, r1
    mov r4, r2
    tst r0, #0x1000000
    bne .L_02214834
    ldr r0, .L_0221484c
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02214834
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022147fc
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_022147fc
    ldr r0, .L_02214850
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0x58]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02214854
    bne .L_02214658
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02214658:
    cmp r3, #0x0
    beq .L_02214834
    ldr r0, .L_02214850
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xd0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02214858
    bne .L_02214690
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02214690:
    cmp r3, #0x0
    bne .L_022146e8
    ldr r1, .L_0221485c
    mov r0, r6
    ldmia r1, {r1, r2}
    mov r3, #0x5a
    bl func_ov081_02213710
    mov r0, #0x1
    strb r0, [r6, #0x257]
    add r0, r6, #0x200
    ldrh r2, [r0, #0x3a]
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02214860
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
    b .L_02214834
.L_022146e8:
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r7, r3, r2
    sub r9, r1, r0
    mov r0, r7
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_02214834
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    mov r7, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldr r2, [r6, #0x9c]
    ldr r1, .L_02214850
    sub r2, r2, r7, lsl #0x1
    str r2, [r6, #0x9c]
    ldr r2, [r6, #0xa0]
    mov r7, #0x1
    sub r0, r2, r0, lsl #0x1
    str r0, [r6, #0xa0]
    ldr r2, [r6, #0x208]
    ldr r0, [r1, #0xc0]
    ldr r3, .L_02214864
    cmp r2, r0
    bne .L_0221477c
    ldr r1, [r6, #0x20c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r7, #0x0
.L_0221477c:
    cmp r7, #0x0
    bne .L_022147ac
    ldr r1, .L_02214868
    mov r0, r6
    ldr r1, [r1, #0x0]
    ldr r3, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r3, [r3, #0xd0]
    mov r2, #0xf0
    blx r3
    b .L_02214834
.L_022147ac:
    ldr r0, .L_02214850
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xb8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_0221486c
    bne .L_022147dc
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022147dc:
    cmp r3, #0x0
    beq .L_02214834
    ldr r1, .L_02214870
    mov r0, r6
    mov r3, #0x1e
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    b .L_02214834
.L_022147fc:
    cmp r4, #0x0
    bne .L_02214834
    ldrsh r0, [r6, #0xd6]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x2
    bhi .L_02214834
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x120]
    blx r1
.L_02214834:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorDerivedRuntime_HandlePairActive
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0221484c: .word data_02105310
.L_02214850: .word data_ov081_02215268
.L_02214854: .word data_ov081_022152c0
.L_02214858: .word data_ov081_02215338
.L_0221485c: .word data_ov081_02215330
.L_02214860: .word gSoundContext
.L_02214864: .word data_ov081_02215328
.L_02214868: .word data_021052fc
.L_0221486c: .word data_ov081_02215320
.L_02214870: .word data_ov081_02215318
.size func_ov081_022145c8, . - func_ov081_022145c8
