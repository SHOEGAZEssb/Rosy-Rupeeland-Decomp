.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern data_020c9670
.extern data_021052fc
.extern data_ov088_0221ba04
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_020050f0
.extern func_0201f864
.extern func_0203292c
.extern func_02033f44
.extern func_02034a60
.extern Actor_ReplaceAttachmentSlotResource
.extern func_0203b798
.extern func_0203bba4
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020593ac
.extern func_020593dc
.extern func_0205940c
.extern func_0205946c
.extern func_020594a4
.extern func_020adae4
.extern func_020adc90
.extern func_020ae024
.extern func_020be334
.extern func_020befec
.extern func_020bf1f8
.extern func_ov088_022179f4
.extern func_ov088_02218290
.extern func_ov088_02219154
.extern func_ov088_02219168
.extern func_ov088_02219960
.extern func_ov088_0221a7c8
.extern func_ov088_0221a930
.extern func_ov088_0221a9c0
.extern func_ov088_0221add8
.extern func_ov088_0221b098
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext
.extern genrand_int32

.global func_ov088_02218328
func_ov088_02218328:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x78
    mov r4, r0
    add r0, r4, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02218360
    mov r0, r4
    mov r1, #0x0
    bl func_ov088_02219960
    b .L_02219100
.L_02218360:
    ldr r0, [r4, #0x10]
    tst r0, #0x1000000
    beq .L_02218378
    mov r0, r4
    bl func_0203b798
    b .L_02219100
.L_02218378:
    ldr r0, .L_02219108
    add r1, r4, #0x200
    ldr r0, [r0, #0x0]
    ldrh r2, [r1, #0x6e]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    add r0, r2, #0x1
    strh r0, [r1, #0x6e]
    ldrh r0, [r1, #0x1a]
    tst r0, #0x80
    beq .L_02218454
    ldr r0, .L_0221910c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0xe
    beq .L_02219100
    add r1, r4, #0x200
    ldrh r2, [r1, #0x1a]
    mov r0, r5
    bic r2, r2, #0x80
    strh r2, [r1, #0x1a]
    bl func_02033f44
    ldr r6, .L_02219110
    str r0, [r5, #0x34]
    str r0, [r5, #0x24]
    mov r0, #0x2
    strh r0, [r5, #0xd6]
    mov r0, r5
    sub r2, r6, #0x1
    sub r3, r6, #0x88
    mov r1, #0x0
    str r6, [sp, #0x0]
    bl Actor_ReplaceAttachmentSlotResource
    add r6, r6, #0x2
    mov r1, #0x1
    mov r0, r5
    sub r2, r6, #0x1
    add r3, r1, #0x1000
    str r6, [sp, #0x0]
    bl Actor_ReplaceAttachmentSlotResource
    ldr r1, .L_02219114
    add r0, r4, #0x25c
    bl func_ov088_02219154
    ldr r0, [r4, #0x238]
    ldrh r1, [r0, #0x22]
    cmp r1, #0x0
    beq .L_02218444
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
.L_02218444:
    ldr r1, .L_02219118
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
.L_02218454:
    add r0, r4, #0x200
    ldrh r3, [r0, #0x1a]
    tst r3, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02218594
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x1c]
    mov r0, #0x3c
    add r2, r2, #0xc
    strh r2, [r1, #0x1c]
    ldr r3, [r4, #0x238]
    ldrsh r2, [r1, #0x1c]
    ldrsh r3, [r3, #0x16]
    smulbb r3, r3, r0
    cmp r2, r3
    blt .L_022184a8
    mov r0, r4
    strh r3, [r1, #0x1c]
    bl func_ov088_0221a930
.L_022184a8:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x6e]
    mov r1, #0xa
    bl func_020befec
    cmp r1, #0x0
    bne .L_022185e8
    add r0, sp, #0x68
    add r1, r4, #0x18
    bl func_02005030
    bl genrand_int32
    ldr r1, .L_0221911c
    ldr r5, [sp, #0x6c]
    ldr r3, [sp, #0x70]
    sub r2, r1, #0x18000
    sub r5, r5, #0x10000
    and r1, r0, r1
    add r6, r5, r1
    and r1, r2, r0, lsr #0x8
    sub r3, r3, #0x8000
    add r1, r3, r1
    str r1, [sp, #0x70]
    str r6, [sp, #0x6c]
    mov r5, r0, lsr #0x8
    ldr r2, [sp, #0x74]
    ldr r0, [r4, #0x23c]
    ldr r1, .L_02219120
    add r2, r2, r0
    str r2, [sp, #0x74]
    ldr r3, .L_02219124
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218570
    ldr r3, .L_02219128
    mov r2, #0x2
    str r3, [sp, #0x0]
    add r1, r3, #0x3
    stmib sp, {r1, r2}
    sub r1, r2, #0x2a
    str r1, [sp, #0xc]
    sub r1, r2, #0x3
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x68
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_02218570:
    ldr r0, [r0, #0x8]
    tst r5, #0x100
    ldr r1, [r0, #0x4]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    strneh r0, [r1, #0x24]
    add r0, sp, #0x68
    bl func_02005058
    b .L_022185e8
.L_02218594:
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x1c]
    mvn r1, #0x0
    cmp r2, r1
    beq .L_022185e8
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022185e8
    tst r3, #0x8
    bne .L_022185e8
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x1c]
    sub r1, r1, #0x1
    strh r1, [r0, #0x1c]
    ldrsh r1, [r0, #0x1c]
    cmp r1, #0x0
    movle r1, #0x0
    strleh r1, [r0, #0x1c]
.L_022185e8:
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_02218678
    ldr r0, .L_0221910c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_02219100
    ldr r1, [r4, #0x24c]
    cmp r1, #0x0
    bne .L_02218658
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov088_0221a9c0
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x28
    ldr r2, [r2, #0xc8]
    blx r2
    add r0, sp, #0x28
    bl func_02005058
    mov r0, r4
    bl func_ov088_0221a7c8
    mov r0, r4
    bl func_ov088_02218290
    b .L_02219100
.L_02218658:
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    bne .L_02218678
    cmp r1, #0x0
    beq .L_02218678
    mov r0, r4
    bl func_ov088_0221b098
.L_02218678:
    mov r0, r4
    bl func_ov088_0221add8
    cmp r0, #0x0
    bne .L_02219100
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd0]
    blx r1
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02218d08
    add r0, r4, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x1
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_02218d08
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02218d08
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x32]
    ldr r0, .L_0221912c
    ldr r2, [r4, #0x208]
    smulbb r0, r1, r0
    smull r0, r3, r2, r0
    adds r5, r0, #0x800
    ldr r0, [r4, #0x3c]
    ldr r1, [r4, #0x40]
    adc r2, r3, #0x0
    mov r7, r5, lsr #0xc
    orr r7, r7, r2, lsl #0x14
    mov r5, #0x400
    bl func_0204cfa4
    ldr r1, .L_02219130
    cmp r0, r1
    ble .L_0221893c
    ldr r0, [r4, #0x40]
    ldr r1, [r4, #0x3c]
    bl func_020ae024
    ldr r1, [r4, #0xc8]
    sub r0, r0, #0x4000
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, #0x8000
    rsbhi r0, r6, #0x10000
    movhi r0, r0, lsl #0x10
    movhi r6, r0, lsr #0x10
    cmp r6, #0x3000
    bls .L_022187f0
    ldr r2, [r4, #0x3c]
    ldr r0, .L_02219134
    mov r1, #0x0
    umull r8, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    adds r8, r8, #0x800
    mla r3, r2, r0, r3
    adc r2, r3, #0x0
    mov r3, r8, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    umull r8, r3, r2, r0
    adds r8, r8, #0x800
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adc r2, r3, #0x0
    mov r3, r8, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x40]
    ldr r2, [r4, #0x44]
    umull r8, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r1, r8, #0x800
    adc r0, r3, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x44]
.L_022187f0:
    ldr r0, [r4, #0x238]
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_02218938
    add r2, r4, #0x200
    ldrsh r0, [r2, #0x34]
    cmp r0, #0x0
    bne .L_02218938
    cmp r6, #0x2000
    bls .L_02218938
    mov r3, #0xa
    add r0, sp, #0x58
    add r1, r4, #0x18
    strh r3, [r2, #0x34]
    bl func_02005030
    bl genrand_int32
    mov r1, #0x18000
    bl func_020bf1f8
    ldr r2, [sp, #0x5c]
    sub r0, r1, #0xc000
    add r0, r2, r0
    str r0, [sp, #0x5c]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr r1, [sp, #0x60]
    sub r0, r0, #0x10000
    add r0, r1, r0
    str r0, [sp, #0x60]
    ldr r1, .L_02219120
    ldr r3, .L_02219124
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022188c4
    ldr r2, [r4, #0x238]
    mov ip, #0x18
    ldrh r1, [r2, #0x1c]
    mov lr, #0x0
    sub r8, ip, #0x19
    str r1, [sp, #0x0]
    ldrh r9, [r2, #0x1e]
    mov r3, #0x1
    add r1, sp, #0x58
    stmib sp, {r9, lr}
    str ip, [sp, #0xc]
    str r8, [sp, #0x10]
    str r3, [sp, #0x14]
    ldr r8, [r4, #0x54]
    ldrh r3, [r2, #0x1a]
    ldr r2, [r8, #0x0]
    bl func_0201f864
.L_022188c4:
    ldr r3, [r4, #0x3c]
    mov r1, #0x1800
    umull ip, r8, r3, r1
    mov r2, #0x0
    mla r8, r3, r2, r8
    mov r3, r3, asr #0x1f
    mla r8, r3, r1, r8
    adds ip, ip, #0x800
    adc r8, r8, #0x0
    mov ip, ip, lsr #0xc
    ldr r3, [r0, #0x8]
    orr ip, ip, r8, lsl #0x14
    str ip, [r3, #0x1c]
    ldr r8, [r4, #0x40]
    ldr r0, [r0, #0x8]
    umull r3, ip, r8, r1
    adds r3, r3, #0x800
    mov lr, r3, lsr #0xc
    mla ip, r8, r2, ip
    mov r3, r8, asr #0x1f
    mla ip, r3, r1, ip
    adc r1, ip, #0x0
    orr lr, lr, r1, lsl #0x14
    str lr, [r0, #0x20]
    ldr r1, .L_02219138
    mov r0, r4
    bl func_02034a60
    add r0, sp, #0x58
    bl func_02005058
.L_02218938:
    sub r5, r5, r6, lsr #0x6
.L_0221893c:
    ldr r0, [r4, #0xc8]
    ldr r1, .L_0221913c
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r0, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r0, [r1, r0]
    ldrsh r6, [r1, r2]
    ldr r3, [r4, #0x208]
    smull r2, r1, r0, r7
    smull r3, r0, r6, r3
    adds r6, r3, #0x800
    adc r3, r0, #0x0
    adds r0, r2, #0x800
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    adc r3, r1, #0x0
    mov r2, r0, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    add r0, sp, #0x48
    rsb r1, r6, #0x0
    mov r3, #0x0
    bl func_0200500c
    add r1, sp, #0x48
    add r0, r4, #0x38
    bl func_020050c8
    add r0, r4, #0x3c
    add r1, r4, #0x40
    mov r2, #0x6000
    bl func_0204cff4
    cmp r7, #0x29
    ble .L_02218a24
    ldr r0, .L_02219140
    ldr r1, .L_02219144
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_020594a4
    cmp r0, #0x0
    bne .L_02218a04
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02219140
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0xfb
    mov r2, #0x4
    bl func_020593dc
.L_02218a04:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x400
    strh r1, [r0, #0x1a]
    ldrh r1, [r0, #0x1a]
    orr r1, r1, #0x200
    strh r1, [r0, #0x1a]
    b .L_02218ae8
.L_02218a24:
    mvn r0, #0x28
    cmp r7, r0
    bge .L_02218a94
    ldr r2, .L_02219140
    add r1, r0, #0x224
    ldr r0, [r2, #0x0]
    mov r2, #0x4
    bl func_020594a4
    cmp r0, #0x0
    bne .L_02218a74
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02219140
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0xfb
    mov r2, #0x4
    bl func_020593dc
.L_02218a74:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x200
    strh r1, [r0, #0x1a]
    ldrh r1, [r0, #0x1a]
    orr r1, r1, #0x400
    strh r1, [r0, #0x1a]
    b .L_02218ae8
.L_02218a94:
    ldr r2, .L_02219140
    add r1, r0, #0x224
    ldr r0, [r2, #0x0]
    mov r2, #0x4
    mov r5, #0x0
    bl func_020594a4
    cmp r0, #0x0
    beq .L_02218ad8
    ldr r0, .L_02219140
    ldr r1, .L_02219144
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    ldr r1, .L_02219148
    mov r0, r4
    mov r2, r5
    bl func_02034a60
.L_02218ad8:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x600
    strh r1, [r0, #0x1a]
.L_02218ae8:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x70]
    cmp r1, r5
    subgt r1, r1, #0x18
    strgth r1, [r0, #0x70]
    bgt .L_02218b08
    addlt r1, r1, #0x18
    strlth r1, [r0, #0x70]
.L_02218b08:
    ldr r0, [r4, #0x238]
    ldrh r2, [r0, #0x26]
    cmp r2, #0x0
    beq .L_02218b88
    ldr r0, .L_02219140
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_020594a4
    cmp r0, #0x0
    ldr r1, [r4, #0x238]
    add r0, r4, #0x200
    beq .L_02218b5c
    ldrh r2, [r1, #0x26]
    ldr r1, .L_02219140
    ldrsh r3, [r0, #0x70]
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_0205946c
    b .L_02218b88
.L_02218b5c:
    ldrh r5, [r1, #0x26]
    ldrsh r2, [r0, #0x70]
    mov r1, #0x100
    ldr r0, .L_02219140
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, r5, asr #0x7
    and r2, r5, #0x7f
    bl func_020593dc
.L_02218b88:
    ldr r0, .L_02219108
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    cmp r1, #0x28000
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r2, r0, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r2, lsl #0x10
    mov r2, r0, lsl #0x10
    ble .L_02218d00
    sub r0, r3, #0x28000
    cmp r1, r0
    bge .L_02218d00
    ldr r1, [r4, #0x20]
    cmp r1, #0x28000
    ble .L_02218d00
    sub r0, r2, #0x28000
    cmp r1, r0
    bge .L_02218d00
    ldrb r3, [r4, #0x4b]
    tst r3, #0xf
    beq .L_02218d00
    ands r1, r3, #0xc
    mov r0, #0x0
    cmpne r1, #0xc
    beq .L_02218c54
    tst r1, #0x4
    beq .L_02218c1c
    ldr r1, [r4, #0x40]
    cmp r1, #0x0
    rsbgt r0, r1, #0x0
    strgt r0, [r4, #0x40]
    movgt r0, #0x1
    b .L_02218c38
.L_02218c1c:
    tst r1, #0x8
    beq .L_02218c38
    ldr r1, [r4, #0x40]
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    strlt r0, [r4, #0x40]
    movlt r0, #0x1
.L_02218c38:
    ldr r2, [r4, #0x40]
    add r1, r4, #0x200
    rsb r2, r2, #0x0
    str r2, [r4, #0x40]
    ldrsh r2, [r1, #0x32]
    sub r2, r2, #0xa
    strh r2, [r1, #0x32]
.L_02218c54:
    ands r1, r3, #0x3
    cmpne r1, #0x3
    beq .L_02218cac
    tst r1, #0x1
    beq .L_02218c80
    ldr r1, [r4, #0x3c]
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    strlt r0, [r4, #0x3c]
    movlt r0, #0x1
    b .L_02218c9c
.L_02218c80:
    tst r1, #0x2
    beq .L_02218c9c
    ldr r1, [r4, #0x3c]
    cmp r1, #0x0
    rsbgt r0, r1, #0x0
    strgt r0, [r4, #0x3c]
    movgt r0, #0x1
.L_02218c9c:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x32]
    sub r2, r2, #0xa
    strh r2, [r1, #0x32]
.L_02218cac:
    cmp r0, #0x0
    ldrne r0, [r4, #0x238]
    ldrneh r2, [r0, #0x28]
    cmpne r2, #0x0
    beq .L_02218d00
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x36]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02219140
    movgt r3, #0x20
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    movle r3, #0x7f
    and r2, r2, #0x7f
    bl func_020593ac
    add r0, r4, #0x200
    mov r1, #0xa
    strh r1, [r0, #0x36]
.L_02218d00:
    add r0, sp, #0x48
    bl func_02005058
.L_02218d08:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x32]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x32]
    blt .L_02218d2c
    cmp r1, #0xc
    addlt r1, r1, #0x1
    strlth r1, [r0, #0x32]
.L_02218d2c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x36]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x36]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x34]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x34]
    ldr r2, [r4, #0x210]
    add r0, sp, #0x18
    add r1, r4, #0x38
    bl func_ov088_02219168
    add r1, sp, #0x18
    add r0, r4, #0x38
    bl func_020050f0
    add r0, sp, #0x18
    bl func_02005058
    mov r0, r4
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x14]
    bl func_0203bba4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    add r0, r4, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x1
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_02218dcc
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02218dd4
.L_02218dcc:
    mov r6, #0x0
    b .L_02218e0c
.L_02218dd4:
    ldrsh r0, [r4, #0xda]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    movhi r6, #0x0
    bhi .L_02218e0c
    ldr r0, [r4, #0x238]
    ldrsh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x11
    mov r6, r0, lsl #0xc
.L_02218e0c:
    ldr r2, .L_0221914c
    ldr r0, [r4, #0x260]
    mov r7, #0x0
    umull r3, r1, r0, r2
    mla r1, r0, r7, r1
    mov r0, r0, asr #0x1f
    mla r1, r0, r2, r1
    adds r3, r3, #0x800
    adc r0, r1, #0x0
    mov r1, r3, lsr #0xc
    ldr r3, [r4, #0x25c]
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r4, #0x25c]
    ldr r0, [r4, #0x264]
    ldr r5, [r4, #0x260]
    umull r3, r1, r0, r2
    mla r1, r0, r7, r1
    mov r0, r0, asr #0x1f
    mla r1, r0, r2, r1
    adds r3, r3, #0x800
    adc r0, r1, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r1, r5, r1
    sub r3, r2, #0x1000
    rsb r5, r2, #0xc00
    umull r0, r8, r1, r3
    sub r2, r7, #0x1
    str r1, [r4, #0x260]
    adds r0, r0, #0x800
    mla r8, r1, r2, r8
    mov lr, r1, asr #0x1f
    mla r8, lr, r3, r8
    ldr ip, [r4, #0x25c]
    adc r1, r8, #0x0
    umull lr, r7, ip, r5
    mov r0, r0, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    mla r7, ip, r2, r7
    mov r3, ip, asr #0x1f
    mla r7, r3, r5, r7
    adds r3, lr, #0x800
    adc r2, r7, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r1, [r4, #0x268]
    add r0, r0, r3
    bl func_020adc90
    str r0, [r4, #0x264]
    ldr r1, [r4, #0x25c]
    mov r0, #0xc
    mla r6, r1, r0, r6
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02218fd8
    ldr r0, [r4, #0x208]
    cmp r0, #0x0
    ble .L_02218fd8
    ldr r0, [r4, #0x3c]
    ldr r1, [r4, #0x40]
    bl func_0204cfa4
    add r1, r4, #0x200
    sub r6, r6, r0, lsl #0x1
    ldrh r0, [r1, #0x6e]
    mov r1, #0xc
    bl func_020befec
    cmp r1, #0x0
    bne .L_02218fd8
    add r0, sp, #0x38
    add r1, r4, #0x18
    bl func_02005030
    bl genrand_int32
    mov r1, #0x28000
    mov r5, r0
    bl func_020bf1f8
    ldr r2, [sp, #0x3c]
    ldr r0, [sp, #0x40]
    sub r2, r2, #0x14000
    add r1, r2, r1
    str r1, [sp, #0x3c]
    ldr r1, .L_02219150
    sub r2, r0, #0x14000
    and r1, r1, r5, lsr #0x8
    add r1, r2, r1
    str r1, [sp, #0x40]
    ldr r1, .L_02219120
    ldr r3, .L_02219124
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218fd0
    ldr r3, .L_02219128
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x28
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x38
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02218fd0:
    add r0, sp, #0x38
    bl func_02005058
.L_02218fd8:
    cmp r6, #0x0
    movlt r6, #0x0
    blt .L_02219004
    ldr r0, [r4, #0x238]
    ldrsh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x11
    mov r0, r0, lsl #0xc
    add r0, r0, #0x8000
    cmp r6, r0
    movgt r6, r0
.L_02219004:
    ldr r2, [r4, #0x23c]
    rsb r1, r6, r6, lsl #0x3
    mov r0, #0x5d
    mla r0, r2, r0, r1
    mov r1, #0x64
    bl func_020adae4
    str r0, [r4, #0x23c]
    ldrsh r5, [r4, #0xda]
    cmp r5, #0x1
    cmpne r5, #0x3
    bne .L_02219060
    ldr r0, [r4, #0x23c]
    sub r0, r0, r6
    bl func_020be334
    cmp r0, #0x2000
    bge .L_02219060
    cmp r5, #0x1
    moveq r0, #0x2
    movne r0, #0x0
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x42]
.L_02219060:
    add r0, r4, #0x60
    add r1, r4, #0x244
    bl func_ov088_022179f4
    ldrsh r2, [r4, #0x62]
    ldr r1, [r4, #0x23c]
    add r0, r4, #0x200
    sub r1, r2, r1, asr #0xc
    strh r1, [r4, #0x62]
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022190e8
    ldr r0, .L_0221910c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0xe
    beq .L_022190e8
    ldr r0, .L_02219108
    add r1, r4, #0x18
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    bl func_020050a4
    ldr r0, .L_02219108
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea4]
    ldr r0, [r1, #0x14]
    orr r0, r0, #0x2
    str r0, [r1, #0x14]
.L_022190e8:
    mov r0, r4
    bl func_0203292c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_02219100:
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02219108: .word data_021052fc
.L_0221910c: .word gSceneManager
.L_02219110: .word 0x1089
.L_02219114: .word 0xfffff99a
.L_02219118: .word 0xfd87
.L_0221911c: .word 0x1ffff
.L_02219120: .word data_ov088_0221ba04
.L_02219124: .word gHeapContext
.L_02219128: .word 0x221d
.L_0221912c: .word 0x155
.L_02219130: .word 0x19a
.L_02219134: .word 0xf85
.L_02219138: .word 0xfd83
.L_0221913c: .word data_020c9670
.L_02219140: .word gSoundContext
.L_02219144: .word 0x1fb
.L_02219148: .word 0xfd85
.L_0221914c: .word 0xccd
.L_02219150: .word 0x7fff
.size func_ov088_02218328, . - func_ov088_02218328
