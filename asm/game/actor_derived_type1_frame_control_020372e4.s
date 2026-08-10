; Matching retail form; see src/game/actor_derived_type1_frame_control.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Sound_Play
.extern data_020df254
.extern data_020df258
.extern data_020df4a4
.extern data_021052fc
.extern data_0210568c
.extern func_0200500c
.extern func_02005058
.extern func_02008378
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_0201ded4
.extern func_0201e0ec
.extern func_0201f864
.extern func_02022cb0
.extern Actor_TryInitializeHeightBandFromPoint
.extern Actor_IsAtCachedTerrainHeight
.extern ActorDerivedType1_StartRecord
.extern ActorDerivedType1_TeardownActiveRecord
.extern Type1Actor_TryEnterFailureState
.extern Actor_UpdateGroundContactProbe
.extern func_02058d40
.extern func_02059278
.extern func_0205958c
.extern func_020a28e0
.extern func_020ada8c
.extern func_020adae4
.extern func_020be334
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSceneTouchInitialData
.extern gSoundContext
.extern gSystemState
.extern genrand_int32

    .global ActorDerivedType1_UpdateFrameControl
    .type ActorDerivedType1_UpdateFrameControl, @function
ActorDerivedType1_UpdateFrameControl: ; 0x020372e4
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x44
    mov r7, r0
    ldr r1, [r7, #0x230]
    tst r1, #0x4
    beq .L_02037a54
    ldrb r1, [r7, #0x26b]
    cmp r1, #0x0
    beq .L_02037330
    sub r1, r1, #0x1
    strb r1, [r7, #0x26b]
    tst r1, #0xff
    ldrne r0, [r7, #0x54]
    movne r1, #0x300
    strneh r1, [r0, #0x36]
    bne .L_02037330
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_02037330:
    add r0, r7, #0x200
    ldrsh r2, [r0, #0x68]
    cmp r2, #0x0
    ble .L_02037354
    ldr r1, [r7, #0x230]
    tst r1, #0x40000
    subeq r1, r2, #0x1
    streqh r1, [r0, #0x68]
    b .L_02037a54
.L_02037354:
    ldrsh r1, [r0, #0x80]
    cmp r1, #0x0
    ble .L_0203738c
    sub r1, r1, #0x1
    strh r1, [r0, #0x80]
    ldrsh r0, [r0, #0x80]
    cmp r0, #0x0
    bne .L_02037a54
    ldr r0, [r7, #0x230]
    tst r0, #0x8000
    beq .L_02037a54
    mov r0, r7
    bl ActorDerivedType1_TeardownActiveRecord
    b .L_02037a54
.L_0203738c:
    ldrsh r0, [r0, #0x82]
    cmp r0, #0x0
    ble .L_020375dc
    ldr r0, [r7, #0x27c]
    ldrsh r1, [r0, #0xc]
    ldrb r4, [r0, #0x8]
    ldrsh r0, [r0, #0xe]
    cmp r1, #0x0
    movle r1, #0x1e
    cmp r0, #0x0
    ble .L_02037490
    ldrb r0, [r7, #0x2a1]
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_02037490
    sub r0, r4, #0x73
    cmp r0, #0x1
    bhi .L_02037490
    ldr r1, [r7, #0x27c]
    ldr r0, .L_02037a5c
    ldrsh r1, [r1, #0xe]
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    rsb r5, r1, #0x0
    mov r1, r5
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_02037a60
    ldr r3, .L_02037a64
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq .L_0203744c
    ldr r0, .L_02037a68
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov ip, #0x2000
    mov r1, r0
    mov r0, r6
    mov r2, r7
    mov r3, r5
    str ip, [sp, #0x0]
    sub r5, ip, #0x20c0
    str r5, [sp, #0x4]
    bl func_02022cb0
    mov r6, r0
.L_0203744c:
    ldr r0, .L_02037a68
    mov r1, r6
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, [r7, #0x27c]
    ldrh r2, [r0, #0x1a]
    cmp r2, #0x0
    beq .L_02037488
    ldr r0, .L_02037a6c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_02037488:
    mov r0, r7
    bl Type1Actor_TryEnterFailureState
.L_02037490:
    cmp r4, #0x73
    bne .L_020375ac
    ldrb r0, [r7, #0x2a1]
    mov r1, #0xa
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_020375ac
    bl genrand_int32
    bic r5, r0, #0x80000000
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0xc
    bl func_020ada8c
    mov r4, r0
    mov r0, r5
    mov r1, #0x6
    bl func_020ada8c
    mov r1, r4, lsl #0xc
    mov r0, r0, lsl #0xc
    add r3, r0, #0x1e000
    sub r1, r1, #0x6000
    add r0, sp, #0x18
    mov r2, #0x0
    bl func_0200500c
    add r0, sp, #0x34
    add r1, r7, #0x18
    add r2, sp, #0x18
    bl func_02008378
    add r0, sp, #0x18
    bl func_02005058
    ldr r1, .L_02037a60
    ldr r3, .L_02037a64
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02037568
    ldr r3, .L_02037a70
    mov r1, #0x10
    str r3, [sp, #0x0]
    add r2, r3, #0x75
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x11
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r7, #0x54]
    add r1, sp, #0x34
    ldr r2, [r2, #0x0]
    add r3, r3, #0x74
    bl func_0201f864
.L_02037568:
    ldr r0, .L_02037a68
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x1e
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x40]
    ldr r2, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r1, r1, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r2, r2, asr #0xc
    mov r1, #0x1
    bl func_020a28e0
    add r0, sp, #0x34
    bl func_02005058
.L_020375ac:
    ldrb r1, [r7, #0x2a1]
    add r0, r7, #0x200
    add r1, r1, #0x1
    strb r1, [r7, #0x2a1]
    ldrsh r1, [r0, #0x82]
    sub r1, r1, #0x1
    strh r1, [r0, #0x82]
    ldrsh r0, [r0, #0x82]
    cmp r0, #0x0
    bne .L_020375dc
    mov r0, r7
    bl ActorDerivedType1_TeardownActiveRecord
.L_020375dc:
    ldr r0, [r7, #0xd0]
    tst r0, #0x20
    beq .L_02037674
    ldr r0, .L_02037a74
    ldr r1, .L_02037a78
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02037674
    ldr r0, .L_02037a74
    ldr r1, .L_02037a78
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r7, #0x230]
    tst r0, #0x10
    bne .L_020376a8
    orr r0, r0, #0x10
    str r0, [r7, #0x230]
    add r0, r7, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x34]
    ldr r1, [r7, #0x10]
    ldr r0, .L_02037a6c
    orr r1, r1, #0x1f0000
    str r1, [r7, #0x10]
    ldr r0, [r0, #0x0]
    mov r1, #0x14
    bl func_02058d40
    ldr r0, .L_02037a6c
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    bl func_0205958c
    ldr r0, .L_02037a6c
    mov r1, #0x39
    ldr r0, [r0, #0x0]
    mov r2, #0x78
    bl func_02059278
    b .L_020376a8
.L_02037674:
    ldr r1, [r7, #0x230]
    mov r0, r7
    bic r1, r1, #0x10
    str r1, [r7, #0x230]
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_020376a8
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    ldreq r0, [r7, #0x10]
    biceq r0, r0, #0x1f0000
    streq r0, [r7, #0x10]
.L_020376a8:
    ldr r0, .L_02037a7c
    ldr r2, .L_02037a80
    ldrsh r1, [r0, #0x0]
    ldrh r4, [r2, #0x1a]
    cmp r1, #0x0
    blt .L_020376d4
    ldrh r0, [r2, #0x6]
    tst r0, #0x100
    beq .L_020376d4
    mov r0, r7
    bl ActorDerivedType1_StartRecord
.L_020376d4:
    ldrsh r0, [r7, #0xd6]
    cmp r0, #0xb
    bne .L_02037714
    ldr r1, [r7, #0x8c]
    mov r0, #0x62
    mul r0, r1, r0
    mov r1, #0x64
    bl func_020adae4
    str r0, [r7, #0x8c]
    ldr r1, [r7, #0x90]
    mov r0, #0x62
    mul r0, r1, r0
    mov r1, #0x64
    bl func_020adae4
    str r0, [r7, #0x90]
    b .L_020378f0
.L_02037714:
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x50]
    cmp r0, #0x0
    bne .L_020378f0
    mov r0, r7
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02037884
    tst r4, #0xf0
    beq .L_02037884
    tst r4, #0x20
    beq .L_02037760
    tst r4, #0x40
    movne r5, #0x3
    bne .L_02037790
    tst r4, #0x80
    movne r5, #0x1
    moveq r5, #0x2
    b .L_02037790
.L_02037760:
    tst r4, #0x10
    beq .L_02037784
    tst r4, #0x40
    movne r5, #0x5
    bne .L_02037790
    tst r4, #0x80
    movne r5, #0x7
    moveq r5, #0x6
    b .L_02037790
.L_02037784:
    tst r4, #0x40
    movne r5, #0x4
    moveq r5, #0x0
.L_02037790:
    ldr r0, [r7, #0x230]
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r7, #0x230]
    ldrsh r0, [r7, #0xd6]
    cmp r0, #0x9
    bne .L_020377fc
    mov r0, #0x0
    str r0, [r7, #0x40]
    str r0, [r7, #0x3c]
    ldr r0, .L_02037a84
    ldr r1, [r7, #0x8c]
    ldr r0, [r0, r5, lsl #0x3]
    add r1, r1, r1, lsl #0x3
    add r0, r1, r0
    mov r1, #0xa
    bl func_020adae4
    str r0, [r7, #0x8c]
    ldr r0, .L_02037a88
    ldr r1, [r7, #0x90]
    ldr r0, [r0, r5, lsl #0x3]
    add r1, r1, r1, lsl #0x3
    add r0, r1, r0
    mov r1, #0xa
    bl func_020adae4
    str r0, [r7, #0x90]
    b .L_020378f0
.L_020377fc:
    cmp r0, #0xa
    bne .L_02037854
    mov r0, #0x0
    str r0, [r7, #0x40]
    str r0, [r7, #0x3c]
    ldr r0, .L_02037a84
    ldr r1, [r7, #0x8c]
    ldr r0, [r0, r5, lsl #0x3]
    add r1, r1, r1, lsl #0x3
    add r0, r1, r0
    mov r1, #0xa
    bl func_020adae4
    str r0, [r7, #0x8c]
    ldr r0, .L_02037a88
    ldr r1, [r7, #0x90]
    ldr r0, [r0, r5, lsl #0x3]
    add r1, r1, r1, lsl #0x3
    add r0, r1, r0
    mov r1, #0xa
    bl func_020adae4
    str r0, [r7, #0x90]
    b .L_020378f0
.L_02037854:
    cmp r0, #0x7
    moveq r0, #0x0
    streq r0, [r7, #0x40]
    streq r0, [r7, #0x3c]
    beq .L_020378f0
    ldr r1, .L_02037a84
    ldr r0, .L_02037a88
    ldr r1, [r1, r5, lsl #0x3]
    str r1, [r7, #0x3c]
    ldr r0, [r0, r5, lsl #0x3]
    str r0, [r7, #0x40]
    b .L_020378f0
.L_02037884:
    ldr r0, [r7, #0xd0]
    tst r0, #0x10000
    bne .L_020378f0
    ldr r1, .L_02037a8c
    mov r0, #0x0
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    ldr r0, [r7, #0x230]
    add r1, sp, #0x28
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r7, #0x230]
    ldr r2, [r7, #0x1c]
    mov r0, r7
    mov r2, r2, asr #0xc
    str r2, [sp, #0x2c]
    ldr r2, [r7, #0x20]
    mov r2, r2, asr #0xc
    str r2, [sp, #0x30]
    ldr r2, [r7, #0xd0]
    bic r2, r2, #0x2
    str r2, [r7, #0xd0]
    bl Actor_TryInitializeHeightBandFromPoint
    mov r0, #0x0
    str r0, [r7, #0x40]
    str r0, [r7, #0x3c]
.L_020378f0:
    ldr r0, [r7, #0x274]
    cmp r0, #0x0
    ldrne r0, [r7, #0x27c]
    cmpne r0, #0x0
    beq .L_020379f0
    ldrsh r3, [r0, #0xa]
    ldr r0, [r7, #0x3c]
    smull r2, r1, r0, r3
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r7, #0x3c]
    ldr r0, [r7, #0x40]
    smull r2, r1, r0, r3
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r7, #0x40]
    ldr r0, [r7, #0x27c]
    ldrsh r0, [r0, #0x0]
    cmp r0, #0x67
    cmpne r0, #0x68
    beq .L_02037990
    cmp r0, #0x7b
    bne .L_020379f0
    ldr r0, [r7, #0x3c]
    mov r1, #0x4
    bl func_020adae4
    ldr r2, [r7, #0x9c]
    mov r1, #0x4
    add r0, r2, r0
    str r0, [r7, #0x9c]
    ldr r0, [r7, #0x40]
    bl func_020adae4
    ldr r1, [r7, #0xa0]
    add r0, r1, r0
    str r0, [r7, #0xa0]
    b .L_020379f0
.L_02037990:
    tst r4, #0xc0
    beq .L_020379b4
    ldr r1, [r7, #0x8c]
    mov r0, #0x60
    mul r0, r1, r0
    mov r1, #0x64
    bl func_020adae4
    str r0, [r7, #0x8c]
    b .L_020379f0
.L_020379b4:
    ldr r0, [r7, #0x3c]
    mov r1, #0x8
    bl func_020adae4
    ldr r1, [r7, #0x8c]
    add r4, r1, r0
    mov r0, r4
    str r4, [r7, #0x8c]
    bl func_020be334
    ldr r1, .L_02037a90
    cmp r0, r1
    ble .L_020379f0
    cmp r4, #0x0
    strgt r1, [r7, #0x8c]
    rsble r0, r1, #0x0
    strle r0, [r7, #0x8c]
.L_020379f0:
    ldrb r0, [r7, #0x26b]
    cmp r0, #0x0
    movne r0, #0x300
    moveq r0, #0x100
    strh r0, [r7, #0xde]
    ldr r0, [r7, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02037a24
    mov r0, r7
    bl Actor_UpdateGroundContactProbe
.L_02037a24:
    ldr r0, [r7, #0xd0]
    tst r0, #0x4
    beq .L_02037a54
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r7, #0x94]
    strne r0, [r7, #0x90]
    strne r0, [r7, #0x8c]
.L_02037a54:
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02037a5c: .word gLupyContext
.L_02037a60: .word data_020df4a4
.L_02037a64: .word gHeapContext
.L_02037a68: .word data_021052fc
.L_02037a6c: .word gSoundContext
.L_02037a70: .word 0x1001
.L_02037a74: .word gGameWork
.L_02037a78: .word 0x393
.L_02037a7c: .word data_0210568c
.L_02037a80: .word gSystemState
.L_02037a84: .word data_020df254
.L_02037a88: .word data_020df258
.L_02037a8c: .word gSceneTouchInitialData
.L_02037a90: .word 0x4cd
    .size ActorDerivedType1_UpdateFrameControl, . - ActorDerivedType1_UpdateFrameControl
