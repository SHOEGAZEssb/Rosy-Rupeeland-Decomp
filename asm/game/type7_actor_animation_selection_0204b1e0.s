; Matching retail form; see src/game/type7_actor_animation_selection.c.
.extern data_020e16b0
.extern data_020e1828
.extern data_020e1830
.extern data_020e1840
.extern data_020e1848
.extern data_020e1850
.extern data_020e1868
.extern data_020e1878
.extern AttachmentController_SetEnabled
.extern func_0204ced8
.extern func_0204cf28
.text
    .global Type7Actor_UpdateAttachmentControllerAnimation
Type7Actor_UpdateAttachmentControllerAnimation: ; 0x0204b1e0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r5, r0
    ldr r0, [r5, #0x268]
    ldr r1, .L_0204b5b4
    tst r0, r1
    beq .L_0204b208
    add r0, r5, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    b .L_0204b5a0
.L_0204b208:
    ldr r1, [r5, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x14
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0204b230
    add r0, r5, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    b .L_0204b5a0
.L_0204b230:
    tst r0, #0x1000
    beq .L_0204b260
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    add r0, r5, #0x2a8
    bne .L_0204b254
    mov r1, #0x1
    bl AttachmentController_SetEnabled
    b .L_0204b5a0
.L_0204b254:
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    b .L_0204b5a0
.L_0204b260:
    ldr r4, .L_0204b5b8
    ldr r1, [r5, #0x1fc]
    ldr r2, [r5, #0x208]
    mov r3, #0x1
    cmp r1, #0x12c
    movlt r1, #0x1
    ldr r4, [r4, #0x1c8]
    movge r1, #0x0
    cmp r2, r4
    mov ip, r3
    mov lr, r3
    mov r6, r3
    mov r7, r3
    mov r8, r3
    mvn r4, #0x0
    ldr r9, .L_0204b5bc
    bne .L_0204b2b8
    ldr r10, [r5, #0x20c]
    ldr r9, [r9, #0x4]
    cmp r10, r9
    cmpne r2, #0x0
    moveq r8, #0x0
.L_0204b2b8:
    cmp r8, #0x0
    beq .L_0204b2f8
    ldr r8, .L_0204b5b8
    ldr r2, [r5, #0x208]
    ldr r9, [r8, #0x178]
    mov r8, #0x1
    cmp r2, r9
    ldr r9, .L_0204b5c0
    bne .L_0204b2f0
    ldr r10, [r5, #0x20c]
    ldr r9, [r9, #0x4]
    cmp r10, r9
    cmpne r2, #0x0
    moveq r8, #0x0
.L_0204b2f0:
    cmp r8, #0x0
    movne r7, #0x0
.L_0204b2f8:
    cmp r7, #0x0
    bne .L_0204b338
    ldr r7, .L_0204b5b8
    ldr r2, [r5, #0x208]
    ldr r8, [r7, #0x1b8]
    mov r7, #0x1
    cmp r2, r8
    ldr r8, .L_0204b5c4
    bne .L_0204b330
    ldr r9, [r5, #0x20c]
    ldr r8, [r8, #0x4]
    cmp r9, r8
    cmpne r2, #0x0
    moveq r7, #0x0
.L_0204b330:
    cmp r7, #0x0
    movne r6, #0x0
.L_0204b338:
    cmp r6, #0x0
    bne .L_0204b378
    ldr r2, .L_0204b5b8
    ldr r7, [r5, #0x208]
    ldr r2, [r2, #0x180]
    mov r8, #0x1
    cmp r7, r2
    ldr r2, .L_0204b5c8
    bne .L_0204b370
    ldr r6, [r5, #0x20c]
    ldr r2, [r2, #0x4]
    cmp r6, r2
    cmpne r7, #0x0
    moveq r8, #0x0
.L_0204b370:
    cmp r8, #0x0
    movne lr, #0x0
.L_0204b378:
    cmp lr, #0x0
    bne .L_0204b3b8
    ldr r2, .L_0204b5b8
    ldr r7, [r5, #0x208]
    ldr r2, [r2, #0x190]
    mov r8, #0x1
    cmp r7, r2
    ldr r2, .L_0204b5cc
    bne .L_0204b3b0
    ldr r6, [r5, #0x20c]
    ldr r2, [r2, #0x4]
    cmp r6, r2
    cmpne r7, #0x0
    moveq r8, #0x0
.L_0204b3b0:
    cmp r8, #0x0
    movne ip, #0x0
.L_0204b3b8:
    cmp ip, #0x0
    bne .L_0204b3d8
    ldr r2, [r5, #0x14]
    tst r2, #0x10000000
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    movne r3, #0x0
.L_0204b3d8:
    cmp r3, #0x0
    bne .L_0204b554
    add r2, r5, #0x200
    ldrsh r2, [r2, #0x46]
    cmp r2, #0x0
    movgt r4, #0x17
    bgt .L_0204b554
    ldrsh r2, [r5, #0xd6]
    cmp r2, #0xe
    bne .L_0204b410
    cmp r1, #0x0
    movne r4, #0x14
    moveq r4, #0x1
    b .L_0204b554
.L_0204b410:
    ldr r3, .L_0204b5b8
    ldr r7, [r5, #0x208]
    ldr r3, [r3, #0x198]
    mov r8, #0x1
    cmp r7, r3
    ldr r3, .L_0204b5d0
    bne .L_0204b440
    ldr r6, [r5, #0x20c]
    ldr r3, [r3, #0x4]
    cmp r6, r3
    cmpne r7, #0x0
    moveq r8, #0x0
.L_0204b440:
    cmp r8, #0x0
    bne .L_0204b460
    tst r0, #0x80
    movne r4, #0x1f
    bne .L_0204b554
    cmp r1, #0x0
    movne r4, #0x8
    b .L_0204b554
.L_0204b460:
    cmp r2, #0x6
    bne .L_0204b478
    cmp r1, #0x0
    movne r4, #0x13
    moveq r4, #0x0
    b .L_0204b554
.L_0204b478:
    cmp r2, #0x7
    bne .L_0204b490
    cmp r1, #0x0
    movne r4, #0x13
    moveq r4, #0x0
    b .L_0204b554
.L_0204b490:
    tst r0, #0x800
    beq .L_0204b4a8
    cmp r1, #0x0
    movne r4, #0x1e
    moveq r4, #0x3
    b .L_0204b554
.L_0204b4a8:
    cmp r2, #0x3
    bne .L_0204b4c0
    cmp r1, #0x0
    movne r4, #0x15
    moveq r4, #0x12
    b .L_0204b554
.L_0204b4c0:
    add r0, r5, #0x200
    ldrsh r3, [r0, #0x64]
    cmp r3, #0x0
    ble .L_0204b4e0
    cmp r1, #0x0
    movne r4, #0x16
    moveq r4, #0x4
    b .L_0204b554
.L_0204b4e0:
    ldrsh r0, [r0, #0x66]
    cmp r0, #0x0
    ble .L_0204b4fc
    cmp r1, #0x0
    movne r4, #0x16
    moveq r4, #0x4
    b .L_0204b554
.L_0204b4fc:
    cmp r1, #0x0
    beq .L_0204b51c
    cmp r2, #0x1
    cmpne r2, #0x2
    cmpne r2, #0x8
    cmpne r2, #0xa
    moveq r4, #0x8
    beq .L_0204b554
.L_0204b51c:
    ldr r0, .L_0204b5b8
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x1a0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_0204b5d4
    bne .L_0204b54c
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0204b54c:
    cmp r3, #0x0
    moveq r4, #0x1f
.L_0204b554:
    mvn r0, #0x0
    cmp r4, r0
    beq .L_0204b594
    add r0, r5, #0x200
    ldrsh r0, [r0, #0xb6]
    cmp r0, #0x0
    beq .L_0204b578
    add r0, r5, #0x2a8
    bl func_0204cf28
.L_0204b578:
    add r0, r5, #0x2a8
    and r1, r4, #0xff
    bl func_0204ced8
    add r0, r5, #0x2a8
    mov r1, #0x1
    bl AttachmentController_SetEnabled
    b .L_0204b5a0
.L_0204b594:
    add r0, r5, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
.L_0204b5a0:
    add r0, r5, #0x2a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0204b5b4: .word 0x202400
.L_0204b5b8: .word data_020e16b0
.L_0204b5bc: .word data_020e1878
.L_0204b5c0: .word data_020e1828
.L_0204b5c4: .word data_020e1868
.L_0204b5c8: .word data_020e1830
.L_0204b5cc: .word data_020e1840
.L_0204b5d0: .word data_020e1848
.L_0204b5d4: .word data_020e1850
.size Type7Actor_UpdateAttachmentControllerAnimation, . - Type7Actor_UpdateAttachmentControllerAnimation

