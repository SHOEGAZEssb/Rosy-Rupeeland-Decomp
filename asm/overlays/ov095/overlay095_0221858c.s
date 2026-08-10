.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Alloc
.extern OS_Halt
.extern data_020c9670
.extern data_021052fc
.extern data_ov095_0221ceb8
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_02005084
.extern func_020050a4
.extern func_0200637c
.extern func_020064b8
.extern func_020099c0
.extern func_0201e0ec
.extern func_0201f864
.extern Actor_GetCachedTerrainHeight
.extern func_02034a60
.extern ActorExtendedType2_InitializeTransformAndMotion
.extern func_0204cfa4
.extern func_02050078
.extern func_020592d8
.extern func_020593dc
.extern func_0205940c
.extern func_0205946c
.extern func_020a25c8
.extern func_020a2844
.extern func_020a291c
.extern func_020a29ac
.extern func_020a2a4c
.extern func_020ada8c
.extern func_020adae4
.extern func_020adc90
.extern func_020befec
.extern func_020bf1f8
.extern func_ov095_02217d58
.extern func_ov095_02217d90
.extern func_ov095_02218130
.extern func_ov095_02218404
.extern func_ov095_02218414
.extern func_ov095_02218534
.extern func_ov095_0221a208
.extern func_ov095_0221a250
.extern func_ov095_0221a294
.extern func_ov095_0221aedc
.extern func_ov095_0221af0c
.extern func_ov095_0221b060
.extern gHeapContext
.extern gSoundContext
.extern genrand_int32

