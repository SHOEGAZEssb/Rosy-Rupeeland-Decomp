.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Sound_Play
.extern data_021052fc
.extern data_ov062_02211c40
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern GraphicsSpriteState_SetWorldPosition
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern ActorMotionJitter_EnsureMinimum
.extern ByteTileMapOwner_GetCell
.extern Type7Actor_GetStateCode
.extern Type7Actor_ConfigureAttachmentController
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_020adcac
.extern func_020be334
.extern func_ov062_0220fd50
.extern func_ov062_0220fdbc
.extern func_ov062_02210674
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext
.extern gSystemState

.global func_ov062_02211388
func_ov062_02211388:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4c
    ldr r1, .L_02211aa8
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    cmp r0, r4
    movne r0, #0x0
    bne .L_02211aa0
    ldrsh r0, [r4, #0x56]
    cmp r0, #0x4000
    addlt r0, r0, #0x1
    strlth r0, [r4, #0x56]
    ldr r1, [r4, #0x58]
    ldr r0, [r4, #0x8]
    add r7, r1, #0x18
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_022117e4
.L_022113d4:
    b .L_022113f0
    b .L_02211420
    b .L_02211564
    b .L_02211564
    b .L_0221163c
    b .L_022117e4
    b .L_022116b4
.L_022113f0:
    adds r1, r4, #0x24
    addne r1, r1, #0x4
    mov r0, r7
    cmp r7, #0x0
    addne r0, r7, #0x4
    bl func_020adcac
    cmp r0, #0x2000
    bgt .L_022117e4
    mov r0, #0x1
    str r0, [r4, #0x8]
    mov r0, #0x0
    strh r0, [r4, #0x56]
.L_02211420:
    ldrsh r0, [r4, #0x56]
    cmp r0, #0x5
    ble .L_022117e4
    ldr r0, .L_02211aac
    ldrh r2, [r0, #0x1a]
    tst r2, #0xf0
    beq .L_0221149c
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x0
    moveq r0, #0x80
    moveq r1, #0x40
    beq .L_02211474
    cmp r0, #0x1
    moveq r0, #0x40
    moveq r1, #0x80
    beq .L_02211474
    cmp r0, #0x2
    moveq r0, #0x20
    moveq r1, #0x10
    movne r0, #0x10
    movne r1, #0x20
.L_02211474:
    tst r2, r0
    ldrne r0, [r4, #0x74]
    subne r0, r0, #0x1
    strne r0, [r4, #0x74]
    bne .L_022114a4
    tst r2, r1
    ldrne r0, [r4, #0x74]
    addne r0, r0, #0x1
    strne r0, [r4, #0x74]
    b .L_022114a4
.L_0221149c:
    mov r0, #0x0
    str r0, [r4, #0x74]
.L_022114a4:
    ldr r1, [r4, #0x74]
    mvn r0, #0x4
    cmp r1, r0
    bge .L_022114cc
    mov r2, #0x2
    add r0, r4, #0x24
    add r1, r4, #0x44
    str r2, [r4, #0x8]
    bl func_020050a4
    b .L_022117e4
.L_022114cc:
    cmp r1, #0x5
    ble .L_022117e4
    mov r0, #0x3
    str r0, [r4, #0x8]
    add r0, r4, #0x24
    add r1, r4, #0x34
    bl func_020050a4
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02211524
.L_022114f8:
    b .L_02211508
    b .L_02211510
    b .L_02211518
    b .L_02211520
.L_02211508:
    mov r5, #0x27
    b .L_02211524
.L_02211510:
    mov r5, #0x25
    b .L_02211524
.L_02211518:
    mov r5, #0x28
    b .L_02211524
.L_02211520:
    mov r5, #0x26
.L_02211524:
    ldr r3, [r4, #0x60]
    ldr r1, [r4, #0x64]
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r4, #0x64]
    and r1, r5, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, .L_02211ab0
    mov r1, #0x1b8
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    b .L_022117e4
.L_02211564:
    adds r1, r4, #0x24
    addne r1, r1, #0x4
    mov r0, r7
    cmp r7, #0x0
    addne r0, r7, #0x4
    bl func_020adcac
    cmp r0, #0x1000
    bgt .L_022117e4
    ldr r0, [r4, #0x8]
    cmp r0, #0x2
    bne .L_022115b0
    cmp r4, #0x0
    beq .L_022115a8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022115a8:
    mov r0, #0x1
    b .L_02211aa0
.L_022115b0:
    mov r0, #0x4
    str r0, [r4, #0x8]
    ldr r0, .L_02211ab4
    ldr r2, [r4, #0x38]
    ldr r0, [r0, #0x0]
    ldr r1, [r4, #0x3c]
    add r0, r0, #0x2000
    mov r5, r2, asr #0x10
    mov r6, r1, asr #0x10
    ldr r0, [r0, #0xed4]
    mov r1, r5
    mov r2, r6
    bl ByteTileMapOwner_GetCell
    mov r0, r0, lsl #0x10
    str r0, [r4, #0x30]
    str r0, [r4, #0x40]
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x0
    bne .L_0221163c
    ldr r0, .L_02211ab4
    mov r1, r5
    ldr r0, [r0, #0x0]
    mov r2, r6
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    bl ByteTileMapOwner_GetCell
    ldr r2, [r4, #0x50]
    add r1, r0, #0x1
    ldr r0, [r4, #0x3c]
    sub r1, r2, r1, lsl #0x10
    sub r0, r0, r1
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x2c]
    sub r0, r0, r1
    str r0, [r4, #0x2c]
.L_0221163c:
    ldr r1, [r7, #0xc]
    ldr r0, [r4, #0x30]
    cmp r1, r0
    bgt .L_022117e4
    ldr r2, [r4, #0x6c]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x6c]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    strh r0, [r4, #0x56]
    mov r1, #0x5
    ldr r0, .L_02211ab4
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    mov r1, #0xa
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r2, #0x2
    bl ActorMotionJitter_EnsureMinimum
    mov r1, #0x2000
    ldr r0, .L_02211ab0
    str r1, [r4, #0x70]
    ldr r0, [r0, #0x0]
    mov r1, #0x1b8
    mov r2, #0x1
    bl Sound_Play
    b .L_022117e4
.L_022116b4:
    ldrsh r0, [r4, #0x56]
    cmp r0, #0x1e
    blt .L_022117e4
    add r0, sp, #0x3c
    mov r5, #0x0
    bl func_02004fe0
    ldr r0, .L_02211ab4
    ldr r7, [r4, #0x50]
    ldr r1, [r0, #0x0]
    ldr r0, [r4, #0x40]
    add r1, r1, #0x2000
    sub r0, r7, r0
    ldr r6, [r1, #0xea8]
    bl func_020be334
    cmp r0, #0x10000
    ble .L_02211768
    cmp r6, #0x0
    beq .L_02211768
    ldr r0, [r6, #0x24]
    cmp r0, r7
    bne .L_02211768
    mov r0, r6
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    cmpne r0, #0x3
    cmpne r0, #0x8
    bne .L_02211768
    ldr r0, [r6, #0x20]
    ldr r1, [r4, #0x2c]
    mov r0, r0, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mul r0, r1, r1
    ldr r1, [r6, #0x1c]
    ldr r2, [r4, #0x28]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mla r0, r1, r1, r0
    cmp r0, #0x2400
    bgt .L_02211768
    mov r2, #0x0
    add r0, sp, #0x3c
    add r1, r4, #0x24
    str r2, [r4, #0x78]
    mov r5, #0x1
    bl func_020050a4
.L_02211768:
    cmp r4, #0x0
    beq .L_02211780
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02211780:
    cmp r5, #0x0
    beq .L_022117d4
    mov r0, r6
    mvn r1, #0x1
    bl Type7Actor_ConfigureAttachmentController
    ldr r1, .L_02211ab8
    ldr r3, .L_02211abc
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022117d4
    mov r1, #0x28
    str r1, [sp, #0x0]
    mov r4, #0x0
    str r4, [sp, #0x4]
    add r2, sp, #0x3c
    mov r1, r6
    mov r3, #0x20
    str r4, [sp, #0x8]
    bl func_ov062_02210674
.L_022117d4:
    add r0, sp, #0x3c
    bl func_02005058
    mov r0, #0x1
    b .L_02211aa0
.L_022117e4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x2
    bhi .L_02211848
    ldr r2, .L_02211ac0
    add r0, sp, #0x2c
    mov r1, r7
    bl func_ov062_0220fd50
    ldr r2, .L_02211ac4
    add r0, sp, #0x1c
    add r1, r4, #0x24
    bl func_ov062_0220fd50
    add r0, sp, #0xc
    add r1, sp, #0x2c
    add r2, sp, #0x1c
    bl func_ov062_0220fdbc
    add r1, sp, #0xc
    mov r0, r7
    bl func_020050a4
    add r0, sp, #0xc
    bl func_02005058
    add r0, sp, #0x1c
    bl func_02005058
    add r0, sp, #0x2c
    bl func_02005058
    b .L_02211a1c
.L_02211848:
    cmp r0, #0x3
    ldr r0, [r4, #0x58]
    ldr r1, [r0, #0x0]
    bne .L_02211914
    ldr r1, [r1, #0xb0]
    blx r1
    mov r1, r0, asr #0x1
    ldr r2, [r4, #0x70]
    add r0, r0, r1, lsr #0x1e
    sub r0, r2, r0, asr #0x2
    str r0, [r4, #0x70]
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02211928
.L_02211884:
    b .L_02211894
    b .L_022118b4
    b .L_022118d4
    b .L_022118f4
.L_02211894:
    ldr r1, [r7, #0x8]
    ldr r0, [r4, #0x70]
    add r1, r1, r0
    str r1, [r7, #0x8]
    ldr r0, [r4, #0x3c]
    cmp r1, r0
    strlt r0, [r7, #0x8]
    b .L_02211928
.L_022118b4:
    ldr r1, [r7, #0x8]
    ldr r0, [r4, #0x70]
    sub r1, r1, r0
    str r1, [r7, #0x8]
    ldr r0, [r4, #0x3c]
    cmp r1, r0
    strgt r0, [r7, #0x8]
    b .L_02211928
.L_022118d4:
    ldr r1, [r7, #0x4]
    ldr r0, [r4, #0x70]
    sub r1, r1, r0
    str r1, [r7, #0x4]
    ldr r0, [r4, #0x38]
    cmp r1, r0
    strgt r0, [r7, #0x4]
    b .L_02211928
.L_022118f4:
    ldr r1, [r7, #0x4]
    ldr r0, [r4, #0x70]
    add r1, r1, r0
    str r1, [r7, #0x4]
    ldr r0, [r4, #0x38]
    cmp r1, r0
    strlt r0, [r7, #0x4]
    b .L_02211928
.L_02211914:
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r4, #0x70]
    sub r0, r1, r0
    str r0, [r4, #0x70]
.L_02211928:
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_02211970
    ldr r1, [r7, #0xc]
    ldr r0, [r4, #0x70]
    add r1, r1, r0
    str r1, [r7, #0xc]
    ldr r0, [r4, #0x40]
    cmp r1, r0
    bge .L_02211a1c
    str r0, [r7, #0xc]
    ldr r0, [r4, #0x8]
    cmp r0, #0x5
    moveq r0, #0x6
    streq r0, [r4, #0x8]
    moveq r0, #0x0
    streqh r0, [r4, #0x56]
    b .L_02211a1c
.L_02211970:
    ldr r0, [r4, #0x8]
    cmp r0, #0x3
    beq .L_02211a1c
    ldr r1, [r7, #0xc]
    ldr r0, [r4, #0x70]
    add r1, r1, r0
    str r1, [r7, #0xc]
    ldr r0, [r4, #0x40]
    cmp r1, r0
    bge .L_022119b4
    str r0, [r7, #0xc]
    ldr r0, [r4, #0x8]
    cmp r0, #0x5
    moveq r0, #0x6
    streq r0, [r4, #0x8]
    moveq r0, #0x0
    streqh r0, [r4, #0x56]
.L_022119b4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x3
    ble .L_02211a1c
    ldr lr, [r7, #0x8]
    ldr r1, .L_02211ac8
    ldr r5, [r4, #0x2c]
    umull r0, r8, lr, r1
    mov r3, #0x0
    rsb r2, r1, #0x1000
    umull ip, r6, r5, r2
    adds r0, r0, #0x800
    mla r8, lr, r3, r8
    mov lr, lr, asr #0x1f
    mla r8, lr, r1, r8
    adc r8, r8, #0x0
    adds r1, ip, #0x800
    mov ip, r0, lsr #0xc
    mla r6, r5, r3, r6
    mov r0, r5, asr #0x1f
    mla r6, r0, r2, r6
    adc r0, r6, #0x0
    mov r1, r1, lsr #0xc
    orr ip, ip, r8, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, ip, r1
    str r0, [r7, #0x8]
.L_02211a1c:
    ldr r0, .L_02211ab4
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x64]
    ldmib r7, {r1, r2, r3}
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r0, [r4, #0x8]
    cmp r0, #0x5
    blt .L_02211a9c
    ldr r0, [r4, #0x6c]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne .L_02211a9c
    mov r1, #0x4
    str r1, [sp, #0x0]
    ldr r3, [r4, #0x30]
    ldmib r7, {r1, r2}
    bl GraphicsSpriteState_SetWorldPosition
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x6c]
    ldrh r1, [r1, #0x28]
    add r1, r1, #0x1
    strh r1, [r0, #0x28]
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x6c]
    ldrb r1, [r1, #0x3a]
    strb r1, [r0, #0x3a]
.L_02211a9c:
    mov r0, #0x0
.L_02211aa0:
    add sp, sp, #0x4c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02211aa8: .word gSceneManager
.L_02211aac: .word gSystemState
.L_02211ab0: .word gSoundContext
.L_02211ab4: .word data_021052fc
.L_02211ab8: .word data_ov062_02211c40
.L_02211abc: .word gHeapContext
.L_02211ac0: .word 0xe66
.L_02211ac4: .word 0x19a
.L_02211ac8: .word 0xee1
.size func_ov062_02211388, . - func_ov062_02211388
