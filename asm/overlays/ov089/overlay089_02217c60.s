.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Sound_Play
.extern data_020c9670
.extern data_021052fc
.extern data_ov089_022199fc
.extern data_ov089_02219b48
.extern data_ov089_02219b4c
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Subtract
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_GetCollisionBounds
.extern Actor_SnapshotTransientState
.extern Actor_UpdateAnimationState
.extern ActorDerivedRuntime_UpdateFrame
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020adc40
.extern func_020ae024
.extern func_ov089_022186b4
.extern func_ov089_02218cb4
.extern func_ov089_02218e80
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext

.global func_ov089_02217c60
func_ov089_02217c60:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x84
    mov r10, r0
    ldr r1, [r10, #0x10]
    tst r1, #0x1000000
    beq .L_02217c80
    bl ActorDerivedRuntime_UpdateFrame
    b .L_02218678
.L_02217c80:
    add r0, r10, #0x200
    ldrh r0, [r0, #0xc]
    tst r0, #0x80
    beq .L_02217cf0
    ldr r0, .L_02218680
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0xe
    beq .L_02218678
    add r0, r10, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x34]
    mov r1, #0x3000
    str r1, [r10, #0x238]
    mov r1, #0x7d0
    strh r1, [r0, #0x36]
    ldrh r1, [r0, #0xc]
    bic r1, r1, #0x80
    strh r1, [r0, #0xc]
    ldr r1, [r10, #0x240]
    cmp r1, #0x0
    movne r0, #0x1
    strne r0, [r1, #0x14]
    ldr r1, [r10, #0x244]
    cmp r1, #0x0
    movne r0, #0x1
    strne r0, [r1, #0x14]
.L_02217cf0:
    mov r0, r10
    bl Actor_SnapshotTransientState
    mov r0, r10
    bl func_ov089_02218cb4
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x14]
    mov r5, #0x0
    cmp r0, #0x1
    bne .L_02217e94
    ldr r0, .L_02218684
    ldr r2, [r10, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r10, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r6, r2, asr #0xc
    mov r4, r1, asr #0xc
    ldr r3, [r0, #0x0]
    mov r1, r6, asr #0x3
    mov r2, r4, asr #0x3
    add r1, r6, r1, lsr #0x1c
    add r2, r4, r2, lsr #0x1c
    ldr r3, [r3, #0x2c]
    mov r1, r1, asr #0x4
    mov r2, r2, asr #0x4
    blx r3
    ldr r3, [r10, #0x3c]
    ldr r2, [r10, #0x21c]
    mov r1, r0, lsl #0x16
    add r2, r3, r2
    str r2, [r10, #0x3c]
    ldr r3, [r10, #0x40]
    ldr r2, [r10, #0x220]
    str r0, [sp, #0x20]
    add r2, r3, r2
    str r2, [r10, #0x40]
    ldr r4, [r10, #0x21c]
    ldr r6, [r10, #0x220]
    smull r2, r7, r4, r4
    adds r8, r2, #0x800
    smull r3, r2, r6, r6
    adc r7, r7, #0x0
    adds r3, r3, #0x800
    mov r8, r8, lsr #0xc
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    str r0, [sp, #0x50]
    add r0, r8, r3
    mov r7, r1, lsr #0x1b
    bl func_020adc40
    cmp r0, #0xcd
    ble .L_02217e94
    mov r0, r4
    mov r1, r6
    bl func_020ae024
    cmp r0, #0x0
    addlt r0, r0, #0x10000
    cmp r7, #0x1e
    ldreq r0, [r10, #0x224]
    andeq r0, r0, #0x8000
    addeq r0, r0, #0x4000
    beq .L_02217e14
    cmp r7, #0x1f
    bne .L_02217e14
    ldr r0, [r10, #0x224]
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x8000
    movgt r0, #0x8000
    movle r0, #0x0
.L_02217e14:
    ldr r1, [r10, #0x224]
    subs r1, r0, r1
    beq .L_02217e90
    mov r0, #0x8000
    rsb r0, r0, #0x0
    cmp r1, r0
    ldr r0, .L_02218688
    addlt r1, r1, #0x10000
    cmp r1, r0
    subgt r1, r1, #0x10000
    cmp r1, #0x0
    mov r1, #0x200
    ldr r0, [r10, #0x224]
    rsble r1, r1, #0x0
    adds r0, r0, r1
    str r0, [r10, #0x224]
    ldrmi r0, [r10, #0x224]
    addmi r0, r0, #0x10000
    strmi r0, [r10, #0x224]
    ldr r0, [r10, #0x224]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    add r0, r2, #0xf000
    mov r0, r0, asr #0xd
    and r0, r0, #0x7
    rsb r1, r0, #0x7
    str r2, [r10, #0x224]
    strb r1, [r10, #0xd4]
    ldr r0, [r10, #0x54]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02217e90:
    mov r5, #0x1
.L_02217e94:
    ldr r0, [r10, #0x224]
    ldr r3, .L_0221868c
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r0, r0, lsl #0x1
    mov r2, r1, lsl #0x1
    ldrsh r1, [r3, r0]
    ldr r0, [r10, #0x3c]
    ldrsh r2, [r3, r2]
    rsb r1, r1, #0x0
    smull r6, r7, r1, r0
    adds r8, r6, #0x800
    ldr r4, [r10, #0x40]
    adc r7, r7, #0x0
    smull r6, r4, r2, r4
    adds r6, r6, #0x800
    mov r8, r8, lsr #0xc
    adc r4, r4, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r4, lsl #0x14
    orr r8, r8, r7, lsl #0x14
    add r7, r8, r6
    ldr r4, .L_02218690
    mov r6, #0x0
    umull r9, r8, r7, r4
    mla r8, r7, r6, r8
    mov r7, r7, asr #0x1f
    adds r9, r9, #0x800
    mla r8, r7, r4, r8
    adc r7, r8, #0x0
    mov r11, r9, lsr #0xc
    orr r11, r11, r7, lsl #0x14
    smull r9, r8, r1, r11
    smull r7, r1, r2, r11
    adds r9, r9, #0x800
    adc r2, r8, #0x0
    mov r8, r9, lsr #0xc
    orr r8, r8, r2, lsl #0x14
    sub r0, r0, r8
    str r0, [r10, #0x3c]
    adds r2, r7, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r10, #0x40]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r10, #0x40]
    ldr r1, [r10, #0x224]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x1
    mov r1, r2, lsl #0x1
    ldrsh r7, [r3, r1]
    add r1, r2, #0x1
    mov r1, r1, lsl #0x1
    ldr r2, [r10, #0x3c]
    ldrsh r1, [r3, r1]
    smull r8, r3, r7, r2
    smull r2, r0, r1, r0
    adds r7, r8, #0x800
    adc r1, r3, #0x0
    mov r3, r7, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r1, r3, r1
    umull r3, r2, r1, r4
    mla r2, r1, r6, r2
    mov r0, r1, asr #0x1f
    adds r1, r3, #0x800
    mla r2, r0, r4, r2
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    orrs r1, r1, r0, lsl #0x14
    strmi r6, [r10, #0x3c]
    strmi r6, [r10, #0x40]
    ldr r2, [r10, #0x208]
    add r0, sp, #0x64
    add r1, r10, #0x38
    bl func_ov089_022186b4
    add r1, sp, #0x64
    add r0, r10, #0x38
    bl VecFx32Object_Subtract
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x14]
    cmp r0, #0x1
    bne .L_022183bc
    ldr r1, [r10, #0x21c]
    ldr r4, [r10, #0x220]
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
    add r0, r3, r1
    bl func_020adc40
    mov r1, #0x1
    mov r7, #0x0
    sub r2, r7, #0x1
    mov r0, r10
    strb r2, [sp, #0x30]
    strb r2, [sp, #0x31]
    strb r1, [sp, #0x32]
    strb r1, [sp, #0x33]
    bl Actor_GetCollisionBounds
    ldrsb r3, [sp, #0x30]
    ldrsb r1, [sp, #0x31]
    ldrsb r2, [sp, #0x32]
    strb r3, [r0, #0x0]
    strb r1, [r0, #0x1]
    ldrsb r1, [sp, #0x33]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldr r2, [r10, #0x40]
    ldr r4, [r10, #0x3c]
    smull r1, r0, r2, r2
    smull r3, r2, r4, r4
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mvn r1, #0x0
    str r1, [r10, #0x230]
    ldr r1, [r10, #0x40]
    mov r6, r0
    ldr r2, [r10, #0x1c]
    ldr r0, [r10, #0x20]
    cmp r1, #0x0
    addlt r1, r0, r1
    mov r2, r2, asr #0xc
    sub r3, r2, #0x10
    movlt r0, r1, asr #0xb
    add r2, r2, #0xf
    addlt r0, r1, r0, lsr #0x14
    mov r3, r3, asr #0x4
    mov r2, r2, asr #0x4
    movlt r0, r0, asr #0xc
    str r3, [sp, #0x44]
    str r2, [sp, #0x48]
    sublt r0, r0, #0x10
    blt .L_02218118
    add r0, r0, r1
    add r0, r0, #0xff
    add r0, r0, #0xf00
    mov r0, r0, asr #0xc
    add r0, r0, #0xf
.L_02218118:
    mov r9, r0, asr #0x4
    mov r0, #0x2
    sub r8, r0, #0x1
    add r4, sp, #0x34
    add r11, sp, #0x44
.L_0221812c:
    ldr r0, .L_02218684
    ldr r1, [r11, r8, lsl #0x2]
    ldr r0, [r0, #0x0]
    mov r2, r9
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r1, [r4, r8, lsl #0x2]
    cmp r1, #0x1d
    blt .L_0221816c
    cmp r1, #0x1f
    ble .L_02218178
.L_0221816c:
    mov r1, #0x1
    str r1, [r4, r8, lsl #0x2]
    b .L_02218180
.L_02218178:
    mov r1, #0x0
    str r1, [r4, r8, lsl #0x2]
.L_02218180:
    subs r8, r8, #0x1
    bpl .L_0221812c
    ldr r1, [sp, #0x34]
    str r0, [sp, #0x4c]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x1c]
    cmp r1, #0x0
    ldreq r0, [sp, #0x38]
    cmpeq r0, #0x0
    beq .L_02218230
    ldr r0, .L_02218694
    ldr r1, [r10, #0x40]
    cmp r6, r0
    ldr r0, [r10, #0x20]
    movgt r7, #0x1
    cmp r1, #0x0
    addge r0, r0, r1
    addge r0, r0, #0xff
    addge r0, r0, #0xf00
    movge r0, r0, asr #0xc
    addlt r1, r0, r1
    movlt r0, r1, asr #0xb
    addlt r0, r1, r0, lsr #0x14
    movlt r0, r0, asr #0xc
    addlt r0, r0, #0x10
    bic r0, r0, #0xf
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x20]
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [r10, #0x40]
    ldr r0, [sp, #0x38]
    addne r1, r1, #0x400
    cmp r0, #0x0
    subne r1, r1, #0x400
    cmp r1, #0x400
    moveq r0, #0x2
    streq r0, [r10, #0x230]
    mov r0, #0x400
    rsb r0, r0, #0x0
    cmp r1, r0
    moveq r0, #0x6
    streq r0, [r10, #0x230]
.L_02218230:
    ldr r0, [r10, #0x20]
    ldr r1, [r10, #0x3c]
    mov r0, r0, asr #0xc
    sub r2, r0, #0x10
    add r0, r0, #0xf
    mov r0, r0, asr #0x4
    str r0, [sp, #0x40]
    ldr r0, [r10, #0x1c]
    cmp r1, #0x0
    addlt r1, r0, r1
    movlt r0, r1, asr #0xb
    addlt r0, r1, r0, lsr #0x14
    mov r2, r2, asr #0x4
    movlt r0, r0, asr #0xc
    str r2, [sp, #0x3c]
    sublt r0, r0, #0x10
    blt .L_02218288
    add r0, r0, r1
    add r0, r0, #0xff
    add r0, r0, #0xf00
    mov r0, r0, asr #0xc
    add r0, r0, #0xf
.L_02218288:
    mov r9, r0, asr #0x4
    mov r0, #0x2
    sub r8, r0, #0x1
    add r4, sp, #0x34
    add r11, sp, #0x3c
.L_0221829c:
    ldr r0, .L_02218684
    ldr r2, [r11, r8, lsl #0x2]
    ldr r0, [r0, #0x0]
    mov r1, r9
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r1, [r4, r8, lsl #0x2]
    cmp r1, #0x1d
    blt .L_022182dc
    cmp r1, #0x1f
    ble .L_022182e8
.L_022182dc:
    mov r1, #0x1
    str r1, [r4, r8, lsl #0x2]
    b .L_022182f0
.L_022182e8:
    mov r1, #0x0
    str r1, [r4, r8, lsl #0x2]
.L_022182f0:
    subs r8, r8, #0x1
    bpl .L_0221829c
    ldr r1, [sp, #0x34]
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    str r0, [sp, #0x18]
    cmp r1, #0x0
    ldreq r0, [sp, #0x38]
    cmpeq r0, #0x0
    beq .L_022183a0
    ldr r0, .L_02218694
    ldr r1, [r10, #0x3c]
    cmp r6, r0
    ldr r0, [r10, #0x1c]
    movgt r7, #0x1
    cmp r1, #0x0
    addge r0, r0, r1
    addge r0, r0, #0xff
    addge r0, r0, #0xf00
    movge r0, r0, asr #0xc
    addlt r1, r0, r1
    movlt r0, r1, asr #0xb
    addlt r0, r1, r0, lsr #0x14
    movlt r0, r0, asr #0xc
    addlt r0, r0, #0x10
    bic r0, r0, #0xf
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x1c]
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [r10, #0x3c]
    ldr r0, [sp, #0x38]
    addne r1, r1, #0x400
    cmp r0, #0x0
    subne r1, r1, #0x400
    cmp r1, #0x400
    moveq r0, #0x0
    streq r0, [r10, #0x230]
    mov r0, #0x400
    rsb r0, r0, #0x0
    cmp r1, r0
    moveq r0, #0x4
    streq r0, [r10, #0x230]
.L_022183a0:
    cmp r7, #0x0
    beq .L_022183bc
    ldr r0, .L_02218698
    mov r1, #0x84
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
.L_022183bc:
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x14]
    cmp r0, #0x1
    bne .L_02218660
    add r0, sp, #0x74
    add r1, r10, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [r10, #0x240]
    mov r0, #0xc
    ldrb r2, [r1, #0x1a]
    ldr r1, .L_0221869c
    ldr r3, [sp, #0x78]
    smulbb r2, r2, r0
    ldr r2, [r1, r2]
    ldr r1, .L_02218684
    add r2, r3, r2
    str r2, [sp, #0x78]
    ldr r2, [r10, #0x240]
    ldr r1, [r1, #0x0]
    ldrb r3, [r2, #0x1a]
    ldr r2, .L_022186a0
    ldr r4, [sp, #0x7c]
    smulbb r0, r3, r0
    ldr r2, [r2, r0]
    add r0, r1, #0x2000
    add r1, r4, r2
    str r1, [sp, #0x7c]
    ldr r0, [r0, #0xea4]
    add r1, r10, #0x18
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    ldr r0, .L_02218684
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_022184a4
    add r0, r10, #0x200
    ldrh r0, [r0, #0xc]
    tst r0, #0x800
    beq .L_022184a4
    add r0, sp, #0x54
    mov r1, r10
    mov r2, #0x0
    bl func_ov089_02218e80
    ldr r0, .L_02218684
    add r1, sp, #0x54
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
.L_022184a4:
    ldr r2, [r10, #0x240]
    ldrb r1, [r10, #0xd4]
    ldrb r0, [r2, #0x1a]
    cmp r0, r1
    beq .L_022184d0
    strb r1, [r2, #0x1a]
    ldr r0, [r10, #0x240]
    ldrb r1, [r10, #0xd4]
    ldr r0, [r0, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0221862c
.L_022184d0:
    ldr r0, [r2, #0x4]
    mov r3, #0x0
    ldrb r4, [r0, #0x38]
    cmp r1, r4
    bne .L_022184f8
    ldrh r2, [r0, #0x24]
    and r2, r2, #0x1
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    moveq r3, #0x1
.L_022184f8:
    cmp r5, #0x0
    bne .L_02218538
    cmp r3, #0x0
    bne .L_0221862c
    add r2, r1, #0x10
    cmp r2, r4
    beq .L_0221862c
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x240]
    ldr r1, [r0, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221862c
.L_02218538:
    beq .L_022185fc
    cmp r3, #0x0
    bne .L_0221862c
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x240]
    ldr r1, .L_022186a4
    ldr r5, [r0, #0x4]
    ldr r3, .L_022186a8
    ldrh r4, [r5, #0x24]
    mov r0, #0x14
    mov r2, #0x4
    bic r4, r4, #0x2
    strh r4, [r5, #0x24]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022185b8
    ldr r3, .L_022186ac
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r10, #0x54]
    add r1, sp, #0x74
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_022185b8:
    add r0, r10, #0x200
    ldrh r0, [r0, #0x3c]
    ldr r1, .L_02218698
    cmp r0, #0x0
    moveq r0, #0x4200
    ldrne r0, .L_022186b0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
    add r0, r10, #0x200
    ldrh r1, [r0, #0x3c]
    eor r1, r1, #0x1
    strh r1, [r0, #0x3c]
    b .L_0221862c
.L_022185fc:
    add r1, r1, #0x8
    cmp r1, r4
    beq .L_0221862c
    cmp r3, #0x0
    bne .L_0221862c
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x240]
    ldr r1, [r0, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221862c:
    ldr r2, [r10, #0x244]
    cmp r2, #0x0
    ldrneb r1, [r10, #0xd4]
    ldrneb r0, [r2, #0x1a]
    cmpne r0, r1
    beq .L_02218658
    strb r1, [r2, #0x1a]
    ldr r0, [r10, #0x244]
    ldrb r1, [r0, #0x1a]
    ldr r0, [r0, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
.L_02218658:
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
.L_02218660:
    mov r0, r10
    bl Actor_UpdateAnimationState
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_02218678:
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02218680: .word gSceneManager
.L_02218684: .word data_021052fc
.L_02218688: .word 0x7fff
.L_0221868c: .word data_020c9670
.L_02218690: .word 0x333
.L_02218694: .word 0xe66
.L_02218698: .word gSoundContext
.L_0221869c: .word data_ov089_02219b48
.L_022186a0: .word data_ov089_02219b4c
.L_022186a4: .word data_ov089_022199fc
.L_022186a8: .word gHeapContext
.L_022186ac: .word 0x1629
.L_022186b0: .word 0x4201
.size func_ov089_02217c60, . - func_ov089_02217c60