.global func_ov095_0221858c
func_ov095_0221858c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x308
    mov r4, r0
    ldr r1, [r4, #0x260]
    ldr r0, .L_02219494
    orr r1, r1, #0x21
    orr r1, r1, #0x1000
    and r0, r1, r0
    str r0, [r4, #0x260]
    mov r0, #0x1b
    strh r0, [r4, #0xd6]
    mov r1, #0x3
    ldr r0, .L_02219498
    strb r1, [r4, #0x24c]
    add r2, r4, #0x200
    ldr r0, [r0, #0x0]
    ldrsh r1, [r2, #0x98]
    add r0, r0, #0x2000
    ldr r8, [r0, #0xea4]
    cmp r1, #0x0
    bne .L_02218788
    ldrsh r0, [r2, #0xd4]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_02218778
.L_022185f0:
    b .L_02218604
    b .L_0221864c
    b .L_02218684
    b .L_022186ac
    b .L_0221872c
.L_02218604:
    add r0, r4, #0x2e0
    add r1, r4, #0x18
    bl func_020050a4
    mov r2, #0x0
    strh r2, [r4, #0xda]
    ldr r0, [r4, #0x260]
    mov r1, #0x200
    orr r0, r0, #0x400
    str r0, [r4, #0x260]
    str r2, [sp, #0x0]
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0x9
    bl func_020593dc
    b .L_0221877c
.L_0221864c:
    mov r0, #0x4
    strh r0, [r4, #0xda]
    mov r0, #0x0
    strh r0, [r2, #0xd6]
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0x1
    bl func_020593dc
    b .L_0221877c
.L_02218684:
    mov r0, #0x0
    str r0, [sp, #0x0]
    sub r1, r0, #0x100
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_022194a0
    mov r3, r4
    mov r2, #0x9
    bl func_020593dc
.L_022186ac:
    mov r0, #0xc
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xd6]
    add r0, r4, #0x2e0
    add r1, r4, #0x18
    bl func_020050a4
    ldr r1, [r4, #0x300]
    add r0, sp, #0x2f8
    add r1, r1, #0x18
    bl func_02005030
    ldr r3, [r4, #0x2e4]
    ldr r0, [sp, #0x2fc]
    ldr r2, [r4, #0x2e8]
    ldr r1, [sp, #0x300]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    mov r1, #0x6
    bl func_020befec
    mov r0, r0, asr #0xc
    add r1, r0, #0xf
    ldr r2, [r4, #0x314]
    ldr r0, .L_022194a4
    mov r1, r1, lsl #0x12
    and r0, r2, r0
    orr r1, r0, r1, lsr #0x10
    add r0, sp, #0x2f8
    str r1, [r4, #0x314]
    bl func_02005058
    b .L_0221877c
.L_0221872c:
    mov r0, #0x11
    strh r0, [r4, #0xda]
    mov r3, #0x0
    add r0, r4, #0x2e0
    add r1, r4, #0x18
    strh r3, [r2, #0xd6]
    bl func_020050a4
    add r0, r4, #0x2f0
    add r1, r4, #0x18
    bl func_020050a4
    ldr r1, [r4, #0x2fc]
    ldr r0, .L_022194a4
    add r1, r1, #0x10000
    str r1, [r4, #0x2fc]
    ldr r1, [r4, #0x314]
    and r0, r1, r0
    orr r0, r0, #0x78
    str r0, [r4, #0x314]
    b .L_0221877c
.L_02218778:
    bl OS_Halt
.L_0221877c:
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xdc]
.L_02218788:
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x98]
    ldr r1, .L_02219498
    add r2, r2, #0x1
    strh r2, [r0, #0x98]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    add r1, r4, #0x200
    ldrsh r1, [r1, #0xd4]
    mov r5, r0
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_0221a1f8
.L_022187c4:
    b .L_022187d8
    b .L_02218ba4
    b .L_022196d8
    b .L_022196d8
    b .L_02219ea4
.L_022187d8:
    mov r1, #0x0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    str r1, [r4, #0x3c]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0221a1f8
.L_02218818:
    b .L_02218828
    b .L_02218900
    b .L_02218958
    b .L_02218b10
.L_02218828:
    mov r2, #0x0
    strb r2, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x14
    movgt r1, #0x1
    strgth r1, [r4, #0xda]
    strgth r2, [r0, #0xdc]
    bgt .L_0221a1f8
    add r0, sp, #0x128
    add r1, r4, #0x2f0
    add r2, r4, #0x2e0
    bl func_ov095_02218414
    add r0, sp, #0x118
    add r1, sp, #0x128
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0x2e8
    add r2, sp, #0x118
    add r1, r4, #0x2e0
    bl func_ov095_02217d58
    add r0, sp, #0x118
    bl func_02005058
    add r0, sp, #0x128
    bl func_02005058
    ldr r1, [r4, #0x2fc]
    add r0, sp, #0x2b8
    str r1, [sp, #0x2f4]
    add r1, r4, #0x2e0
    add r2, r4, #0x2f0
    add r3, sp, #0x2e8
    bl func_ov095_0221a250
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x14
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x108
    add r1, sp, #0x2b8
    bl func_020064b8
    add r0, r4, #0x18
    add r1, sp, #0x108
    bl func_020050a4
    add r0, sp, #0x108
    bl func_02005058
    add r0, sp, #0x2b8
    bl func_0200637c
    add r0, sp, #0x2e8
    bl func_02005058
    b .L_0221a1f8
.L_02218900:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldr r1, [r4, #0x24]
    add r1, r1, #0x1000
    str r1, [r4, #0x24]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0xf
    movlt r0, #0x0
    strltb r0, [r4, #0x24c]
    blt .L_0221a1f8
    mov r1, #0x2
    mov r2, #0x0
    strh r1, [r4, #0xda]
    strh r2, [r0, #0xdc]
    ldr r1, [r4, #0x14]
    sub r0, r2, #0x3000
    bic r1, r1, #0x40
    str r1, [r4, #0x14]
    str r0, [r4, #0x44]
    b .L_0221a1f8
.L_02218958:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    bgt .L_0221a1f8
    ldr r1, [r4, #0x260]
    mov r0, #0x3
    orr r1, r1, #0x400
    str r1, [r4, #0x260]
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xdc]
    ldrb r2, [r4, #0xd4]
    add r0, sp, #0x2a8
    add r1, r4, #0x18
    mov r5, r2, lsl #0xd
    bl func_02005030
    mov r0, r5, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r2, r0, lsl #0x1
    ldr r6, .L_022194a8
    mov r1, r1, lsl #0x1
    ldrsh r5, [r6, r1]
    ldrsh r6, [r6, r2]
    ldr r1, [sp, #0x2ac]
    mvn r0, #0x13
    mla r3, r5, r0, r1
    mov r0, #0xb
    smulbb r0, r6, r0
    ldr r2, [sp, #0x2b0]
    add r0, r0, #0x10000
    add r0, r2, r0
    str r0, [sp, #0x2b0]
    add r1, sp, #0x2a8
    str r3, [sp, #0x2ac]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xd4]
    mov r2, r1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2bc]
    ldrsh r0, [r0, #0x0]
    bl func_02050078
    ldr r1, [r4, #0x1c]
    mvn r0, #0x2f
    mla r0, r5, r0, r1
    str r0, [sp, #0x2ac]
    ldr r1, [r4, #0x20]
    mov r0, #0x14
    mla r1, r6, r0, r1
    add r5, r1, #0x4000
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r2, #0x4
    str r5, [sp, #0x2b0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218a84
    ldr r3, .L_022194b4
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x4
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x2a8
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02218a84:
    mov r0, #0x0
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0x2
    bl func_020593dc
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xd4]
    mov r0, r4
    add r1, r4, r1, lsl #0x2
    ldr r2, [r1, #0x2bc]
    ldrsh r1, [r2, #0xe]
    str r1, [sp, #0x0]
    ldrsh r3, [r2, #0x10]
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    add r3, r3, #0x28
    bl func_ov095_0221af0c
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    beq .L_02218b04
    ldr r0, .L_02219498
    mov r1, #0xf
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
.L_02218b04:
    add r0, sp, #0x2a8
    bl func_02005058
    b .L_0221a1f8
.L_02218b10:
    ldr r1, [r4, #0x260]
    add r0, r4, #0x200
    orr r1, r1, #0x400
    str r1, [r4, #0x260]
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x5a
    ble .L_0221a1f8
    mov r1, #0x2
    strb r1, [r4, #0x24c]
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x400
    str r1, [r4, #0x260]
    ldrh r0, [r0, #0x9c]
    cmp r0, #0x2
    movhs r0, #0x1
    movlo r0, #0x0
    cmp r0, #0x0
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    movne r2, #0x3c
    moveq r2, #0x1e
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r0, [r0, #0xdc]
    cmp r0, r2
    ble .L_0221a1f8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x98]
    b .L_0221a1f8
.L_02218ba4:
    mov r1, #0x0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    str r1, [r4, #0x3c]
    add r0, r4, #0x98
    bl func_ov095_02218404
    ldrsh r0, [r4, #0xda]
    mov r2, #0x100
    mov r8, r2
    sub r0, r0, #0x4
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_022196bc
.L_02218bdc:
    b .L_02218bfc
    b .L_02218d44
    b .L_02218f14
    b .L_022191dc
    b .L_02219370
    b .L_022194c4
    b .L_022194c4
    b .L_02219660
.L_02218bfc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    add r0, r4, #0x200
    ldrsh r3, [r0, #0xdc]
    mov r2, #0x0
    mov r1, #0x28
    add r3, r3, #0x8
    strh r3, [r0, #0xdc]
    ldr r3, [r4, #0x24]
    add r3, r3, #0x800
    str r3, [r4, #0x24]
    ldrsh r3, [r0, #0xdc]
    strb r2, [r4, #0x24c]
    ldrsh r0, [r0, #0xdc]
    rsb r8, r3, #0x100
    bl func_020befec
    cmp r1, #0x0
    bne .L_02218c94
    mov r0, #0x30
    str r0, [sp, #0x0]
    mov r0, #0x18
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x24]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r5
    sub r2, r2, #0x18
    sub r3, r1, #0xc
    mov r1, #0x0
    bl func_020a25c8
.L_02218c94:
    cmp r8, #0x10
    bge .L_022196bc
    mov r0, #0x5
    strh r0, [r4, #0xda]
    add r2, r4, #0x200
    mov r3, #0x0
    add r0, r4, #0x2e0
    add r1, r4, #0x18
    strh r3, [r2, #0xdc]
    mov r8, #0x10
    bl func_020050a4
    add r0, sp, #0x298
    add r1, r4, #0x18
    bl func_02005030
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x2a4]
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218d38
    ldr r3, .L_022194b8
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x80
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x298
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02218d38:
    add r0, sp, #0x298
    bl func_02005058
    b .L_022196bc
.L_02218d44:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r0, #0x0
    strb r0, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x3
    bl func_020befec
    cmp r1, #0x0
    bne .L_02218d9c
    ldr r0, [r4, #0x2ec]
    ldr r2, [r4, #0x2e4]
    ldr r3, [r4, #0x2e8]
    mov r1, r0, asr #0xc
    mov r0, r5
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x0
    bl func_020a29ac
.L_02218d9c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x2d
    bgt .L_02218e9c
    mov r1, #0x0
    add r0, sp, #0xf8
    mov r2, r1
    mov r3, #0x20000
    bl func_0200500c
    ldr r1, [r4, #0x228]
    add r0, sp, #0x288
    add r2, sp, #0xf8
    add r1, r1, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0xf8
    bl func_02005058
    mov r0, r4
    add r1, sp, #0x288
    bl func_ov095_0221b060
    add r0, sp, #0xe8
    add r1, sp, #0x288
    add r2, r4, #0x2e0
    bl func_ov095_02218414
    add r0, sp, #0xd8
    add r1, sp, #0xe8
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0x278
    add r1, r4, #0x2e0
    add r2, sp, #0xd8
    bl func_ov095_02217d58
    add r0, sp, #0xd8
    bl func_02005058
    add r0, sp, #0xe8
    bl func_02005058
    add r0, sp, #0x248
    add r1, r4, #0x2e0
    add r2, sp, #0x288
    add r3, sp, #0x278
    bl func_ov095_0221a250
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x2d
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0xc8
    add r1, sp, #0x248
    bl func_020064b8
    add r0, r4, #0x18
    add r1, sp, #0xc8
    bl func_020050a4
    add r0, sp, #0xc8
    bl func_02005058
    add r0, sp, #0x248
    bl func_0200637c
    add r0, sp, #0x278
    bl func_02005058
    add r0, sp, #0x288
    bl func_02005058
    b .L_022196bc
.L_02218e9c:
    mov r1, #0x6
    strh r1, [r4, #0xda]
    mov r8, #0x10
    strh r8, [r0, #0xdc]
    ldr r0, [r4, #0x14]
    mov r1, #0x200
    orr r0, r0, #0x80
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x54]
    mov r2, #0x0
    strb r2, [r0, #0x3a]
    str r2, [sp, #0x0]
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0x5
    bl func_020593dc
    add r0, r4, #0x300
    mov r2, #0x0
    strh r2, [r0, #0x1c]
    ldr r1, .L_0221949c
    strh r2, [r0, #0x1e]
    ldr r0, [r1, #0x0]
    mov r1, #0xd0
    mov r2, #0x28
    mov r3, #0x50
    bl func_020592d8
    b .L_022196bc
.L_02218f14:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x10
    strh r1, [r0, #0xdc]
    ldrsh r0, [r0, #0xdc]
    mov r8, r0
    cmp r0, #0x100
    movge r8, r2
    cmp r0, #0x400
    bgt .L_02218fc4
    ldr r1, [r4, #0x228]
    add r0, sp, #0x238
    add r1, r1, #0x18
    bl func_02005030
    add r1, sp, #0x238
    mov r0, r4
    bl func_ov095_0221b060
    ldr r3, [sp, #0x23c]
    ldr r2, [r4, #0x1c]
    ldr r1, [sp, #0x240]
    ldr r0, [r4, #0x20]
    sub r6, r3, r2
    sub r7, r1, r0
    mov r0, r6
    mov r1, r7
    bl func_0204cfa4
    cmp r0, #0x1000
    ble .L_02218fbc
    mov r1, #0x1c
    mul r9, r0, r1
    mov r0, r6
    mov r1, r9
    bl func_020adc90
    ldr r2, [r4, #0x8c]
    mov r1, r9
    add r2, r2, r0
    mov r0, r7
    str r2, [r4, #0x8c]
    bl func_020adc90
    ldr r1, [r4, #0x90]
    add r0, r1, r0
    str r0, [r4, #0x90]
.L_02218fbc:
    add r0, sp, #0x238
    bl func_02005058
.L_02218fc4:
    ldr r1, [r4, #0x24]
    add r0, r4, #0x200
    add r1, r1, #0x800
    str r1, [r4, #0x24]
    ldrsh r0, [r0, #0xdc]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    adds r0, r1, r0, ror #0x1b
    bne .L_0221902c
    mov r0, #0x30
    str r0, [sp, #0x0]
    mov r0, #0x18
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x24]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r5
    sub r2, r2, #0x18
    sub r3, r1, #0xc
    mov r1, #0x0
    bl func_020a25c8
.L_0221902c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x500
    blt .L_02219064
    mov r1, #0x7
    strh r1, [r4, #0xda]
    mov r1, #0x0
    strh r1, [r0, #0xdc]
    ldr r1, [r4, #0x14]
    mov r0, #0x3800
    bic r1, r1, #0xc0
    str r1, [r4, #0x14]
    str r0, [r4, #0x44]
    b .L_022196bc
.L_02219064:
    mov r1, #0x0
    strb r1, [r4, #0x24c]
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x60
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_02219168
    add r0, sp, #0x228
    add r1, r4, #0x18
    bl func_02005030
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x234]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xd4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2bc]
    ldrsh r0, [r0, #0x10]
    mov r6, r0, lsl #0xc
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r1, r2, #0x1
    mov r0, r5
    mov r5, r1, lsl #0x1
    ldr r3, .L_022194a8
    mov r1, r2, lsl #0x1
    ldrsh r10, [r3, r5]
    ldrsh r3, [r3, r1]
    ldr r2, [sp, #0x22c]
    smull r9, r7, r10, r6
    adds r9, r9, #0x800
    mov r5, r10, lsl #0x2
    adc r7, r7, #0x0
    mov r9, r9, lsr #0xc
    orr r9, r9, r7, lsl #0x14
    add r2, r2, r9
    str r2, [sp, #0x22c]
    smull r6, r2, r3, r6
    adds r6, r6, #0x800
    ldr r1, [sp, #0x230]
    adc r2, r2, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r2, lsl #0x14
    add r1, r1, r6
    str r1, [sp, #0x230]
    rsb r5, r5, #0x0
    mov r1, r3, lsl #0x2
    str r5, [sp, #0x0]
    rsb r1, r1, #0x0
    str r1, [sp, #0x4]
    mov r1, #0x12
    str r1, [sp, #0x8]
    ldr r3, [sp, #0x234]
    ldr r2, [sp, #0x22c]
    ldr r5, [sp, #0x230]
    mov r3, r3, asr #0xc
    mov r1, #0x2
    mov r2, r2, asr #0xc
    rsb r3, r3, r5, asr #0xc
    bl func_020a2a4c
    add r0, sp, #0x228
    bl func_02005058
.L_02219168:
    add r0, r4, #0x300
    ldrsh r1, [r0, #0x1e]
    add r1, r1, #0x18
    strh r1, [r0, #0x1e]
    ldrsh r1, [r0, #0x1e]
    cmp r1, #0x5a0
    movgt r1, #0x5a0
    strgth r1, [r0, #0x1e]
    add r0, r4, #0x300
    ldrsh r0, [r0, #0x1e]
    mov r1, #0x3c
    bl func_020adae4
    add r1, r4, #0x300
    ldrsh r2, [r1, #0x1c]
    add r0, r0, #0x6
    add r0, r2, r0
    strh r0, [r1, #0x1c]
    ldrsh r0, [r1, #0x1c]
    mov r2, #0x5
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgth r0, [r1, #0x1c]
    add r0, r4, #0x300
    ldr r1, .L_0221949c
    ldrsh r3, [r0, #0x1c]
    ldr r0, [r1, #0x0]
    ldr r1, .L_022194a0
    bl func_0205946c
    b .L_022196bc
.L_022191dc:
    ldr r1, .L_022194bc
    add r0, r4, #0x88
    bl func_ov095_02218534
    mov r0, r4
    add r1, r4, #0x18
    bl func_ov095_0221b060
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    bgt .L_022196bc
    mov r0, #0x8
    strh r0, [r4, #0xda]
    ldr r1, .L_0221949c
    add r0, r4, #0x200
    mov r2, #0x0
    strh r2, [r0, #0xdc]
    ldr r0, [r1, #0x0]
    ldr r1, .L_022194a0
    mov r2, #0x5
    bl func_0205940c
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xd4]
    add r1, r4, #0x18
    mov r2, r1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2bc]
    ldrsh r0, [r0, #0x0]
    bl func_02050078
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022192a8
    ldr r3, .L_022194c0
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x4
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_022192a8:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xd4]
    mov r0, r4
    add r1, r4, r1, lsl #0x2
    ldr r2, [r1, #0x2bc]
    ldrsh r1, [r2, #0xe]
    str r1, [sp, #0x0]
    ldrsh r3, [r2, #0x10]
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    add r3, r3, #0x28
    bl func_ov095_0221af0c
    ldr r0, .L_02219498
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
    mov r0, #0xe
    str r0, [sp, #0x0]
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x1c]
    ldr r3, [r4, #0x20]
    mov r0, r5
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    rsb r1, r1, r3, asr #0xc
    sub r3, r1, #0x18
    mov r1, #0x5
    bl func_020a2844
    ldr r1, [r4, #0x314]
    mov r0, #0x0
    bic r1, r1, #0x2
    str r1, [r4, #0x314]
    str r0, [sp, #0x0]
    mov r0, #0x200
    str r0, [sp, #0x4]
    sub r1, r0, #0x12
    ldr r0, .L_0221949c
    mov r2, #0x8
    ldr r0, [r0, #0x0]
    mov r3, r4
    bl func_020593dc
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov095_02218404
    b .L_022196bc
.L_02219370:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0xa
    ble .L_022196bc
    mov r1, #0x9
    strh r1, [r4, #0xda]
    mov r2, #0x0
    strh r2, [r0, #0xdc]
    str r2, [sp, #0x0]
    mov r1, #0x200
    str r1, [sp, #0x4]
    ldr r0, .L_0221949c
    mov r3, r4
    ldr r0, [r0, #0x0]
    sub r1, r1, #0x12
    mov r2, #0x7
    bl func_020593dc
    mov r1, #0x0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    str r1, [r4, #0x3c]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    mov r0, #0x5000
    str r0, [r4, #0x44]
    ldr r1, [r4, #0xd0]
    ldr r3, .L_022194b0
    orr r1, r1, #0x2000
    str r1, [r4, #0xd0]
    ldr r1, .L_022194ac
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02219478
    ldr r3, .L_022194b8
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x80
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02219478:
    ldr r0, .L_0221949c
    mov r1, #0xd0
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    mov r3, #0x5a
    bl func_020592d8
    b .L_022196bc
.L_02219494: .word 0xfffffbf5
.L_02219498: .word data_021052fc
.L_0221949c: .word gSoundContext
.L_022194a0: .word 0x1ee
.L_022194a4: .word 0xffff0003
.L_022194a8: .word data_020c9670
.L_022194ac: .word data_ov095_0221ceb8
.L_022194b0: .word gHeapContext
.L_022194b4: .word 0x166b
.L_022194b8: .word 0x162c
.L_022194bc: .word 0xccd
.L_022194c0: .word 0x166e
.L_022194c4:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    ldr r1, [r4, #0x260]
    mov r0, #0xa
    orr r1, r1, #0xa
    str r1, [r4, #0x260]
    strh r0, [r4, #0xda]
    mov r0, #0x8
    strb r0, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    cmp r0, #0x96
    bge .L_02219598
    mov r1, #0x19
    bl func_020befec
    cmp r1, #0x0
    bne .L_02219598
    bl genrand_int32
    ldr r1, .L_02219498
    ldr r3, [r4, #0x20]
    ldr r1, [r1, #0x0]
    ldr r2, [r4, #0x1c]
    add r1, r1, #0x37c
    mov r7, r0
    add r0, r1, #0x2c00
    mov r9, r3, asr #0xc
    mov r10, r2, asr #0xc
    ldr r6, [r4, #0x24]
    bl func_0201e0ec
    mov r11, r0
    add r0, r4, #0x68
    bl func_ov095_02217d90
    mov r5, r0
    mov r0, r7
    mov r1, #0x18
    bl func_020bf1f8
    mov r0, r5
    mov r5, r1
    mov r1, #0x3
    bl func_020befec
    sub r1, r10, #0xc
    add r2, r5, r1
    mov r1, r7, lsr #0x4
    sub r3, r9, r6, asr #0xc
    and r1, r1, #0xf
    sub r1, r3, r1
    sub r3, r1, r0
    mov r0, r11
    mov r1, #0x1
    bl func_020a291c
.L_02219598:
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x9
    bne .L_022195c0
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0xa
    strneh r0, [r4, #0xda]
.L_022195c0:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r0, [r0, #0xdc]
    cmp r0, #0xaa
    ble .L_022196bc
    mov r0, r4
    bl func_ov095_0221a294
    cmp r0, #0x0
    beq .L_022196bc
    mov r0, #0xb
    mov r1, #0x0
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    strh r1, [r0, #0xdc]
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    str r1, [r4, #0x3c]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    mov r0, #0x5000
    str r0, [r4, #0x44]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x200
    str r1, [sp, #0x4]
    ldr r0, .L_0221949c
    mov r3, r4
    ldr r0, [r0, #0x0]
    sub r1, r1, #0x12
    mov r2, #0x9
    bl func_020593dc
    b .L_022196bc
.L_02219660:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r0, r4
    bl func_ov095_0221a294
    cmp r0, #0x0
    beq .L_022196bc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x98]
    ldr r2, [r4, #0x314]
    mov r1, #0x7
    bic r3, r2, #0x3f0000
    bic r2, r3, #0x80000000
    orr r2, r2, #0x80000000
    str r2, [r4, #0x314]
    strh r1, [r0, #0xde]
.L_022196bc:
    add r0, r8, #0x100
    ldr r1, [r4, #0x54]
    add r0, r0, r0, lsr #0x1f
    strh r8, [r1, #0x32]
    mov r0, r0, asr #0x1
    strh r0, [r1, #0x34]
    b .L_0221a1f8
.L_022196d8:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    ldrsh r0, [r4, #0xda]
    sub r0, r0, #0xc
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_0221a1f8
.L_02219728:
    b .L_0221973c
    b .L_02219860
    b .L_022199b4
    b .L_02219a0c
    b .L_02219be8
.L_0221973c:
    mov r1, #0x0
    strb r1, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r2, [r0, #0xdc]
    add r2, r2, #0x1
    strh r2, [r0, #0xdc]
    ldr r2, [r4, #0x314]
    ldrsh r3, [r0, #0xdc]
    mov r2, r2, lsl #0x10
    cmp r3, r2, lsr #0x12
    bhi .L_02219850
    add r0, sp, #0xb8
    mov r2, #0x80000
    mov r3, #0x30000
    bl func_0200500c
    ldr r1, [r4, #0x300]
    add r0, sp, #0x218
    add r2, sp, #0xb8
    add r1, r1, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0xb8
    bl func_02005058
    add r0, sp, #0xa8
    add r1, sp, #0x218
    add r2, r4, #0x2e0
    bl func_ov095_02218414
    add r0, sp, #0x98
    add r1, sp, #0xa8
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0x208
    add r1, r4, #0x2e0
    add r2, sp, #0x98
    bl func_ov095_02217d58
    add r0, sp, #0x98
    bl func_02005058
    add r0, sp, #0xa8
    bl func_02005058
    ldr r1, [sp, #0x224]
    add r0, sp, #0x1d8
    add r1, r1, #0x8000
    str r1, [sp, #0x214]
    add r1, r4, #0x2e0
    add r2, sp, #0x218
    add r3, sp, #0x208
    bl func_ov095_0221a250
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    ldr r1, [r4, #0x314]
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0xc
    mov r1, r1, lsr #0x12
    bl func_020bf1f8
    mov r2, r0
    add r0, sp, #0x88
    add r1, sp, #0x1d8
    bl func_020064b8
    add r0, r4, #0x18
    add r1, sp, #0x88
    bl func_020050a4
    add r0, sp, #0x88
    bl func_02005058
    add r0, sp, #0x1d8
    bl func_0200637c
    add r0, sp, #0x208
    bl func_02005058
    add r0, sp, #0x218
    bl func_02005058
    b .L_0221a1f8
.L_02219850:
    mov r2, #0xd
    strh r2, [r4, #0xda]
    strh r1, [r0, #0xdc]
    b .L_0221a1f8
.L_02219860:
    mov r0, r4
    mov r1, #0x30000
    mov r2, #0x8
    bl func_ov095_0221aedc
    mov r2, #0x0
    strb r2, [r4, #0x24c]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0221a1f8
    mov r1, #0xe
    strh r1, [r4, #0xda]
    add r5, r4, #0x200
    add r0, sp, #0x78
    mov r1, #0x13000
    mov r3, #0x47000
    strh r2, [r5, #0xdc]
    bl func_0200500c
    add r0, sp, #0x1c8
    add r2, sp, #0x78
    add r1, r4, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0x78
    bl func_02005058
    mov r0, r5
    ldrsh r0, [r0, #0xd4]
    ldr r1, .L_0221a200
    mov r2, #0x0
    cmp r0, #0x2
    mov r0, r4
    bne .L_02219948
    bl func_02034a60
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022199a8
    ldr r3, .L_0221a204
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x3
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    sub r1, r1, #0x8
    str r1, [sp, #0xc]
    mov r1, #0x1
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x1c8
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
    b .L_022199a8
.L_02219948:
    bl func_02034a60
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022199a8
    ldr r3, .L_0221a204
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x3
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    sub r1, r1, #0x8
    str r1, [sp, #0xc]
    mov r1, #0x1
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x1c8
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_022199a8:
    add r0, sp, #0x1c8
    bl func_02005058
    b .L_0221a1f8
.L_022199b4:
    mov r0, r4
    mov r1, #0x30000
    mov r2, #0x8
    bl func_ov095_0221aedc
    mov r0, #0x0
    strb r0, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x3c
    ble .L_0221a1f8
    ldrsh r0, [r0, #0xd4]
    mov r1, #0x0
    cmp r0, #0x2
    moveq r0, #0x10
    movne r0, #0xf
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    strh r1, [r0, #0xdc]
    b .L_0221a1f8
.L_02219a0c:
    mov r0, r4
    mov r1, #0x30000
    mov r2, #0x8
    bl func_ov095_0221aedc
    add r0, sp, #0x68
    mov r1, #0x5000
    mov r2, #0x8000
    mov r3, #0x1a000
    bl func_0200500c
    add r0, sp, #0x1b8
    add r2, sp, #0x68
    add r1, r4, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0x68
    bl func_02005058
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x3c
    bl func_020befec
    ldrb r0, [r4, #0x318]
    mov r8, r1
    cmp r0, #0x2
    moveq r6, #0x4
    movne r6, #0x2
    cmp r0, #0x0
    moveq r7, #0x2
    movne r7, #0x0
    cmp r8, #0x1e
    bge .L_02219ad8
    mov r0, r8
    mov r1, #0x3
    bl func_020befec
    cmp r1, #0x0
    bne .L_02219ad8
    mov r0, #0x30
    str r0, [sp, #0x0]
    mov r0, #0x18
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x1c4]
    ldr r2, [sp, #0x1bc]
    ldr r1, [sp, #0x1c0]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r5
    sub r2, r2, #0x18
    sub r3, r1, #0xc
    mov r1, #0x0
    bl func_020a25c8
.L_02219ad8:
    cmp r8, #0xa
    bne .L_02219b88
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0x3c
    bl func_020befec
    ldr r1, [r4, #0x228]
    mov r5, r0
    add r0, sp, #0x1a8
    add r2, sp, #0x1b8
    add r1, r1, #0x18
    bl func_ov095_02218414
    mov r1, #0x0
    add r0, sp, #0x1a8
    str r1, [sp, #0x1b4]
    bl func_02005084
    ldr r1, [sp, #0x1b0]
    ldr r2, [sp, #0x1ac]
    add r1, r1, r1, lsl #0x1
    add r0, r5, r7
    add r2, r2, r2, lsl #0x1
    str r1, [sp, #0x1b0]
    mov r1, #0x3000
    str r2, [sp, #0x1ac]
    str r1, [sp, #0x1b4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x304]
    add r1, sp, #0x1b8
    add r2, sp, #0x1a8
    bl ActorExtendedType2_InitializeTransformAndMotion
    ldr r0, [r4, #0xd0]
    mov r2, #0x0
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    mov r0, #0x200
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    sub r1, r0, #0x12
    ldr r0, .L_0221949c
    mov r3, r4
    ldr r0, [r0, #0x0]
    bl func_020593dc
    add r0, sp, #0x1a8
    bl func_02005058
.L_02219b88:
    add r0, r4, #0x200
    ldrsh r2, [r0, #0xdc]
    mov r1, #0x3c
    mul r1, r6, r1
    add r2, r2, #0x1
    strh r2, [r0, #0xdc]
    ldrsh r2, [r0, #0xdc]
    cmp r2, r1
    blt .L_02219bdc
    mov r1, #0x0
    strh r1, [r0, #0x98]
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x40
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x314]
    bic r1, r1, #0x3f0000
    str r1, [r4, #0x314]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
.L_02219bdc:
    add r0, sp, #0x1b8
    bl func_02005058
    b .L_0221a1f8
.L_02219be8:
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0x80
    str r1, [r4, #0x14]
    ldr r3, [r4, #0x54]
    mov r6, #0x0
    mov r1, #0x30000
    mov r2, #0x8
    strb r6, [r3, #0x3a]
    bl func_ov095_0221aedc
    add r0, r4, #0x200
    ldrsh r2, [r0, #0xdc]
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1c
    adds r6, r1, r0, ror #0x1c
    bne .L_02219dc4
    mov r0, r2, asr #0x3
    add r2, r2, r0, lsr #0x1c
    add r0, sp, #0x198
    add r1, r4, #0x18
    mov r7, r2, asr #0x4
    bl func_02005030
    mov r0, r8
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x1a4]
    mov r0, r7
    mov r1, #0x6
    bl func_020befec
    ldr r1, [r4, #0x314]
    mov r8, r0
    mov r0, r1, lsl #0x1
    movs r0, r0, lsr #0x1f
    mov r0, r7
    mov r1, #0x6
    rsbne r8, r8, #0x4
    bl func_020befec
    ldr r0, [sp, #0x19c]
    mov r7, r1
    sub r1, r0, #0xc0000
    mov r0, #0x60000
    mla r3, r8, r0, r1
    ldr r2, [sp, #0x1a0]
    add r0, r7, r7, lsl #0x1
    sub r1, r2, #0x38000
    add r0, r1, r0, lsl #0x10
    str r0, [sp, #0x1a0]
    add r1, sp, #0x198
    str r3, [sp, #0x19c]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xd4]
    mov r2, r1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2bc]
    ldrsh r0, [r0, #0x0]
    bl func_02050078
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xd4]
    mov r0, r4
    add r1, r4, r1, lsl #0x2
    ldr r2, [r1, #0x2bc]
    ldrsh r1, [r2, #0xe]
    str r1, [sp, #0x0]
    ldrsh r3, [r2, #0x10]
    ldr r1, [sp, #0x19c]
    ldr r2, [sp, #0x1a0]
    bl func_ov095_0221af0c
    cmp r7, #0x0
    bne .L_02219dbc
    ldr r1, [r4, #0xd0]
    add r0, sp, #0x58
    orr r7, r1, #0x1000
    mov r1, #0x13000
    mov r2, #0x0
    mov r3, #0x17000
    str r7, [r4, #0xd0]
    bl func_0200500c
    add r0, sp, #0x48
    add r2, sp, #0x58
    add r1, r4, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0x198
    add r1, sp, #0x48
    bl func_020050a4
    add r0, sp, #0x48
    bl func_02005058
    add r0, sp, #0x58
    bl func_02005058
    ldr r1, .L_022194ac
    ldr r3, .L_022194b0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02219d98
    ldr r3, .L_0221a204
    mov r2, #0x1
    str r3, [sp, #0x0]
    add r1, r3, #0x3
    stmib sp, {r1, r2}
    sub r1, r2, #0x9
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x198
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_02219d98:
    mov r2, #0x0
    mov r1, #0x200
    str r2, [sp, #0x0]
    ldr r0, .L_0221949c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    bl func_020593dc
.L_02219dbc:
    add r0, sp, #0x198
    bl func_02005058
.L_02219dc4:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    cmp r0, #0x1
    bgt .L_02219e38
    mov r0, r6
    mov r1, #0x6
    bl func_020befec
    cmp r1, #0x0
    bne .L_02219e38
    mov r0, #0x30
    str r0, [sp, #0x0]
    mov r0, #0x18
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x24]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r5
    sub r2, r2, #0x18
    sub r3, r1, #0xc
    mov r1, #0x0
    bl func_020a25c8
.L_02219e38:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x1e0
    blt .L_0221a1f8
    mov r1, #0x0
    strh r1, [r0, #0x98]
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x40
    str r1, [r4, #0x14]
    ldr r3, [r4, #0x314]
    mov r1, #0x1
    mov r2, r3, lsl #0x1
    mov r2, r2, lsr #0x1f
    eor r2, r2, #0x1
    bic r3, r3, #0x40000000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x1
    str r2, [r4, #0x314]
    bl func_ov095_02218130
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x80
    str r0, [r4, #0x14]
    b .L_0221a1f8
.L_02219ea4:
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x11
    beq .L_02219ec4
    cmp r0, #0x12
    beq .L_02219ffc
    cmp r0, #0x13
    beq .L_0221a174
    b .L_0221a1f8
.L_02219ec4:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    mov r3, #0x0
    strb r3, [r4, #0x24c]
    add r2, r4, #0x200
    ldrsh r0, [r2, #0xdc]
    add r0, r0, #0x1
    strh r0, [r2, #0xdc]
    ldr r0, [r4, #0x314]
    ldrsh r1, [r2, #0xdc]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x12
    bhi .L_02219fe0
    add r0, sp, #0x38
    add r1, r4, #0x2f0
    add r2, r4, #0x2e0
    bl func_ov095_02218414
    add r0, sp, #0x28
    add r1, sp, #0x38
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0x188
    add r2, sp, #0x28
    add r1, r4, #0x2e0
    bl func_ov095_02217d58
    add r0, sp, #0x28
    bl func_02005058
    add r0, sp, #0x38
    bl func_02005058
    ldr r1, [r4, #0x2ec]
    add r0, sp, #0x158
    add r1, r1, #0x14000
    str r1, [sp, #0x194]
    add r1, r4, #0x2e0
    add r2, r4, #0x2f0
    add r3, sp, #0x188
    bl func_ov095_0221a250
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    ldr r1, [r4, #0x314]
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0xc
    mov r1, r1, lsr #0x12
    bl func_020bf1f8
    mov r2, r0
    add r0, sp, #0x18
    add r1, sp, #0x158
    bl func_020064b8
    add r0, r4, #0x18
    add r1, sp, #0x18
    bl func_020050a4
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x158
    bl func_0200637c
    add r0, sp, #0x188
    bl func_02005058
    b .L_0221a1f8
.L_02219fe0:
    mov r0, #0x12
    strh r0, [r4, #0xda]
    add r0, r4, #0x18
    add r1, r4, #0x2f0
    strh r3, [r2, #0xdc]
    bl func_020050a4
    b .L_0221a1f8
.L_02219ffc:
    mov r0, r4
    mov r1, #0x20000
    mov r2, #0x4
    bl func_ov095_0221aedc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov095_02218404
    mov r0, #0x0
    strb r0, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    cmp r0, #0x3c
    bge .L_0221a138
    mov r1, #0xf
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_0221a138
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    mov r1, #0xf
    bl func_020adae4
    mov r5, r0
    add r0, sp, #0x148
    add r1, r4, #0x18
    bl func_02005030
    add r0, sp, #0x138
    add r1, r4, #0x18
    bl func_02005030
    mov r1, #0x18000
    cmp r5, #0x1
    rsbgt r1, r1, #0x0
    ldr r0, [sp, #0x13c]
    cmp r5, #0x0
    add r0, r0, r1
    cmpne r5, #0x3
    moveq r2, #0x18000
    movne r2, #0x18000
    str r0, [sp, #0x13c]
    ldr r1, [sp, #0x140]
    rsbne r2, r2, #0x0
    add r1, r1, r2
    mov r0, r4
    str r1, [sp, #0x140]
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x144]
    str r0, [sp, #0x154]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xd4]
    add r1, sp, #0x148
    add r2, sp, #0x138
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2bc]
    ldrsh r0, [r0, #0x0]
    bl func_02050078
    mov r2, #0x0
    mov r1, #0x200
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_0221949c
    mov r3, r4
    ldr r0, [r0, #0x0]
    sub r1, r1, #0x12
    bl func_020593dc
    add r0, sp, #0x138
    bl func_02005058
    add r0, sp, #0x148
    bl func_02005058
.L_0221a138:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x78
    blt .L_0221a1f8
    mov r1, #0x13
    strh r1, [r4, #0xda]
    mov r1, #0x0
    strh r1, [r0, #0xdc]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x40
    str r0, [r4, #0x14]
    b .L_0221a1f8
.L_0221a174:
    mov r1, #0x0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    str r1, [r4, #0x3c]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    bne .L_0221a1f8
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x4b
    ble .L_0221a1f8
    mov r1, #0x0
    strh r1, [r0, #0x98]
    ldr r1, [r4, #0x314]
    mov r0, r4
    bic r1, r1, #0x3f0000
    str r1, [r4, #0x314]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
.L_0221a1f8:
    add sp, sp, #0x308
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221a200: .word 0x7a02
.L_0221a204: .word 0x221d
.size func_ov095_0221858c, . - func_ov095_0221858c
