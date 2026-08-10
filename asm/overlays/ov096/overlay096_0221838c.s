.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6c0c
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02072b68
.extern func_020740c8
.extern func_ov096_02218590

.global func_ov096_0221838c
func_ov096_0221838c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrsh r1, [r8, #0xd6]
    mov r5, #0x0
    mov r6, r5
    mov r7, r5
    cmp r1, #0x16
    mov r4, #0x100
    addls pc, pc, r1, lsl #0x2
    b .L_02218504
.L_022183b8:
    b .L_02218504
    b .L_02218484
    b .L_02218470
    b .L_02218470
    b .L_02218470
    b .L_02218434
    b .L_02218434
    b .L_02218414
    b .L_02218468
    b .L_02218468
    b .L_02218504
    b .L_022184f0
    b .L_02218504
    b .L_022184f8
    b .L_02218504
    b .L_02218504
    b .L_02218504
    b .L_022184a4
    b .L_022184c0
    b .L_022184cc
    b .L_022184a0
    b .L_02218504
    b .L_0221847c
.L_02218414:
    ldrh r1, [r8, #0x4e]
    ldr r0, .L_02218584
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldrneb r0, [r8, #0xd4]
    movne r7, #0x1
    addne r5, r0, #0x15
    bne .L_02218504
.L_02218434:
    ldrsh r0, [r8, #0xda]
    cmp r0, #0x0
    bne .L_02218458
    mov r0, r8
    ldrb r5, [r8, #0xd4]
    bl func_ov096_02218590
    cmp r0, #0x0
    movne r4, #0x180
    b .L_02218504
.L_02218458:
    mov r6, #0x1
    mov r7, r6
    ldrb r5, [r8, #0xd4]
    b .L_02218504
.L_02218468:
    ldrb r5, [r8, #0xd4]
    b .L_02218504
.L_02218470:
    ldrb r0, [r8, #0xd4]
    add r5, r0, #0x8
    b .L_02218504
.L_0221847c:
    mov r5, #0x11
    b .L_02218504
.L_02218484:
    bl func_ov096_02218590
    cmp r0, #0x0
    ldrneb r5, [r8, #0xd4]
    ldreqb r0, [r8, #0xd4]
    moveq r7, #0x1
    moveq r4, r5
    addeq r5, r0, #0x8
.L_022184a0:
    b .L_02218504
.L_022184a4:
    ldrh r1, [r8, #0x4e]
    ldr r0, .L_02218588
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    movne r5, #0x15
    movne r7, #0x1
    b .L_02218504
.L_022184c0:
    mov r5, #0x10
    mov r7, #0x1
    b .L_02218504
.L_022184cc:
    ldrh r1, [r8, #0x4e]
    ldr r0, .L_0221858c
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldreqb r0, [r8, #0xd4]
    movne r5, #0x14
    movne r7, #0x1
    addeq r5, r0, #0x8
    b .L_02218504
.L_022184f0:
    mov r5, #0x12
    b .L_02218504
.L_022184f8:
    ldrb r0, [r8, #0xd4]
    mov r7, #0x1
    add r5, r0, #0x16
.L_02218504:
    add r0, r8, r6, lsl #0x2
    ldr r6, [r0, #0x208]
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r8, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r8, #0x54]
    and r1, r5, #0xff
    bl func_02072b68
    ldr r0, [r8, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r8, #0x54]
    cmp r7, #0x0
    strh r1, [r0, #0x30]
    ldr r1, [r8, #0x54]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x3
    bne .L_02218578
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
.L_02218578:
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02218584: .word data_020e6c0c
.L_02218588: .word data_020e6b74
.L_0221858c: .word data_020e6adc
.size func_ov096_0221838c, . - func_ov096_0221838c
