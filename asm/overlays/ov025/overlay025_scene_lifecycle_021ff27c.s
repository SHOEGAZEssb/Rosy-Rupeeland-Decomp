.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_lifecycle.c. */
.extern __construct_array
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov025_02202c9c
.extern data_ov025_02202cb4
.extern data_ov025_02202cf0
.extern data_ov025_02202d68
.extern data_ov025_02202ea8
.extern data_ov025_02203370
.extern data_ov025_02203384
.extern data_ov025_0220338c
.extern data_ov025_02203394
.extern data_ov025_0220339c
.extern data_ov025_022033a4
.extern Sound_LoadGroup
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern TitleInterpolatedValue_Init
.extern SceneInputBase_Init
.extern TitleScreenResourceCollection_Init
.extern TitleScreenResourceCollection_Append
.extern TitleCharacterResourceCollection_Init
.extern TitleCharacterResourceCollection_Append
.extern TitleScrollValue_Init
.extern TitleDialog_Init
.extern TitleDialog_SetExternalTextRow
.extern Presentation_SetScript
.extern PresentationList_Append
.extern SpritePresentation_Init
.extern SpriteMotionController_Init
.extern SpriteMotionController_BindSprite
.extern SpriteMotionController_SetPosition
.extern SpriteMotionController_Hide
.extern func_ov025_021fdecc
.extern func_ov025_021ff1c8
.extern func_ov025_021ff1dc
.extern func_ov025_021ff21c
.extern func_ov025_021ff23c
.extern func_ov025_021ff254
.extern func_ov025_021ffdfc
.extern func_ov025_02200014
.extern func_ov094_02219568
.extern GameWork_ClearFlag
.extern gDebugFont
.extern genrand_int32
.extern gGameWork
.extern gHeapContext
.extern gSoundContext
.extern Heap_Alloc


    .global func_ov025_021ff27c
