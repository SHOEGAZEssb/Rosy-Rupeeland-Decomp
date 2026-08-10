    .text
/* Exact fallback; see overlay040_scene_main_update.c for portable C. */
    .extern Heap_Alloc
    .extern Sound_Play
    .extern TouchPanelManager_GetPoint
    .extern data_020c9670
    .extern data_ov040_02203a18
    .extern data_ov040_02203e3c
    .extern data_ov040_022042f0
    .extern data_ov040_02207d24
    .extern func_02005030
    .extern func_02005058
    .extern func_020050a4
    .extern func_02025300
    .extern func_0202562c
    .extern func_02025644
    .extern func_0202564c
    .extern func_02025a3c
    .extern func_02059278
    .extern func_020592d8
    .extern func_020593ac
    .extern func_0205940c
    .extern func_020594a4
    .extern func_020594ec
    .extern func_0205958c
    .extern func_020595b0
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern func_0209b5e8
    .extern func_020a63d0
    .extern func_020a6548
    .extern func_020a68fc
    .extern func_020a6990
    .extern func_020adc40
    .extern func_020be328
    .extern func_020befec
    .extern func_ov040_021fd724
    .extern func_ov040_021ff3f4
    .extern func_ov040_021ff8b0
    .extern func_ov040_021ff900
    .extern func_ov040_02200128
    .extern func_ov040_02200bf4
    .extern func_ov040_02200eb8
    .extern func_ov040_02201060
    .extern func_ov040_02201288
    .extern func_ov040_02202244
    .extern func_ov040_022022dc
    .extern func_ov040_02202f1c
    .extern func_ov040_02203150
    .extern func_ov040_02203678
    .extern gHeapContext
    .extern gSoundContext
    .extern gTouchPanelManager
    .extern genrand_int32
    .global func_ov040_021fe1b0
