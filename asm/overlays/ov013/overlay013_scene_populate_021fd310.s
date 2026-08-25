    .text
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e14
    .extern data_020f4e18
    .extern gGamePhaseRuntime
    .extern data_ov013_021febb4
    .extern data_ov013_021fec18
    .extern GamePhaseMetadata_IsAreaBehaviorPermitted
    .extern GraphicsBgMapResource_SetPaletteBank
    .extern func_02072048
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern TitleDisplay_ConfigureMain2dEngine
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern PresentationScalar_SetImmediate
    .extern PresentationScalar_TransitionTo
    .extern SpritePresentation_Hide
    .extern func_020957f0
    .extern func_02095820
    .extern func_020958d8
    .extern func_02095940
    .extern func_02095988
    .extern func_020b44e8
    .extern func_ov013_021fda28
    .extern func_ov013_021fdb50
    .extern gDebugFont
    .extern gGameWork

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_scene_populate.c. */
    .global func_ov013_021fd310

func_ov013_021fd310:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    ldr r1, L_021fd9f4
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x394
    bl GameWork_SetFlag
    ldr r0, L_021fd9f4
    ldr r1, L_021fd9f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r11, L_021fd9f4
    mov r9, #0x0
    add r7, r4, #0x8c
    mvn r5, #0xff
