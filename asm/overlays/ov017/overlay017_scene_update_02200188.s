    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_update.c. */
    .extern gFx32CosSinTable
    .extern data_ov017_02201414
    .extern data_ov017_022016c4
    .extern data_ov017_022016cc
    .extern data_ov017_022016e0
    .extern data_ov017_022016f0
    .extern data_ov017_022016f8
    .extern data_ov017_0220170c
    .extern data_ov017_02201754
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern GraphicsAnimationInstance_GetSequenceDuration
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern GraphicsAnimationInstanceManager_Update
    .extern func_0209189c
    .extern TitleRandom_NextBounded
    .extern SceneSound_PlayPackedEffect
    .extern PresentationScalar_TransitionTo
    .extern Presentation_SetPosition
    .extern PresentationList_Append
    .extern PresentationList_Remove
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern AlternateSpritePresentation_Init
    .extern SpriteMotionController_Update
    .extern func_020befec
    .extern Overlay017_UpdateGridDeformation
    .extern Overlay017_ApplyGridImpulse
    .extern Overlay017_EffectVariant_Init
    .extern Overlay017_UpdateSpritePool
    .extern func_ov017_021fe894
    .extern Overlay017_UpdatePaletteRamp
    .extern Overlay017Timer_Tick
    .extern gHeapContext
    .extern Heap_Alloc
    .global func_ov017_02200188