func_ov040_021fe1b0: ; 0x021fe1b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x50
    mov r10, r0
    mov r1, #0x0
    add r0, sp, #0x44
    str r1, [r10, #0xb24]
    bl func_ov040_021fd724
    ldr r0, .L_021ff124
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x4]
    cmp r0, #0x2
    bne .L_021fe21c
    add r0, sp, #0x8
    bl TouchPanelManager_GetPoint
    add r1, sp, #0x8
    add r0, sp, #0x44
    cmp r1, r0
    ldrne r1, [sp, #0xc]
    ldrne r0, [sp, #0x10]
    strne r1, [sp, #0x48]
    strne r0, [sp, #0x4c]
    ldr r0, [r10, #0xb20]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r10, #0xb20]
    streq r0, [r10, #0xb24]
    b .L_021fe224
.L_021fe21c:
    mov r0, #0x0
    str r0, [r10, #0xb20]
.L_021fe224:
    ldr r1, [r10, #0x844]
    ldr r0, [r10, #0x848]
    mov r5, #0x0
    mul r2, r1, r0
    mov r0, r2, asr #0xb
    ldr r1, [r10, #0x840]
    add r0, r2, r0, lsr #0x14
    add r1, r1, r0, asr #0xc
    ldr r0, .L_021ff128
    str r1, [r10, #0x840]
    cmp r1, r0
    ldrgt r1, [r10, #0x840]
    mov r6, r5
    subgt r0, r1, r0
    strgt r0, [r10, #0x840]
    movgt r5, #0x1
    ldr r1, [r10, #0x854]
    ldr r0, .L_021ff12c
    ldr r7, .L_021ff130
    cmp r5, #0x0
    ldr r0, [r0, r1, lsl #0x2]
    beq .L_021fe2c4
    ldr r1, [r10, #0x850]
    add r1, r1, #0x1
    str r1, [r10, #0x850]
    add r1, r1, #0x3
    ldr r3, [r0, r1, lsl #0x2]
    cmp r3, #0x0
    bge .L_021fe2c4
    mov r2, #0x0
    sub r1, r2, #0x1
    str r2, [r10, #0x854]
    cmp r3, r1
    ldreq r0, .L_021ff134
    str r2, [r10, #0x850]
    ldr r1, [r0, #0x0]
    mov r6, #0x1
    str r1, [r10, #0x84c]
    ldr r1, [r0, #0x4]
    str r1, [r10, #0x844]
.L_021fe2c4:
    ldr r1, [r10, #0x850]
    add r1, r1, #0x2
    ldr r1, [r0, r1, lsl #0x2]
    str r1, [r10, #0x858]
    ldr r1, [r10, #0x850]
    add r1, r1, #0x3
    ldr r0, [r0, r1, lsl #0x2]
    str r0, [r10, #0x85c]
    ldr r0, [r10, #0x84c]
    cmp r0, #0x1
    bne .L_021fe310
    ldr r1, [r10, #0x840]
    ldr r0, .L_021ff138
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    bl func_020be328
    mov r8, r0
    b .L_021fe384
.L_021fe310:
    cmp r0, #0x2
    bne .L_021fe364
    ldr r0, [r10, #0x840]
    mvn r1, #0x0
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r2, r0, #0x1
    ldr r0, .L_021ff138
    mov r2, r2, lsl #0x1
    ldrsh r4, [r0, r2]
    mov r0, r1, lsl #0xb
    umull r3, r2, r4, r0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r8, r1, #0x800
    b .L_021fe384
.L_021fe364:
    cmp r0, #0x0
    ldreq r1, [r10, #0x840]
    moveq r0, r1, asr #0x2
    addeq r0, r1, r0, lsr #0x1d
    moveq r8, r0, asr #0x3
    beq .L_021fe384
    cmp r0, #0x3
    moveq r8, #0x0
.L_021fe384:
    mov r9, #0x0
    add r4, r10, #0x84
    mov r11, #0x13
    b .L_021fe3cc
.L_021fe394:
    ldr r0, [r10, #0x48]
    add r1, r4, r9, lsl #0x4
    ldr r0, [r0, #0x10]
    mov r3, r8
    str r1, [sp, #0x0]
    ldr r2, [r10, #0x858]
    mov r1, #0x13
    mla r1, r2, r1, r9
    ldr ip, [r10, #0x85c]
    add r1, r7, r1, lsl #0x4
    mla r2, ip, r11, r9
    add r2, r7, r2, lsl #0x4
    bl func_0209b5e8
    add r9, r9, #0x1
.L_021fe3cc:
    cmp r9, #0x13
    blt .L_021fe394
    mov r0, r10
    bl func_ov040_02200128
    ldr r0, [r10, #0xba4]
    cmp r0, #0x0
    ble .L_021fe4f0
    sub r0, r0, #0x1
    str r0, [r10, #0xba4]
    cmp r0, #0x0
    ldrle r1, [r10, #0xba0]
    ldrleh r0, [r1, #0x42]
    orrle r0, r0, #0x4
    strleh r0, [r1, #0x42]
    ble .L_021fe4f0
    ldr r0, [r10, #0xba0]
    mov r2, #0x0
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_021fe428
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_021fe428:
    ldr r1, [r10, #0xba0]
    add r2, r10, #0x660
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r10, #0xba0]
    ldr r1, [r10, #0xba8]
    add r0, r0, #0x2c
    add r1, r2, r1, lsl #0x4
    bl func_020050a4
    ldr r0, [r10, #0xb24]
    cmp r0, #0x0
    beq .L_021fe4f0
    ldr r0, [r10, #0xba0]
    ldr r3, [sp, #0x48]
    ldr r2, [r0, #0x30]
    ldr r1, [sp, #0x4c]
    ldr r0, [r0, #0x34]
    rsb r4, r2, r3, lsl #0xc
    rsb r1, r0, r1, lsl #0xc
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r1, r3
    bl func_020adc40
    cmp r0, #0x1e000
    bge .L_021fe4f0
    ldr r3, [r10, #0xba0]
    mov r1, #0x0
    ldrh r2, [r3, #0x42]
    mov r0, r10
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    str r1, [r10, #0xba4]
    ldr r1, [r10, #0xbd4]
    add r1, r1, #0x9
    bl func_ov040_02202244
    mov r1, #0x2
    str r1, [r10, #0xb88]
    mov r0, #0x0
    str r0, [r10, #0xb8c]
    str r1, [r10, #0xb7c]
    str r0, [r10, #0xb80]
.L_021fe4f0:
    add r0, r10, #0x3d8
    add r0, r0, #0x800
    bl func_ov040_02203150
    ldr r0, [r10, #0xb7c]
    cmp r0, #0x0
    blt .L_021fe530
    cmp r0, #0x4
    bgt .L_021fe530
    ldr r0, [r10, #0xb88]
    cmp r0, #0x0
    bne .L_021fe530
    ldr r1, [r10, #0xb44]
    add r0, r10, #0x3d8
    add r0, r0, #0x800
    add r1, r1, #0x2c
    bl func_ov040_02203678
.L_021fe530:
    ldr r0, [r10, #0xb3c]
    cmp r0, #0x0
    bne .L_021fe5b0
    ldr r0, [r10, #0xb40]
    cmp r0, #0x0
    bne .L_021fe578
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_020594a4
    cmp r0, #0x0
    bne .L_021fe578
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
.L_021fe578:
    ldr r0, [r10, #0xb40]
    add r0, r0, #0x1
    str r0, [r10, #0xb40]
    cmp r0, #0x3c
    ble .L_021ff3e0
    mov r0, #0x0
    str r0, [r10, #0xb40]
    ldr r1, [r10, #0xb3c]
    mov r0, r10
    add r2, r1, #0x1
    mov r1, #0x17
    str r2, [r10, #0xb3c]
    bl func_ov040_02202244
    b .L_021ff3e0
.L_021fe5b0:
    cmp r0, #0x1
    bne .L_021fe63c
    ldr r0, [r10, #0xb40]
    add r0, r0, #0x1
    str r0, [r10, #0xb40]
    cmp r0, #0x80
    ble .L_021fe5ec
    ldr r1, [r10, #0xb3c]
    mov r0, r10
    add r1, r1, #0x1
    str r1, [r10, #0xb3c]
    mov r2, #0x0
    mov r1, #0x16
    str r2, [r10, #0xb40]
    bl func_ov040_02202244
.L_021fe5ec:
    ldr r0, [r10, #0xb40]
    cmp r0, #0xa
    ble .L_021ff3e0
    cmp r0, #0x6e
    bge .L_021ff3e0
    mov r1, #0x14
    bl func_020befec
    cmp r1, #0x5
    bne .L_021ff3e0
    ldr r0, .L_021ff13c
    ldr r1, [r10, #0xb40]
    ldr r0, [r0, #0x0]
    mov r4, #0x0
    str r4, [sp, #0x0]
    add r3, r1, #0xa
    mov r1, #0x12c
    mov r2, #0xc
    str r4, [sp, #0x4]
    bl func_020593ac
    b .L_021ff3e0
.L_021fe63c:
    cmp r0, #0x2
    bne .L_021fe6e4
    ldr r0, [r10, #0x48]
    ldr r1, .L_021ff140
    add r0, r0, #0x64
    mov r2, #0x6
    bl func_020a6990
    cmp r0, #0x0
    beq .L_021ff3e0
    mov r0, #0x4
    str r0, [r10, #0xb3c]
    mov r0, #0x0
    str r0, [r10, #0xb40]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x34]
    bl func_020a6548
    ldr r0, [r10, #0x48]
    mov r1, #0x58
    ldr r0, [r0, #0x5c]
    mov r2, #0x0
    ldr r0, [r0, #0x34]
    bl func_020a68fc
    mov r0, r10
    mov r1, #0x18
    bl func_ov040_02202244
    ldr r0, .L_021ff13c
    mov r1, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, .L_021ff13c
    mov r1, #0x3c
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_020595b0
    ldr r0, .L_021ff13c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    b .L_021ff3e0
.L_021fe6e4:
    cmp r0, #0x4
    bne .L_021fe7a4
    cmp r6, #0x0
    beq .L_021fe72c
    bl genrand_int32
    and r4, r0, #0x3
    cmp r4, #0x1
    movgt r4, #0x1
    mov r0, r10
    add r1, r4, #0x18
    bl func_ov040_02202244
    cmp r4, #0x0
    bne .L_021fe72c
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x17
    bl Sound_Play
.L_021fe72c:
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4a4]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_021ff3e0
    ldr r0, [r10, #0xb3c]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r10, #0xb3c]
    ldr r0, .L_021ff13c
    str r2, [r10, #0xb40]
    ldr r0, [r0, #0x0]
    mov r1, #0x78
    bl func_020595b0
    ldr r0, [r10, #0x48]
    mvn r1, #0x0
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x34]
    bl func_020a63d0
    ldr r0, .L_021ff13c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3a
    bl Sound_Play
    b .L_021ff3e0
.L_021fe7a4:
    cmp r0, #0x5
    bne .L_021fe928
    ldr r0, [r10, #0xb40]
    cmp r0, #0x28
    bge .L_021fe7f0
    add r0, r0, #0x1
    str r0, [r10, #0xb40]
    cmp r0, #0x28
    bne .L_021ff3e0
    mov r2, #0x3
    b .L_021fe7e4
.L_021fe7d0:
    add r0, r10, r2, lsl #0x2
    ldr r1, [r0, #0xbc4]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
.L_021fe7e4:
    subs r2, r2, #0x1
    bpl .L_021fe7d0
    b .L_021ff3e0
.L_021fe7f0:
    bne .L_021fe894
    ldr r0, [r10, #0xbd0]
    mov r2, #0x0
    add r1, r0, #0x1
    mov r0, r1, asr #0x2
    add r3, r0, #0x1
    cmp r3, #0x3
    str r1, [r10, #0xbd0]
    movge r3, #0x3
    b .L_021fe848
.L_021fe818:
    add r0, r10, r3, lsl #0x2
    ldr r0, [r0, #0xbc4]
    ldr r0, [r0, #0x30]
    rsb r0, r0, #0x80000
    mov r4, r0, asr #0x2
    add r0, r10, r3, lsl #0x2
    ldr r1, [r0, #0xbc4]
    cmp r4, #0x0
    ldr r0, [r1, #0x30]
    movgt r4, r2
    add r0, r0, r4
    str r0, [r1, #0x30]
.L_021fe848:
    subs r3, r3, #0x1
    bpl .L_021fe818
    ldr r1, [r10, #0xbc4]
    ldr r0, [r10, #0xbcc]
    ldr r1, [r1, #0x30]
    ldr r0, [r0, #0x30]
    cmp r1, r0
    bne .L_021ff3e0
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x18
    bl Sound_Play
    mov r0, #0x0
    str r0, [r10, #0xbd0]
    ldr r0, [r10, #0xb40]
    add r0, r0, #0x1
    str r0, [r10, #0xb40]
    b .L_021ff3e0
.L_021fe894:
    cmp r0, #0x29
    bne .L_021ff3e0
    ldr r0, [r10, #0xbd0]
    mov r2, #0x0
    add r1, r0, #0x1
    mov r0, r1, asr #0x2
    add r3, r0, #0x1
    cmp r3, #0x3
    str r1, [r10, #0xbd0]
    movge r3, #0x3
    b .L_021fe8f0
.L_021fe8c0:
    add r0, r10, r3, lsl #0x2
    ldr r0, [r0, #0xbc4]
    ldr r0, [r0, #0x30]
    sub r0, r0, #0x81000
    mov r4, r0, asr #0x2
    add r0, r10, r3, lsl #0x2
    ldr r1, [r0, #0xbc4]
    cmp r4, #0x0
    ldr r0, [r1, #0x30]
    movgt r4, r2
    add r0, r0, r4
    str r0, [r1, #0x30]
.L_021fe8f0:
    subs r3, r3, #0x1
    bpl .L_021fe8c0
    ldr r1, [r10, #0xbcc]
    mov r0, #0x40000
    ldr r1, [r1, #0x30]
    rsb r0, r0, #0x0
    cmp r1, r0
    bge .L_021ff3e0
    mov r0, #0x0
    str r0, [r10, #0xb40]
    ldr r0, [r10, #0xb3c]
    add r0, r0, #0x1
    str r0, [r10, #0xb3c]
    b .L_021ff3e0
.L_021fe928:
    cmp r0, #0x6
    bne .L_021ff3e0
    ldr r0, [r10, #0xb30]
    cmp r0, #0x0
    beq .L_021fe944
    mov r0, r10
    bl func_ov040_02201060
.L_021fe944:
    ldr r0, [r10, #0xb7c]
    cmp r0, #0x0
    bge .L_021fe9c4
    ldr r0, [r10, #0xb94]
    add r0, r0, #0x1
    str r0, [r10, #0xb94]
    cmp r0, #0x1
    bne .L_021fe9ac
    mov r0, r10
    mov r1, #0xf
    bl func_ov040_02202244
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_Play
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    mov r0, #0x0
    str r0, [r10, #0xb08]
    str r0, [r10, #0x70]
    str r0, [r10, #0xaa4]
    str r0, [r10, #0x860]
.L_021fe9ac:
    ldr r0, [r10, #0xb94]
    cmp r0, #0x78
    ldreq r1, [r10, #0x48]
    moveq r0, #0x1
    streq r0, [r1, #0x3c]
    b .L_021ff3c8
.L_021fe9c4:
    ldr r0, [r10, #0xb88]
    cmp r0, #0x2
    bne .L_021fec8c
    ldr r0, [r10, #0xb8c]
    add r0, r0, #0x1
    str r0, [r10, #0xb8c]
    cmp r0, #0x1
    bne .L_021fea5c
    ldr r1, [r10, #0xb44]
    add r0, r10, #0x354
    add r0, r0, #0x800
    add r1, r1, #0x2c
    bl func_020050a4
    add r0, r10, #0x364
    add r0, r0, #0x800
    add r1, r10, #0x690
    bl func_020050a4
    ldr r0, [r10, #0xb44]
    bl func_0209a07c
    ldr r1, .L_021ff144
    ldr r2, [r10, #0x48]
    mov r0, #0x1
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r10, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r10, #0xb44]
    mov r1, #0x26
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0xb44]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_021fea5c:
    add r1, r10, #0x354
    add r2, r10, #0x364
    add r0, sp, #0x34
    add r1, r1, #0x800
    add r2, r2, #0x800
    bl func_ov040_021ff3f4
    ldr r0, [r10, #0xb8c]
    mov r1, #0x0
    rsb r0, r0, #0x1e
    mov r4, r0, lsl #0xc
    mov r0, #0x89
    umull r3, r2, r4, r0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    mla r2, r1, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r3, r3, lsr #0xc
    ldr r1, [sp, #0x38]
    orr r3, r3, r0, lsl #0x14
    smull r0, r5, r1, r3
    adds r6, r0, #0x800
    mov r0, r3, lsl #0x3
    mov r2, r0, asr #0x4
    mov r0, r3, asr #0x5
    add r0, r0, #0x80
    ldr r4, [sp, #0x3c]
    mov r1, r0, lsl #0x10
    smull r3, r0, r4, r3
    adc r4, r5, #0x0
    adds r3, r3, #0x800
    mov r5, r6, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    adc r0, r0, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    str r5, [sp, #0x38]
    str r3, [sp, #0x3c]
    ldr r4, [r10, #0xb68]
    ldr r0, .L_021ff138
    mov r2, r2, lsl #0x2
    ldrsh r2, [r0, r2]
    mov r0, #0x2a
    ldr r3, [r10, #0xb44]
    add r4, r4, r5
    str r4, [r3, #0x30]
    smulbb r2, r2, r0
    ldr r4, [r10, #0xb6c]
    ldr r3, [sp, #0x3c]
    ldr r0, [r10, #0xb44]
    add r3, r4, r3
    sub r2, r3, r2
    str r2, [r0, #0x34]
    ldr r2, [r10, #0xb44]
    mov r0, r1, asr #0x10
    strh r0, [r2, #0x3c]
    strh r0, [r2, #0x3e]
    ldr r0, [r10, #0xb8c]
    cmp r0, #0x1e
    bne .L_021fec80
    add r0, r10, #0x354
    add r0, r0, #0x800
    add r1, r10, #0x690
    bl func_020050a4
    ldr r0, [r10, #0xb44]
    add r1, r10, #0x354
    add r0, r0, #0x2c
    add r1, r1, #0x800
    bl func_020050a4
    ldr r1, [r10, #0xb44]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r3, [r10, #0xb44]
    add r1, r10, #0x354
    ldrh r2, [r3, #0x42]
    add r0, sp, #0x24
    add r1, r1, #0x800
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    bl func_02005030
    mov r0, #0x0
    ldr r1, [sp, #0x2c]
    str r0, [sp, #0x30]
    add r0, r1, #0x14000
    str r0, [sp, #0x2c]
    ldr r1, .L_021ff148
    ldr r3, .L_021ff14c
    mov r0, #0x38
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021febf4
    ldr r1, [r10, #0x48]
    mov r3, #0x0
    ldr r2, [r1, #0x0]
    add r1, sp, #0x24
    str r3, [sp, #0x0]
    mov r4, #0x1
    mov r3, #0x4b
    str r4, [sp, #0x4]
    bl func_02025300
.L_021febf4:
    ldr r2, [r10, #0x48]
    mov r1, #0x130
    str r0, [r2, #0x60]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x60]
    bl func_02025644
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x60]
    bl func_0202562c
    ldr r1, .L_021ff150
    ldr r0, [r10, #0x48]
    sub r2, r1, #0x8
    ldr r0, [r0, #0x60]
    add r3, r1, #0x1
    bl func_0202564c
    mov r0, #0x3
    str r0, [r10, #0xb88]
    mov r0, #0x0
    str r0, [r10, #0xb8c]
    str r0, [r10, #0xb38]
    mov r0, r10
    mov r1, #0xb9
    bl func_ov040_021ff8b0
    ldr r0, .L_021ff13c
    mov r1, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    mov r3, #0x28
    bl func_020592d8
    ldr r0, .L_021ff13c
    mov r1, #0xa
    ldr r0, [r0, #0x0]
    bl func_020594ec
    add r0, sp, #0x24
    bl func_02005058
.L_021fec80:
    add r0, sp, #0x34
    bl func_02005058
    b .L_021ff3c8
.L_021fec8c:
    cmp r0, #0x3
    bne .L_021fefd0
    ldr r0, [r10, #0xb8c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_021fecd4
    mov r0, #0x0
    strb r0, [r10, #0x645]
    strb r0, [r10, #0x658]
    strb r0, [r10, #0x65d]
    strb r0, [r10, #0x65c]
    strb r0, [r10, #0x65b]
    strb r0, [r10, #0x65e]
    ldr r1, [r10, #0xbd4]
    mov r0, r10
    add r1, r1, #0x9
    bl func_ov040_02202244
.L_021fecd4:
    ldr r0, [r10, #0xb8c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    adds r0, r1, r0, ror #0x1e
    ldreq r0, [r10, #0xb2c]
    subeq r0, r0, #0x1
    streq r0, [r10, #0xb2c]
    ldr r0, [r10, #0xb24]
    cmp r0, #0x0
    beq .L_021fedd0
    add r1, r10, #0x354
    add r0, sp, #0x14
    add r1, r1, #0x800
    bl func_02005030
    ldr r0, [sp, #0x1c]
    ldr r3, [sp, #0x48]
    add r1, r0, #0xa000
    ldr r2, [sp, #0x18]
    ldr r0, [sp, #0x4c]
    rsb r5, r2, r3, lsl #0xc
    rsb r2, r1, r0, lsl #0xc
    smull r0, r3, r2, r2
    adds r4, r0, #0x800
    smull r2, r0, r5, r5
    adc r3, r3, #0x0
    adds r2, r2, #0x800
    mov r4, r4, lsr #0xc
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    orr r2, r2, r0, lsl #0x14
    add r0, r2, r4
    str r1, [sp, #0x1c]
    bl func_020adc40
    cmp r0, #0x1e000
    bge .L_021fedc8
    ldr r2, [r10, #0xb58]
    ldr r1, [r10, #0xb5c]
    add r0, r10, #0x3d8
    add r0, r0, #0x800
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x4
    bl func_ov040_02202f1c
    ldr r0, [r10, #0xb38]
    mov r1, #0x14
    add r0, r0, #0x1
    str r0, [r10, #0xb38]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x60]
    bl func_02025a3c
    ldr r2, [r10, #0xb38]
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    cmp r0, #0x1
    bne .L_021fedc8
    cmp r2, #0x9
    ldrlt r0, [r10, #0xb2c]
    sublt r0, r0, #0x1
    strlt r0, [r10, #0xb2c]
.L_021fedc8:
    add r0, sp, #0x14
    bl func_02005058
.L_021fedd0:
    ldr r0, [r10, #0xb8c]
    add r0, r0, #0x1
    str r0, [r10, #0xb8c]
    cmp r0, #0x4b
    ble .L_021ff3c8
    mov r2, #0x1
    strb r2, [r10, #0x645]
    strb r2, [r10, #0x658]
    strb r2, [r10, #0x65d]
    strb r2, [r10, #0x65c]
    strb r2, [r10, #0x65b]
    mov r0, r10
    mov r1, #0x10
    strb r2, [r10, #0x65e]
    bl func_ov040_02202244
    mov r0, #0x0
    str r0, [r10, #0xae4]
    str r0, [r10, #0xb88]
    ldr r0, [r10, #0xb2c]
    cmp r0, #0x0
    bgt .L_021feea4
    mov r0, #0x1
    str r0, [r10, #0xb30]
    ldr r0, [r10, #0xbd4]
    cmp r0, #0x0
    mov r0, r10
    bne .L_021fee48
    mov r1, #0x12
    bl func_ov040_02202244
    b .L_021fee50
.L_021fee48:
    mov r1, #0x13
    bl func_ov040_02202244
.L_021fee50:
    mov r1, #0x1b
    mov r0, r10
    str r1, [r10, #0xbc0]
    mov r2, #0x1000
    mov r1, #0x7d0
    str r2, [r10, #0x848]
    bl func_ov040_021ff8b0
    ldr r0, .L_021ff13c
    mov r1, #0xa
    ldr r0, [r0, #0x0]
    bl func_0205958c
    ldr r0, .L_021ff13c
    mov r1, #0x8
    ldr r0, [r0, #0x0]
    bl func_020594ec
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    b .L_021fef30
.L_021feea4:
    mov r0, #0x3c
    str r0, [r10, #0xbc0]
    mov r1, #0x9
    str r1, [r10, #0xbb0]
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
    ldr r0, .L_021ff13c
    mov r1, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    mov r3, #0x3c
    bl func_020592d8
    ldr r0, [r10, #0xb2c]
    mov r1, #0x0
    cmp r0, #0x25
    movlt r1, #0x2
    blt .L_021feefc
    cmp r0, #0x4b
    movlt r1, #0x1
.L_021feefc:
    ldr r0, [r10, #0xb34]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r10, #0xbb8]
    strne r1, [r10, #0xb34]
    ldr r1, [r10, #0xb2c]
    ldr r0, .L_021ff154
    rsb r1, r1, #0x70
    mul r0, r1, r0
    mov r1, #0x70
    bl func_020befec
    add r0, r0, #0x1000
    str r0, [r10, #0x848]
.L_021fef30:
    mov r0, #0x0
    str r0, [r10, #0xb8c]
    str r0, [r10, #0xb88]
    ldr r3, [r10, #0xb44]
    add r0, r10, #0x354
    ldrh r2, [r3, #0x42]
    add r1, r0, #0x800
    bic r0, r2, #0x4
    strh r0, [r3, #0x42]
    ldr r0, [r10, #0xb44]
    add r0, r0, #0x2c
    bl func_020050a4
    ldr r0, [r10, #0xb44]
    bl func_0209a07c
    ldr r1, .L_021ff144
    ldr r2, [r10, #0x48]
    mov r0, #0x1
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r10, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r10, #0xb44]
    mov r1, #0x26
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0xb44]
    mov r1, #0x0
    ldr r4, [r0, #0xc]
    mov r2, #0x3
    ldrh r3, [r4, #0x24]
    sub r0, r1, #0xe
    orr r3, r3, #0x2
    strh r3, [r4, #0x24]
    str r2, [r10, #0xb7c]
    str r1, [r10, #0xb80]
    str r0, [r10, #0xb78]
    b .L_021ff3c8
.L_021fefd0:
    ldr r0, [r10, #0xb30]
    cmp r0, #0x0
    bne .L_021ff3c8
    mov r0, r10
    bl func_ov040_022022dc
    ldr r1, [r10, #0xae4]
    cmp r1, #0x0
    ble .L_021ff338
    ldr r0, [r10, #0x848]
    mov r7, r1, asr #0xc
    add r1, r1, r0
    str r1, [r10, #0xae4]
    ldr r0, [r10, #0xbb0]
    mov r8, r1, asr #0xc
    cmp r0, #0x5
    bne .L_021ff09c
    ldr r0, [r10, #0x860]
    cmp r0, #0x28
    addlt r0, r0, #0x1
    strlt r0, [r10, #0x860]
    cmp r7, #0x12
    bge .L_021ff040
    cmp r8, #0x12
    blt .L_021ff040
    mov r0, r10
    mov r1, #0xe
    bl func_ov040_02202244
    b .L_021ff3c8
.L_021ff040:
    cmp r7, #0x2d
    bge .L_021ff07c
    cmp r8, #0x2d
    blt .L_021ff07c
    mov r0, r10
    mov r1, #0x5
    bl func_ov040_02202244
    mov r1, #0x1
    ldr r0, .L_021ff13c
    str r1, [r10, #0xad4]
    ldr r0, [r0, #0x0]
    mov r1, #0x12c
    mov r2, #0xb
    bl Sound_Play
    b .L_021ff3c8
.L_021ff07c:
    cmp r8, #0x41
    blt .L_021ff3c8
    mov r1, #0x0
    str r1, [r10, #0x860]
    mov r0, r10
    str r1, [r10, #0xae4]
    bl func_ov040_02202244
    b .L_021ff3c8
.L_021ff09c:
    cmp r7, #0x2
    bge .L_021ff108
    cmp r8, #0x2
    blt .L_021ff108
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x14
    bl Sound_Play
    add r0, r10, #0xc4
    mov r9, #0x1e
    add r5, r0, #0x800
    add r4, r10, #0x660
    mov r11, #0x7
    mov r6, #0xa
    b .L_021ff0f8
.L_021ff0dc:
    ldr r0, [r10, #0xbd4]
    cmp r0, #0x0
    moveq r1, r6
    movne r1, r11
    add r0, r5, r9, lsl #0x4
    add r1, r4, r1, lsl #0x4
    bl func_020050a4
.L_021ff0f8:
    subs r9, r9, #0x1
    bpl .L_021ff0dc
    mov r0, #0x1
    str r0, [r10, #0xaa4]
.L_021ff108:
    ldr r0, [r10, #0xaa4]
    cmp r0, #0x0
    ble .L_021ff1a4
    add r0, r10, #0xc4
    mov r5, #0x1e
    add r4, r0, #0x800
    b .L_021ff168
.L_021ff124: .word gTouchPanelManager
.L_021ff128: .word 0x7fff
.L_021ff12c: .word data_ov040_02203e3c
.L_021ff130: .word data_ov040_022042f0
.L_021ff134: .word data_ov040_02203a18
.L_021ff138: .word data_020c9670
.L_021ff13c: .word gSoundContext
.L_021ff140: .word 0x9616
.L_021ff144: .word 0x100f
.L_021ff148: .word data_ov040_02207d24
.L_021ff14c: .word gHeapContext
.L_021ff150: .word 0x1009
.L_021ff154: .word 0xb33
.L_021ff158:
    sub r1, r5, #0x1
    add r0, r4, r5, lsl #0x4
    add r1, r4, r1, lsl #0x4
    bl func_020050a4
.L_021ff168:
    sub r5, r5, #0x1
    cmp r5, #0x1
    bge .L_021ff158
    ldr r0, [r10, #0xbd4]
    add r1, r10, #0x660
    cmp r0, #0x0
    moveq r2, #0xa
    movne r2, #0x7
    add r0, r10, #0xc4
    add r0, r0, #0x800
    add r1, r1, r2, lsl #0x4
    bl func_020050a4
    ldr r0, [r10, #0xaa4]
    add r0, r0, #0x1
    str r0, [r10, #0xaa4]
.L_021ff1a4:
    cmp r7, #0x64
    bge .L_021ff21c
    cmp r8, #0x64
    blt .L_021ff21c
    ldr r1, [r10, #0xbd4]
    mov r0, r10
    add r1, r1, #0x7
    bl func_ov040_02202244
    ldr r1, [r10, #0x48]
    mov r0, #0xf
    str r0, [r1, #0x34]
    mov r0, #0x3
    str r0, [r1, #0x38]
    mov r0, #0x1a
    str r0, [r10, #0xb08]
    ldr r0, [r10, #0xbd4]
    mov r1, #0x0
    str r0, [r10, #0xb0c]
    ldr r0, .L_021ff13c
    str r1, [r10, #0xaa4]
    ldr r0, [r0, #0x0]
    mov r1, #0x12c
    mov r2, #0x14
    bl func_0205940c
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl Sound_Play
    b .L_021ff3c8
.L_021ff21c:
    cmp r7, #0x6a
    bge .L_021ff2b8
    cmp r8, #0x6a
    blt .L_021ff2b8
    ldr r1, [r10, #0xbd4]
    mov r0, r10
    add r1, r1, #0x8
    bl func_ov040_02202244
    ldr r5, .L_021ff3f0
    mov r7, #0x4
    mov r3, #0xbe000
    sub r6, r5, #0x114000
    mov r0, #0x6
    b .L_021ff284
.L_021ff254:
    ldr r1, [r10, #0xbd4]
    add r4, r10, r7, lsl #0x2
    cmp r1, #0x0
    mul r1, r7, r0
    moveq r8, r6
    ldr r2, [r4, #0xae8]
    movne r8, r5
    str r8, [r2, #0x30]
    ldr r2, [r4, #0xae8]
    rsb r1, r1, #0x13
    str r3, [r2, #0x34]
    str r1, [r4, #0xaf8]
.L_021ff284:
    subs r7, r7, #0x1
    bpl .L_021ff254
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    bl Sound_Play
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    bl Sound_Play
    b .L_021ff3c8
.L_021ff2b8:
    ldr r0, [r10, #0xb88]
    mov r1, #0x94
    cmp r0, #0x1
    addeq r1, r1, #0x28
    cmp r8, #0x6a
    blt .L_021ff300
    sub r0, r8, #0x6a
    rsb r2, r0, #0x1e
    cmp r2, #0x0
    ble .L_021ff300
    ldr r0, [r10, #0xbd4]
    cmp r0, #0x0
    mvneq r3, #0xf9
    ldr r0, [r10, #0x78]
    movne r3, #0xfa
    mla r0, r2, r3, r0
    str r0, [r10, #0x78]
    str r0, [r10, #0xadc]
.L_021ff300:
    cmp r8, r1
    blt .L_021ff3c8
    mov r1, #0x0
    str r1, [r10, #0xae4]
    mov r0, r10
    str r1, [r10, #0xb88]
    bl func_ov040_02202244
    mov r0, #0x0
    str r0, [r10, #0xba4]
    ldr r1, [r10, #0xba0]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_021ff3c8
.L_021ff338:
    ldr r1, [r10, #0x78]
    ldr r0, [r10, #0xadc]
    cmp r1, r0
    beq .L_021ff3c8
    ldrgt r0, [r10, #0xae0]
    rsbgt r4, r0, #0x0
    ldrle r4, [r10, #0xae0]
    ldr r0, [r10, #0x78]
    cmp r5, #0x0
    add r0, r0, r4
    str r0, [r10, #0x78]
    beq .L_021ff38c
    ldr r0, [r10, #0x850]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021ff38c
    ldr r0, .L_021ff13c
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
.L_021ff38c:
    ldr r1, [r10, #0x78]
    ldr r0, [r10, #0xadc]
    cmp r1, r0
    ldr r0, [r10, #0xae0]
    rsbgt r0, r0, #0x0
    cmp r0, r4
    beq .L_021ff3bc
    ldr r2, [r10, #0xadc]
    mov r0, r10
    mov r1, #0x0
    str r2, [r10, #0x78]
    bl func_ov040_02202244
.L_021ff3bc:
    ldr r0, [r10, #0xbbc]
    add r0, r0, #0x1
    str r0, [r10, #0xbbc]
.L_021ff3c8:
    mov r0, r10
    bl func_ov040_021ff900
    mov r0, r10
    bl func_ov040_02200bf4
    mov r0, r10
    bl func_ov040_02200eb8
.L_021ff3e0:
    mov r0, r10
    bl func_ov040_02201288
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ff3f0: .word 0x10a000
    .size func_ov040_021fe1b0, . - func_ov040_021fe1b0