L_021fd34c:
    mov r0, #0x18
    mul r8, r9, r0
    ldr r0, L_021fd9fc
    add r1, r4, #0x54
    add r10, r0, r8
    mov r0, #0xac
    mul r6, r9, r0
    ldr r0, [r4, #0x84]
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x8
    str r1, [sp, #0x0]
    ldr r1, L_021fd9fc
    mov r3, #0x3
    ldr r2, [r1, r8]
    mov r1, r0
    add r0, r7, r6
    bl func_020957f0
    ldr r0, [r10, #0x8]
    ldr r8, [r10, #0xc]
    str r0, [sp, #0xc]
    ldr r1, [sp, #0xc]
    add r0, r7, r6
    mov r2, r8
    bl func_02095820
    ldr r0, [r4, #0x84]
    add r1, r4, #0x54
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r4, r9, lsl #0x2
    str r0, [r1, #0x950]
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0x7
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x950]
    ldr r2, [sp, #0xc]
    ldr r1, [r10, #0x4]
    mov r3, r8
    bl GraphicsSpriteState_ApplyRenderConfig
    ldrh r1, [r10, #0x14]
    ldr r0, [r11, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd48c
    mov r0, #0x1
    str r0, [r4, #0x974]
    mov r0, #0xac
    mul r1, r9, r0
    add r0, r4, r1
    add r10, r7, r1
    ldr r1, [r0, #0x128]
    add r2, r0, #0x100
    mov r0, #0x6
    strh r0, [r1, #0x28]
    ldrh r3, [r2, #0x24]
    add r0, r10, #0x1c
    mov r1, #0xe0000
    orr r3, r3, #0x1
    strh r3, [r2, #0x24]
    bl PresentationScalar_SetImmediate
    mov r2, r8, lsl #0xc
    add r0, r10, #0x1c
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r0, r10
    mov r1, #0x78
    bl func_ov013_021fda28
    cmp r9, #0x4
    cmpne r9, #0x5
    cmpne r9, #0x6
    ldreq r1, [r4, #0x84]
    moveq r0, #0x0
    streq r5, [r1, #0x18]
    streq r0, [r1, #0x1c]
    ldr r0, [r4, #0x948]
    bl SpritePresentation_Hide
    b L_021fd54c
L_021fd48c:
    ldr r0, [r11, #0x0]
    ldrh r1, [r10, #0x10]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd4dc
    ldrh r1, [r10, #0x12]
    ldr r0, [r11, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd4c4
    mov r0, r4
    mov r1, r9
    bl func_ov013_021fdb50
    b L_021fd54c
L_021fd4c4:
    add r0, r4, r9, lsl #0x2
    ldr r1, [r0, #0x950]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b L_021fd54c
L_021fd4dc:
    cmp r9, #0x1
    bne L_021fd544
    ldr r0, L_021fda00
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne L_021fd544
    ldrh r1, [r10, #0x12]
    ldr r0, [r11, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd52c
    mov r0, r4
    mov r1, r9
    bl func_ov013_021fdb50
    b L_021fd54c
L_021fd52c:
    add r0, r4, r9, lsl #0x2
    ldr r1, [r0, #0x950]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b L_021fd54c
L_021fd544:
    add r0, r7, r6
    bl func_02095940
L_021fd54c:
    add r0, r7, r6
    bl func_020958d8
    add r9, r9, #0x1
    cmp r9, #0x7
    blt L_021fd34c
    ldr r0, [r4, #0x97c]
    cmp r0, #0x0
    beq L_021fd594
    mov r0, r4
    mov r1, #0x3
    bl func_ov013_021fdb50
    add r0, r4, #0x138
    mov r1, #0x7
    bl func_02095988
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    b L_021fd5cc
L_021fd594:
    ldr r0, L_021fda00
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xe
    movs r0, r0, asr #0x1f
    bne L_021fd5cc
    mov r0, r4
    mov r1, #0x3
    bl func_ov013_021fdb50
    mov r0, r4
    mov r1, #0x1
    bl func_ov013_021fdb50
L_021fd5cc:
    ldr r0, L_021fda00
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    bl GamePhaseMetadata_IsAreaBehaviorPermitted
    cmp r0, #0x0
    bne L_021fd5f4
    mov r0, r4
    mov r1, #0x1
    bl func_ov013_021fdb50
L_021fd5f4:
    ldr r0, L_021fda00
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd640
    mov r0, r4
    mov r1, #0x0
    bl func_ov013_021fdb50
    mov r0, r4
    mov r1, #0x3
    bl func_ov013_021fdb50
    mov r0, r4
    mov r1, #0x1
    bl func_ov013_021fdb50
L_021fd640:
    ldr r0, L_021fd9f4
    ldr r1, L_021fda04
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd758
    ldr r0, [r4, #0x84]
    add r1, r4, #0x6c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r5, #0x8
    add r2, r4, #0x9c
    mov r1, r0
    add r0, r2, #0x800
    mov r2, #0x0
    mov r3, #0x3
    str r5, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0x9c
    add r0, r0, #0x800
    mov r1, #0x80
    mov r2, #0x92
    bl func_02095820
    ldr r0, L_021fd9f4
    ldr r1, L_021fda08
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd714
    mov r0, #0x1
    str r0, [r4, #0x974]
    ldr r0, [r4, #0x938]
    mov r1, #0x6
    strh r1, [r0, #0x28]
    add r2, r4, #0x900
    ldrh r1, [r2, #0x34]
    add r0, r4, #0xb8
    add r0, r0, #0x800
    orr r3, r1, #0x1
    mov r1, #0xe0000
    strh r3, [r2, #0x34]
    bl PresentationScalar_SetImmediate
    add r0, r4, #0xb8
    add r0, r0, #0x800
    mov r1, #0x2
    mov r2, #0x92000
    bl PresentationScalar_TransitionTo
    mov r0, #0x78
    str r0, [r4, #0x918]
    mov r0, #0x0
    str r0, [r4, #0x91c]
    ldr r0, [r4, #0x948]
    bl SpritePresentation_Hide
L_021fd714:
    ldr r0, [r4, #0x84]
    add r1, r4, #0x6c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x94c]
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x94c]
    mov r1, #0x2
    mov r2, #0x80
    mov r3, #0xb2
    bl GraphicsSpriteState_ApplyRenderConfig
    b L_021fd8f4
L_021fd758:
    ldr r11, L_021fda0c
    ldr r5, L_021fd9f4
    mov r10, #0x0
    add r7, r4, #0x540
L_021fd768:
    mov r0, #0x14
    mul r0, r10, r0
    add r8, r11, r0
    ldr r9, [r11, r0]
    mov r0, #0xac
    mul r6, r10, r0
    ldr r0, [r4, #0x84]
    add r1, r4, #0x60
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x8
    str r1, [sp, #0x0]
    mov r1, r0
    add r0, r7, r6
    mov r2, r9
    mov r3, #0x3
    bl func_020957f0
    ldr r1, [r8, #0x8]
    add r0, r7, r6
    mov r2, #0x9c
    bl func_02095820
    ldrh r1, [r8, #0x10]
    cmp r1, #0x0
    beq L_021fd840
    ldr r0, [r5, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd840
    mov r0, #0x1
    str r0, [r4, #0x974]
    mov r0, #0xac
    mul r1, r10, r0
    add r0, r4, r1
    add r6, r7, r1
    ldr r1, [r0, #0x5dc]
    add r2, r0, #0x500
    mov r0, #0x6
    strh r0, [r1, #0x28]
    ldrh r3, [r2, #0xd8]
    add r0, r6, #0x1c
    mov r1, #0xe0000
    orr r3, r3, #0x1
    strh r3, [r2, #0xd8]
    bl PresentationScalar_SetImmediate
    add r0, r6, #0x1c
    mov r1, #0x2
    mov r2, #0x9c000
    bl PresentationScalar_TransitionTo
    mov r0, r6
    mov r1, #0x78
    bl func_ov013_021fda28
    ldr r0, [r4, #0x948]
    bl SpritePresentation_Hide
    b L_021fd8a8
L_021fd840:
    ldrh r1, [r8, #0xc]
    cmp r1, #0x0
    beq L_021fd8a0
    ldr r0, [r5, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd8a0
    ldrh r1, [r8, #0xe]
    cmp r1, #0x0
    beq L_021fd8a8
    ldr r0, [r5, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fd8a8
    add r0, r7, r6
    add r1, r9, #0x2
    bl func_02095988
    mov r0, #0xac
    mla r0, r10, r0, r4
    add r0, r0, #0x500
    ldrh r1, [r0, #0xd8]
    orr r1, r1, #0x2
    strh r1, [r0, #0xd8]
    b L_021fd8a8
L_021fd8a0:
    add r0, r7, r6
    bl func_02095940
L_021fd8a8:
    add r10, r10, #0x1
    cmp r10, #0x5
    blt L_021fd768
    ldr r0, [r4, #0x84]
    add r1, r4, #0x60
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x94c]
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x94c]
    mov r1, #0xf
    mov r2, #0x80
    mov r3, #0xb2
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fd8f4:
    ldr r0, L_021fda10
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x97c]
    cmp r0, #0x0
    bne L_021fd918
    ldr r0, L_021fda14
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
L_021fd918:
    mov r1, #0x18
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr r1, L_021fda18
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    add r0, sp, #0x10
    bl GraphicsResourceSet_Init
    ldr r1, L_021fda1c
    mov r2, #0xb000
    str r1, [sp, #0x0]
    ldr r1, L_021fda20
    add r0, sp, #0x10
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x10
    mov r1, #0x3
    mov r2, #0x0
    bl func_02072048
    ldr r1, L_021fda24
    mov r2, #0x8000
    str r1, [sp, #0x0]
    ldr r1, L_021fda20
    add r0, sp, #0x10
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x18]
    mov r1, #0x8
    bl GraphicsBgMapResource_SetPaletteBank
    bl func_020b44e8
    add r0, sp, #0x10
    mov r1, #0x1
    mov r2, #0x100
    bl func_02072048
    add r0, sp, #0x10
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd9f4: .word gGameWork
L_021fd9f8: .word 0x39b
L_021fd9fc: .word data_ov013_021fec18
L_021fda00: .word gGamePhaseRuntime
L_021fda04: .word 0x889
L_021fda08: .word 0x3de
L_021fda0c: .word data_ov013_021febb4
L_021fda10: .word data_020f4e14
L_021fda14: .word gDebugFont
L_021fda18: .word 0x400000a
L_021fda1c: .word 0xb002
L_021fda20: .word data_020f4e18
L_021fda24: .word 0x8002
    .size func_ov013_021fd310, . - func_ov013_021fd310