func_ov017_02200188:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    ldr r1, [r10, #0x20]
    ldr r0, L_02200850
    mov r1, r1, lsl #0x1b
    mov r4, r1, asr #0x1f
    str r4, [r0, #0x4]
    ldr r2, [r0, #0xc]
    ldr r1, L_02200854
    ldr r0, [r10, #0x34]
    ldr r5, [r1, r2, lsl #0x2]
    sub r1, r0, #0x80
    mul r0, r1, r5
    ldr r1, [r10, #0x3a4]
    sub r1, r1, #0x80
    bl func_020befec
    ldr r1, L_02200850
    str r0, [r1, #0x30]
    ldr r0, [r10, #0x38]
    ldr r1, [r10, #0x3a8]
    sub r2, r0, #0x60
    mul r0, r2, r5
    sub r1, r1, #0x60
    bl func_020befec
    ldr r1, L_02200850
    mov r2, #0x0
    str r0, [r1, #0x34]
    str r2, [r1, #0x54]
    str r2, [r1, #0x58]
    cmp r4, #0x0
    beq L_022003c4
    ldr r0, [r10, #0x254]
    ldr r0, [r0, #0x30]
    cmp r0, #0x2
    moveq r2, #0x1
    cmp r2, #0x0
    beq L_022003c4
    ldr r0, [r10, #0x20]
    mov r1, r0, lsl #0x1a
    movs r1, r1, asr #0x1f
    bne L_0220023c
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_0220025c
L_0220023c:
    ldr r1, L_02200850
    ldr r0, [r10, #0x2c0]
    ldr r3, [r1, #0x30]
    ldr r2, [r1, #0x34]
    mov r1, r3, lsl #0x4
    mov r2, r2, lsl #0x4
    mvn r3, #0x3f
    bl Overlay017_ApplyGridImpulse
L_0220025c:
    ldr r0, [r10, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    bne L_0220039c
    ldr r0, L_02200850
    ldr r3, [r10, #0x3b0]
    ldr r2, [r0, #0x30]
    ldr r1, [r0, #0x34]
    ldr r0, [r10, #0x3b4]
    subs r2, r2, r3
    rsbmi r2, r2, #0x0
    sub r1, r1, r0
    cmp r2, #0x1
    ldrle r0, L_02200850
    strle r3, [r0, #0x30]
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r1, #0x1
    ldrle r1, [r10, #0x3b4]
    ldrle r0, L_02200850
    strle r1, [r0, #0x34]
    ldr r0, L_02200850
    ldr r1, L_02200854
    ldr r4, [r0, #0x34]
    ldr r3, [r0, #0xc]
    mul r2, r4, r4
    ldr r5, [r1, r3, lsl #0x2]
    ldr r3, [r0, #0x30]
    mul r1, r5, r5
    mla r2, r3, r3, r2
    cmp r2, r1
    bge L_0220039c
    ldr r1, [r10, #0x3b0]
    ldr r2, [r10, #0x3b4]
    sub r1, r3, r1
    str r1, [r0, #0x54]
    sub r1, r4, r2
    str r1, [r0, #0x58]
    ldr r1, [r10, #0x20]
    mov r1, r1, lsl #0x16
    movs r1, r1, asr #0x1f
    beq L_0220039c
    ldr r1, [r10, #0x3f8]
    cmp r1, #0x20
    bge L_0220039c
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    beq L_0220039c
    ldr r1, L_02200858
    ldr r3, L_0220085c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02200390
    add r0, r10, #0x3fc
    mov r1, #0x20
    mov r2, #0x30
    bl func_0209189c
    mov r5, r0
    add r0, r10, #0x3fc
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mvn r1, #0x7f
    str r1, [sp, #0x0]
    mov r1, r0, lsl #0x4
    str r5, [sp, #0x4]
    ldr r0, L_02200850
    str r1, [sp, #0x8]
    ldr r2, [r0, #0x30]
    ldr r1, [r0, #0x34]
    mov r0, r4
    mov r2, r2, lsl #0x4
    mov r3, r1, lsl #0x4
    mov r1, #0x0
    bl Overlay017_EffectVariant_Init
    mov r4, r0
L_02200390:
    mov r1, r4
    add r0, r10, #0x3ec
    bl PresentationList_Append
L_0220039c:
    ldr r1, L_02200860
    add r0, r10, #0x3ac
    cmp r1, r0
    beq L_022003d4
    ldr r0, L_02200850
    ldr r1, [r0, #0x30]
    str r1, [r10, #0x3b0]
    ldr r0, [r0, #0x34]
    str r0, [r10, #0x3b4]
    b L_022003d4
L_022003c4:
    ldr r0, L_02200850
    mov r1, #0x0
    str r1, [r0, #0x30]
    str r1, [r0, #0x34]
L_022003d4:
    ldr r0, L_02200864
    bl PresentationList_UpdateAndDeleteCompleted
    mov r1, #0x0
    ldr r0, L_02200850
    str r1, [r10, #0x3d0]
    ldr r4, [r0, #0x78]
    mvn r11, #0x7f
    b L_02200514
L_022003f4:
    ldr r2, [r4, #0x10]
    ldr r1, [r4, #0x20]
    ldr r5, [r4, #0x8]
    mov r0, r2, asr #0x7
    add r0, r2, r0, lsr #0x18
    mov r6, r0, asr #0x8
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r7, r0, asr #0x8
    ldr r2, [r4, #0x30]
    ldr r1, [r4, #0xb4]
    mov r0, r2, asr #0x7
    add r0, r2, r0, lsr #0x18
    cmp r1, #0x2
    mov r8, r0, asr #0x8
    bne L_02200448
    ldr r0, [r10, #0x2c0]
    mov r1, r6
    mov r2, r8
    mov r3, r11
    bl Overlay017_ApplyGridImpulse
L_02200448:
    ldr r0, [r4, #0xb4]
    cmp r0, #0x6
    bne L_02200500
    ldr r1, L_02200858
    ldr r3, L_0220085c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_022004bc
    add r0, r10, #0x3fc
    mov r1, #0x10
    mov r2, #0x18
    bl func_0209189c
    str r0, [sp, #0xc]
    add r0, r10, #0x3fc
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    ldr r1, [sp, #0xc]
    str r7, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r0, r0, lsl #0x4
    str r0, [sp, #0x8]
    mov r2, r6
    mov r3, r8
    mov r0, r9
    mov r1, #0x2
    bl Overlay017_EffectVariant_Init
    mov r9, r0
L_022004bc:
    mov r1, r9
    add r0, r10, #0x3ec
    bl PresentationList_Append
    ldrh r2, [r4, #0x9c]
    ldr r3, [r10, #0x3cc]
    ldr r0, L_02200864
    add r2, r3, r2
    mov r1, r4
    str r2, [r10, #0x3cc]
    bl PresentationList_Remove
    cmp r4, #0x0
    beq L_02200510
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    b L_02200510
L_02200500:
    ldrh r0, [r4, #0x9e]
    ldr r1, [r10, #0x3d0]
    add r0, r1, r0
    str r0, [r10, #0x3d0]
L_02200510:
    mov r4, r5
L_02200514:
    cmp r4, #0x0
    bne L_022003f4
    ldr r2, [r10, #0x3cc]
    ldr r0, [r10, #0x3d0]
    ldr r1, [r10, #0x25c]
    add r2, r2, r0
    mov r0, r10
    str r2, [r1, #0x64]
    bl Overlay017_UpdatePaletteRamp
    add r0, r10, #0x3ec
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, L_02200850
    ldr r1, [r0, #0x8]
    ldr r2, [r0, #0x0]
    add r0, r1, r1, lsr #0x1f
    cmp r2, r0, asr #0x1
    blt L_022007d0
    ldr r0, [r10, #0x440]
    cmp r0, #0x0
    bne L_02200578
    ldr r1, L_02200868
    mov r0, r10
    bl SceneSound_PlayPackedEffect
    mov r0, #0x1
    str r0, [r10, #0x440]
L_02200578:
    ldr r0, [r10, #0x3d4]
    add r0, r0, #0x1
    str r0, [r10, #0x3d4]
    cmp r0, #0x8
    ble L_022006c8
    mov r2, #0x0
    add r0, r10, #0x3fc
    mov r1, #0x1000
    str r2, [r10, #0x3d4]
    bl TitleRandom_NextBounded
    ldr r1, L_02200850
    mov r4, r0, lsl #0x4
    ldr r2, [r1, #0xc]
    ldr r1, L_02200854
    add r0, r10, #0x3fc
    ldr r1, [r1, r2, lsl #0x2]
    bl TitleRandom_NextBounded
    mov r3, r4, asr #0x3
    add r1, r3, #0x1
    ldr r2, L_0220086c
    mov r3, r3, lsl #0x1
    ldrsh r3, [r2, r3]
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    mul r5, r0, r3
    mul r4, r0, r2
    mov r0, r5, asr #0x7
    add r2, r5, r0, lsr #0x18
    mov r3, r4, asr #0x7
    add r3, r4, r3, lsr #0x18
    ldr r0, [r10, #0x244]
    add r1, r10, #0x248
    mov r5, r2, asr #0x8
    mov r6, r3, asr #0x8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldr r1, L_02200870
    ldr r3, L_0220085c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r7, r0
    beq L_02200630
    mov r1, r4
    bl AlternateSpritePresentation_Init
    mov r7, r0
L_02200630:
    mov r1, r7
    add r0, r10, #0x3d8
    bl PresentationList_Append
    mov r0, r7
    mov r1, r5
    mov r3, r6
    mov r2, #0x0
    bl Presentation_SetPosition
    add r0, r10, #0x3fc
    mov r1, #0x600
    mov r2, #0x900
    bl func_0209189c
    mov r2, r0
    add r0, r7, #0x1c
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r0, r4
    bl GraphicsAnimationInstance_GetSequenceDuration
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r7, #0x7c]
    mov r1, #0x0
    str r1, [r7, #0x80]
    mov r2, #0x1
    str r2, [r7, #0x88]
    ldrh r5, [r4, #0x50]
    mov r3, #0x10
    mov r0, #0x3
    orr r5, r5, #0x40
    strh r5, [r4, #0x50]
    strb r3, [r4, #0x5a]
    strb r0, [r4, #0x59]
    add r0, r10, #0x3fc
    bl func_0209189c
    cmp r0, #0x0
    ldrneh r0, [r4, #0x50]
    orrne r0, r0, #0x400
    strneh r0, [r4, #0x50]
L_022006c8:
    ldr r0, [r10, #0x254]
    ldr r0, [r0, #0x30]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_022007d0
    ldr r0, [r10, #0x3e8]
    add r0, r0, #0x1
    str r0, [r10, #0x3e8]
    cmp r0, #0x7
    ble L_022007d0
    mov r2, #0x0
    add r0, r10, #0x3fc
    mov r1, #0x1000
    str r2, [r10, #0x3e8]
    bl TitleRandom_NextBounded
    ldr r1, L_02200850
    mov r4, r0, lsl #0x4
    ldr r2, [r1, #0xc]
    ldr r1, L_02200854
    add r0, r10, #0x3fc
    ldr r1, [r1, r2, lsl #0x2]
    bl TitleRandom_NextBounded
    mov r3, r4, asr #0x3
    add r2, r3, #0x1
    ldr r1, [r10, #0x3f8]
    ldr r5, L_0220086c
    mov r3, r3, lsl #0x1
    mov r2, r2, lsl #0x1
    ldrsh r3, [r5, r3]
    ldrsh r2, [r5, r2]
    cmp r1, #0x20
    mul r3, r0, r3
    mul r2, r0, r2
    mov r0, r3, asr #0x7
    mov r1, r2, asr #0x7
    add r0, r3, r0, lsr #0x18
    add r1, r2, r1, lsr #0x18
    mov r5, r0, asr #0x8
    mov r6, r1, asr #0x8
    bge L_022007d0
    ldr r1, L_02200858
    ldr r3, L_0220085c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r7, r0
    beq L_022007c4
    add r0, r10, #0x3fc
    mov r1, #0x10
    mov r2, #0x18
    bl func_0209189c
    mvn r1, #0x7f
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r7
    mov r2, r5
    mov r3, r6
    mov r1, #0x1
    str r4, [sp, #0x8]
    bl Overlay017_EffectVariant_Init
    mov r7, r0
L_022007c4:
    mov r1, r7
    add r0, r10, #0x3ec
    bl PresentationList_Append
L_022007d0:
    add r0, r10, #0x3d8
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r10, #0x254]
    bl Overlay017_UpdateSpritePool
    add r0, r10, #0x12c
    bl SpriteMotionController_Update
    add r0, r10, #0x80
    bl SpriteMotionController_Update
    ldr r0, [r10, #0x25c]
    bl func_ov017_021fe894
    ldr r0, [r10, #0x244]
    bl GraphicsAnimationInstanceManager_Update
    ldr r0, [r10, #0x58]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r10, #0x2c0]
    bl Overlay017_UpdateGridDeformation
    ldr r0, L_02200874
    bl Overlay017Timer_Tick
    cmp r0, #0x0
    beq L_0220082c
    mov r0, r10
    mov r1, #0x21
    bl SceneSound_PlayPackedEffect
L_0220082c:
    ldr r0, L_02200878
    bl Overlay017Timer_Tick
    cmp r0, #0x0
    beq L_02200848
    mov r0, r10
    mov r1, #0x2a
    bl SceneSound_PlayPackedEffect
L_02200848:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02200850: .word data_ov017_022016e0
L_02200854: .word data_ov017_02201414
L_02200858: .word data_ov017_022016c4
L_0220085c: .word gHeapContext
L_02200860: .word data_ov017_0220170c
L_02200864: .word data_ov017_02201754
L_02200868: .word 0x4115
L_0220086c: .word gFx32CosSinTable
L_02200870: .word data_ov017_022016cc
L_02200874: .word data_ov017_022016f0
L_02200878: .word data_ov017_022016f8
    .size func_ov017_02200188, . - func_ov017_02200188
