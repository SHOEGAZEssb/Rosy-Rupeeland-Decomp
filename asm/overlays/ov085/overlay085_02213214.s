.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_021052fc
.extern gActorRuntimeCollection
.extern data_ov085_02214328
.extern data_ov085_022143d8
.extern data_ov085_022143e0
.extern data_ov085_022143e8
.extern data_ov085_022143f8
.extern data_ov085_02214400
.extern data_ov085_02214408
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorDerivedRuntime_HandlePairActive
.extern func_0204cfa4
.extern func_020adc90
.extern func_ov085_02213ae4
.extern func_ov085_02213bd0

.global func_ov085_02213214
func_ov085_02213214:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldr r0, [r6, #0x10]
    mov r5, r1
    mov r4, r2
    tst r0, #0x1000000
    bne .L_02213444
    ldr r0, .L_02213458
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02213444
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213414
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_02213414
    ldr r0, .L_0221345c
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xe0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02213460
    bne .L_022132a0
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022132a0:
    cmp r3, #0x0
    beq .L_02213444
    ldr r0, .L_0221345c
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xd8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02213464
    bne .L_022132d8
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022132d8:
    cmp r3, #0x0
    bne .L_02213300
    ldr r1, .L_02213468
    mov r0, r6
    ldmia r1, {r1, r2}
    mov r3, #0x5a
    bl func_ov085_02213bd0
    mov r0, #0x1
    str r0, [r6, #0x250]
    b .L_02213444
.L_02213300:
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
    ble .L_02213444
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    mov r7, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldr r2, [r6, #0x9c]
    ldr r1, .L_0221345c
    sub r2, r2, r7, lsl #0x1
    str r2, [r6, #0x9c]
    ldr r2, [r6, #0xa0]
    mov r7, #0x1
    sub r0, r2, r0, lsl #0x1
    str r0, [r6, #0xa0]
    ldr r2, [r6, #0x208]
    ldr r0, [r1, #0xc0]
    ldr r3, .L_0221346c
    cmp r2, r0
    bne .L_02213394
    ldr r1, [r6, #0x20c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r7, #0x0
.L_02213394:
    cmp r7, #0x0
    bne .L_022133c4
    ldr r1, .L_02213470
    mov r0, r6
    ldr r1, [r1, #0x0]
    ldr r3, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r3, [r3, #0xd0]
    mov r2, #0xf0
    blx r3
    b .L_02213444
.L_022133c4:
    ldr r0, .L_0221345c
    ldr r2, [r6, #0x208]
    ldr r0, [r0, #0xb8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02213474
    bne .L_022133f4
    ldr r1, [r6, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022133f4:
    cmp r3, #0x0
    beq .L_02213444
    ldr r1, .L_02213478
    mov r0, r6
    mov r3, #0x1e
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
    b .L_02213444
.L_02213414:
    cmp r4, #0x0
    bne .L_02213444
    ldrsh r0, [r6, #0xd6]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_02213444
    mov r0, r6
    bl func_ov085_02213ae4
.L_02213444:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorDerivedRuntime_HandlePairActive
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02213458: .word gActorRuntimeCollection
.L_0221345c: .word data_ov085_02214328
.L_02213460: .word data_ov085_02214408
.L_02213464: .word data_ov085_02214400
.L_02213468: .word data_ov085_022143f8
.L_0221346c: .word data_ov085_022143e8
.L_02213470: .word data_021052fc
.L_02213474: .word data_ov085_022143e0
.L_02213478: .word data_ov085_022143d8
.size func_ov085_02213214, . - func_ov085_02213214