func_ov025_021ff27c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    mov r10, r0
    bl SceneInputBase_Init
    ldr r1, L_021ff9dc
    add r0, r10, #0x5c
    str r1, [r10, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x68
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x74
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x80
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x8c
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x98
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0xa4
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0xf0
    bl SpriteMotionController_Init
    add r0, r10, #0x19c
    bl SpriteMotionController_Init
    add r0, r10, #0x248
    bl SpriteMotionController_Init
    ldr r1, L_021ff9e0
    add r0, r10, #0x2f4
    str r1, [sp, #0x0]
    mov r1, #0x3
    mov r2, #0xac
    ldr r3, L_021ff9e4
    bl __construct_array
    add r0, r10, #0xf8
    add r0, r0, #0x400
    bl func_ov025_021ff1dc
    add r0, r10, #0x530
    bl TitleScreenResourceCollection_Init
    add r0, r10, #0x174
    add r0, r0, #0x400
    bl TitleCharacterResourceCollection_Init
    add r0, r10, #0x5a0
    bl TitleScrollValue_Init
    add r0, r10, #0x1c4
    add r0, r0, #0x400
    bl TitleInterpolatedValue_Init
    add r0, r10, #0x5e0
    bl TitleInterpolatedValue_Init
    add r0, r10, #0x1fc
    add r0, r0, #0x400
    bl TitleInterpolatedValue_Init
    add r0, r10, #0x218
    add r0, r0, #0x400
    bl TitleInterpolatedValue_Init
    mov r0, #0x0
    str r0, [r10, #0x634]
    bl genrand_int32
    str r0, [r10, #0x634]
    mov r1, #0x0
    str r1, [r10, #0x598]
    sub r0, r1, #0x1
    str r0, [r10, #0x54]
    str r1, [r10, #0x5b8]
    str r1, [r10, #0x5bc]
    ldr r0, L_021ff9e8
    str r1, [r10, #0x638]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021ff9ec
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, L_021ff9f0
    add r0, r10, #0x530
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021ff9f4
    add r0, r10, #0x530
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x530
    ldr r1, L_021ff9f8
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x530
    ldr r1, L_021ff9fc
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x530
    ldr r1, L_021ffa00
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x530
    ldr r1, L_021ffa04
    bl TitleScreenResourceCollection_Append
    mov r0, r10
    bl func_ov025_021ffdfc
    mov r0, r10
    bl func_ov025_02200014
    add r0, r10, #0x174
    add r0, r0, #0x400
    ldr r1, L_021ffa08
    bl TitleCharacterResourceCollection_Append
    add r0, r10, #0x174
    add r0, r0, #0x400
    ldr r1, L_021ffa0c
    bl TitleCharacterResourceCollection_Append
    add r0, r10, #0x174
    add r0, r0, #0x400
    ldr r1, L_021ffa10
    bl TitleCharacterResourceCollection_Append
    mov r0, #0x51
    str r0, [sp, #0x0]
    add r0, r10, #0x5c
    ldr r1, L_021ffa14
    mov r2, #0x4f
    ldr r1, [r1, #0x0]
    mov r3, #0x50
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x54
    str r0, [sp, #0x0]
    add r0, r10, #0x68
    ldr r1, L_021ffa14
    mov r2, #0x52
    ldr r1, [r1, #0x0]
    mov r3, #0x53
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021ffa18
    add r0, r10, #0x98
    str r3, [sp, #0x0]
    ldr r1, L_021ffa14
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021ffa1c
    add r0, r10, #0x74
    str r3, [sp, #0x0]
    ldr r1, L_021ffa14
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021ffa20
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0x80
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021ffa24
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0x8c
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021ffa28
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0xa4
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021ff9e8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021ff9ec
    str r0, [r10, #0xb0]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    mov r2, #0x0
    str r0, [r10, #0xb4]
    str r2, [r0, #0x18]
    mov r1, #0x100
    str r1, [r0, #0x1c]
    mov r8, r2
L_021ff534:
    add r0, r10, r2, lsl #0x2
    add r2, r2, #0x1
    str r8, [r0, #0xe4]
    cmp r2, #0x3
    blt L_021ff534
    mov r7, #0x1
    add r5, r10, #0x2f4
    mov r6, #0x10
    mov r11, r7
    mov r4, #0xac
L_021ff55c:
    mul r9, r8, r4
    ldr r0, [r10, #0xb0]
    mov r2, r7
    add r1, r10, #0x5c
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, r8, lsl #0x1
    mov r1, r0
    add r0, r5, r9
    add r2, r2, #0x20
    mov r3, r11
    str r6, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r5, r9
    mov r1, #0xd4
    mov r2, #0x0
    bl SpriteMotionController_SetPosition
    add r0, r5, r9
    bl SpriteMotionController_Hide
    add r8, r8, #0x1
    cmp r8, #0x3
    blt L_021ff55c
    ldr r0, [r10, #0xb0]
    add r1, r10, #0x8c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0xbc]
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0xbc]
    mov r2, #0x80
    mov r3, #0x60
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r6, L_021ffa2c
    add r5, sp, #0x24
    add r4, sp, #0xc
    mov r8, r5
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldr r5, L_021ffa30
    mov r7, r4
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    stmia r4, {r0, r1}
    mov r11, #0x2
    mov r9, #0x0
    mov r6, #0x1
    mov r5, #0xf000
    mov r4, r11
L_021ff634:
    ldr r0, [r10, #0xb4]
    mov r2, r11
    add r1, r10, #0xa4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r2, r10, r9, lsl #0x2
    str r0, [r2, #0xc4]
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r1, [r7, r9, lsl #0x2]
    ldr r0, [r2, #0xc4]
    sub r3, r1, #0x100
    mov r1, r9
    ldr r2, [r8, r9, lsl #0x2]
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x6
    blt L_021ff634
    ldr r0, [r10, #0xb4]
    add r1, r10, #0x98
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x80
    str r0, [r10, #0xc0]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0xc0]
    sub r3, r2, #0x120
    mov r1, #0x8
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0xb0]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x10
    str r0, [sp, #0x0]
    add r0, r10, #0xf0
    mov r2, #0x2c
    mov r3, #0x1
    bl SpriteMotionController_BindSprite
    add r0, r10, #0xf0
    mov r1, #0x94
    mov r2, #0xb3
    bl SpriteMotionController_SetPosition
    add r0, r10, #0xf0
    bl SpriteMotionController_Hide
    ldr r0, [r10, #0xb0]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x10
    str r0, [sp, #0x0]
    add r0, r10, #0x19c
    mov r2, #0x26
    mov r3, #0x1
    bl SpriteMotionController_BindSprite
    add r0, r10, #0x19c
    mov r1, #0xe4
    mov r2, #0xa0
    bl SpriteMotionController_SetPosition
    add r0, r10, #0x19c
    bl SpriteMotionController_Hide
    ldr r0, [r10, #0xb0]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x10
    str r0, [sp, #0x0]
    add r0, r10, #0x248
    mov r2, #0x32
    mov r3, #0x1
    bl SpriteMotionController_BindSprite
    add r0, r10, #0x248
    mov r1, #0xe0
    mov r2, #0xb3
    bl SpriteMotionController_SetPosition
    add r0, r10, #0x248
    bl SpriteMotionController_Hide
    ldr r1, L_021ffa34
    ldr r3, L_021ffa38
    mov r0, #0xfc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff7a8
    bl func_ov025_021fdecc
L_021ff7a8:
    str r0, [r10, #0x508]
    add r0, r10, #0xf8
    ldr r1, [r10, #0x508]
    add r0, r0, #0x400
    bl PresentationList_Append
    ldr r0, [r10, #0xb4]
    add r1, r10, #0x74
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x0
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r4, #0x4000
    mov r2, r1
    mov r3, r1
    str r4, [sp, #0x4]
    mov r4, #0x2
    str r4, [sp, #0x8]
    mov r4, r0
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, #0xa0
    ldr r1, L_021ffa3c
    mov r2, #0x4
    ldr r3, L_021ffa38
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff81c
    mov r1, r4
    bl func_ov025_021ff21c
L_021ff81c:
    str r0, [r10, #0xdc]
    add r0, r10, #0xf8
    ldr r1, [r10, #0xdc]
    add r0, r0, #0x400
    bl PresentationList_Append
    ldr r0, [r10, #0xdc]
    ldr r1, L_021ffa40
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r10, #0xb4]
    add r1, r10, #0x80
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x4000
    str r1, [sp, #0x4]
    mov r1, #0x2
    str r1, [sp, #0x8]
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0xb0
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, #0xa0
    ldr r1, L_021ffa44
    mov r2, #0x4
    ldr r3, L_021ffa38
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff8a0
    mov r1, r4
    bl SpritePresentation_Init
L_021ff8a0:
    str r0, [r10, #0xe0]
    add r0, r10, #0xf8
    ldr r1, [r10, #0xe0]
    add r0, r0, #0x400
    bl PresentationList_Append
    ldr r0, [r10, #0xe0]
    ldr r1, L_021ffa48
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r1, L_021ffa4c
    ldr r3, L_021ffa38
    mov r0, #0x4c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff8ec
    mov r1, #0xd8
    mov r2, r1
    bl func_ov094_02219568
L_021ff8ec:
    ldr r1, L_021ffa50
    str r0, [r10, #0x5c0]
    ldr r3, L_021ffa38
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff91c
    ldr r1, L_021ff9ec
    ldr r2, [r10, #0x57c]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021ff91c:
    str r0, [r10, #0x50c]
    mov r0, #0x40
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x50c]
    mov r1, #0x10
    mov r2, #0x70
    mov r3, #0xe0
    bl func_ov025_021ff23c
    mov r3, #0x0
    ldr r1, [r10, #0x50c]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    str r3, [r1, #0xd4]
    ldr r0, [r10, #0x50c]
    sub r1, r3, #0x2
    str r3, [r0, #0xb4]
    ldr r0, [r10, #0x50c]
    add r2, r10, #0x510
    str r1, [r0, #0xbc]
    ldr r0, [r10, #0x50c]
    mov r1, #0x1
    str r3, [r0, #0xc0]
    ldr r0, [r10, #0x50c]
    bl TitleDialog_SetExternalTextRow
    mov r1, #0x0
    ldr r0, L_021ffa54
    str r1, [r10, #0x59c]
    ldr r0, [r0, #0x0]
    ldr r1, L_021ffa58
    bl GameWork_ClearFlag
    ldr r0, L_021ffa54
    ldr r1, L_021ffa5c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021ffa60
    ldr r1, L_021ffa64
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    ldr r1, [r10, #0x20]
    mov r0, r10
    orr r1, r1, #0x400
    str r1, [r10, #0x20]
    ldr r1, L_021ffa68
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    mov r0, r10
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ff9dc: .word data_ov025_02203370
L_021ff9e0: .word func_ov025_021ff1c8
L_021ff9e4: .word SpriteMotionController_Init
L_021ff9e8: .word data_020f4e14
L_021ff9ec: .word gDebugFont
L_021ff9f0: .word 0x8032
L_021ff9f4: .word 0x8033
L_021ff9f8: .word 0x8034
L_021ff9fc: .word 0x8035
L_021ffa00: .word 0x8036
L_021ffa04: .word 0x8037
L_021ffa08: .word 0x7001
L_021ffa0c: .word 0x7005
L_021ffa10: .word 0x7007
L_021ffa14: .word data_020f4e18
L_021ffa18: .word 0x1048
L_021ffa1c: .word 0x241d
L_021ffa20: .word 0x2423
L_021ffa24: .word 0x2429
L_021ffa28: .word 0x242f
L_021ffa2c: .word data_ov025_02202c9c
L_021ffa30: .word data_ov025_02202cb4
L_021ffa34: .word data_ov025_02203384
L_021ffa38: .word gHeapContext
L_021ffa3c: .word data_ov025_0220338c
L_021ffa40: .word data_ov025_02202d68
L_021ffa44: .word data_ov025_02203394
L_021ffa48: .word data_ov025_02202cf0
L_021ffa4c: .word data_ov025_0220339c
L_021ffa50: .word data_ov025_022033a4
L_021ffa54: .word gGameWork
L_021ffa58: .word 0x3d3
L_021ffa5c: .word 0x3d6
L_021ffa60: .word gSoundContext
L_021ffa64: .word 0x16f
L_021ffa68: .word data_ov025_02202ea8
.size func_ov025_021ff27c, .-func_ov025_021ff27c

