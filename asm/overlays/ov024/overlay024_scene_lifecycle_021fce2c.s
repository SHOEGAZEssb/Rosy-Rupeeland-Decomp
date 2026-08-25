.text

/* Exact fallback; see src/overlays/ov024/overlay024_scene_lifecycle.c. */
.extern __construct_array
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov024_021fe2e8
.extern data_ov024_021fe338
.extern data_ov024_021fe34c
.extern data_ov024_021fe354
.extern data_ov024_021fe35c
.extern AreaInfoPanelPresentation_Init
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern TitleInterpolatedValue_Init
.extern func_02091b98
.extern SceneInputBase_Init
.extern SceneSound_PlayDirectSequence
.extern IndexedSelectionController_Init
.extern IndexedSelectionController_ConfigureRange
.extern SpriteMotionController_Init
.extern SpriteMotionController_BindSprite
.extern SpriteMotionController_SetPosition
.extern SpriteMotionController_Hide
.extern Overlay005_ScenePopulation_Init
.extern Overlay005_SetSceneSelection
.extern func_ov024_021fce00
.extern func_ov024_021fce04
.extern func_ov024_021fd2f8
.extern func_ov046_0220b7bc
.extern func_ov046_0220bffc
.extern func_ov046_0220c478
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov024_021fce2c
func_ov024_021fce2c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, L_021fd108
    add r0, r4, #0x64
    str r1, [r4, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x70
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x80
    bl SpriteMotionController_Init
    ldr r1, L_021fd10c
    ldr r3, L_021fd110
    str r1, [sp, #0x0]
    add r0, r4, #0x12c
    mov r1, #0x2
    mov r2, #0xac
    bl __construct_array
    add r0, r4, #0x284
    bl IndexedSelectionController_Init
    add r0, r4, #0x2c8
    bl TitleInterpolatedValue_Init
    mov r0, #0x0
    str r0, [r4, #0x2e8]
    ldr r1, L_021fd114
    str r0, [r4, #0x54]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    str r0, [r4, #0x58]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xce]
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x58]
    cmp r0, #0xb
    movge r0, #0xa
    strge r0, [r4, #0x58]
    ldr r0, [r4, #0x5c]
    cmp r0, #0xb
    movge r0, #0xa
    strge r0, [r4, #0x5c]
    ldr r1, [r4, #0x5c]
    mov r0, r4
    str r1, [r4, #0x60]
    bl func_ov024_021fd2f8
    mov r1, #0x39
    ldr r0, L_021fd118
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x64
    mov r2, #0x38
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    mov r1, #0x4
    ldr r0, L_021fd118
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x70
    mov r2, #0x3
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fd11c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r4, #0x64
    mov r2, #0x1
    str r0, [r4, #0x7c]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0x80
    mov r2, #0x6
    str r3, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x80
    mov r1, #0xea
    mov r2, #0xaf
    bl SpriteMotionController_SetPosition
    ldr r0, [r4, #0x7c]
    add r1, r4, #0x70
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0x12c
    mov r2, #0xa
    str r3, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    mov r1, #0x10
    add r0, r4, #0x12c
    mov r2, r1
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x12c
    bl SpriteMotionController_Hide
    ldr r0, [r4, #0x7c]
    add r1, r4, #0x70
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0x1d8
    mov r2, #0xc
    str r3, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x1d8
    mov r1, #0x10
    mov r2, #0xb0
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x1d8
    bl SpriteMotionController_Hide
    ldr r1, L_021fd120
    ldr r3, L_021fd124
    mov r0, #0x15c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd018
    ldr r1, L_021fd11c
    mov r2, #0x1
    ldr r1, [r1, #0x0]
    bl Overlay005_ScenePopulation_Init
L_021fd018:
    str r0, [r4, #0x2bc]
    mov r1, #0x0
    ldr r2, [r4, #0x60]
    mov r3, r1
    add r0, r4, #0x284
    bl IndexedSelectionController_ConfigureRange
    mov r0, #0xc
    str r0, [r4, #0x2b0]
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x290]
    bl Overlay005_SetSceneSelection
    ldr r1, L_021fd128
    ldr r3, L_021fd124
    mov r0, #0x118
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd070
    ldr r1, L_021fd12c
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov046_0220b7bc
L_021fd070:
    str r0, [r4, #0x2c0]
    mov r0, r4
    mov r1, #0x3e
    bl SceneSound_PlayDirectSequence
    mov r2, #0x0
    ldr r0, [r4, #0x2c0]
    ldr r1, [r4, #0x290]
    mov r3, r2
    bl func_ov046_0220bffc
    ldr r0, [r4, #0x2c0]
    ldr r1, [r4, #0x290]
    bl func_ov046_0220c478
    mov r0, #0x3c
    ldr r1, L_021fd130
    mov r2, #0x4
    ldr r3, L_021fd124
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd0c8
    ldr r1, L_021fd12c
    ldr r1, [r1, #0x0]
    bl AreaInfoPanelPresentation_Init
L_021fd0c8:
    str r0, [r4, #0x2c4]
    add r0, r4, #0x2c8
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r4, #0x2e4]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fd134
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd108: .word data_ov024_021fe338
L_021fd10c: .word func_ov024_021fce00
L_021fd110: .word SpriteMotionController_Init
L_021fd114: .word gGameWork
L_021fd118: .word data_020f4e18
L_021fd11c: .word data_020f4e14
L_021fd120: .word data_ov024_021fe34c
L_021fd124: .word gHeapContext
L_021fd128: .word data_ov024_021fe354
L_021fd12c: .word gDebugFont
L_021fd130: .word data_ov024_021fe35c
L_021fd134: .word data_ov024_021fe2e8
.size func_ov024_021fce2c, .-func_ov024_021fce2c

