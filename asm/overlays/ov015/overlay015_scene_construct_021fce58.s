    .text
    .extern Heap_Alloc
    .extern __construct_array
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_021e9ac0
    .extern data_ov015_021fec48
    .extern data_ov015_021fec74
    .extern data_ov015_021fec88
    .extern data_ov015_021fec90
    .extern Sound_LoadGroup
    .extern ActorDescriptor_GetPanelImage
    .extern InventoryRecord_IsEmptyKind1Subtype1
    .extern InventoryRecord_GetMetadata
    .extern InventoryRecordCollection_SortAlternate
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern SceneInputBase_Init
    .extern TitleScreenResourceCollection_Init
    .extern TitleScreenResourceCollection_Append
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern SpriteMotionController_Init
    .extern SpriteMotionController_BindSprite
    .extern func_020afd0c
    .extern func_ov001_021fb6f8
    .extern Overlay001_Grid_Init
    .extern func_ov001_021fc7c0
    .extern func_ov001_021fca38
    .extern Overlay001_GetViewRecordFromIndex
    .extern Overlay015_ClearValueTriple
    .extern func_ov015_021fce14
    .extern func_ov015_021fce18
    .extern func_ov015_021fce30
    .extern Overlay015_CopyValueTriple
    .extern Overlay015_SetupGraphics
    .extern func_ov015_021fd8a8
    .extern Overlay015_LayoutRecords
    .extern Overlay015_StopRecords
    .extern gDebugFont
    .extern gHeapContext
    .extern gSoundContext

/* Exact fallback; see src/overlays/ov015/overlay015_scene_lifecycle.c. */
    .global Overlay015_Scene_Init

Overlay015_Scene_Init:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r5, r1
    mov r4, r2
    bl SceneInputBase_Init
    ldr r1, L_021fd1e8
    add r0, r10, #0x58
    str r1, [r10, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x64
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x74
    bl TitleCharacterResourceCollection_Init
    add r0, r10, #0x98
    bl TitleScreenResourceCollection_Init
    add r0, r10, #0xe0
    bl Overlay015_ClearValueTriple
    ldr r1, L_021fd1ec
    add r0, r10, #0xfc
    str r1, [sp, #0x0]
    mov r1, #0x3
    mov r2, #0xac
    ldr r3, L_021fd1f0
    bl __construct_array
    str r4, [r10, #0xec]
    mov r0, r10
    bl Overlay015_SetupGraphics
    add r0, r10, #0x98
    ldr r1, L_021fd1f4
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x98
    ldr r1, L_021fd1f8
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x98
    ldr r1, L_021fd1fc
    bl TitleScreenResourceCollection_Append
    add r0, r10, #0x74
    ldr r1, L_021fd200
    bl TitleCharacterResourceCollection_Append
    add r0, r10, #0x74
    ldr r1, L_021fd204
    bl TitleCharacterResourceCollection_Append
    add r0, r10, #0x74
    mov r1, #0x7000
    bl TitleCharacterResourceCollection_Append
    mov r0, #0x48
    ldr r1, L_021fd208
    mov r2, #0x4
    ldr r3, L_021fd20c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf38
    ldr r1, L_021fd210
    ldr r1, [r1, #0x0]
    bl func_ov001_021fb6f8
L_021fcf38:
    str r0, [r10, #0xf4]
    mov r0, #0x0
    str r0, [r10, #0xf8]
    cmp r5, #0x0
    beq L_021fcf58
    mov r1, r5
    add r0, r10, #0xe0
    bl Overlay015_CopyValueTriple
L_021fcf58:
    ldr r0, L_021fd214
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x34
    bl InventoryRecordCollection_SortAlternate
    ldr r1, L_021fd218
    ldr r3, L_021fd20c
    mov r0, #0x210
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf94
    ldr r1, L_021fd21c
    ldr r1, [r1, #0x0]
    bl Overlay001_Grid_Init
L_021fcf94:
    str r0, [r10, #0xdc]
    ldr r0, [r10, #0xec]
    cmp r0, #0x0
    beq L_021fd090
    ldr r0, L_021fd220
    mov r1, #0x82
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    mvn r6, #0x0
    mov r11, #0x1
    mov r7, r6
    mov r8, #0x0
    mov r4, r11
    b L_021fd064
L_021fcfcc:
    mov r1, r8
    bl func_ov001_021fc7c0
    mov r5, r0
    ldr r9, [r5, #0xc]
    cmp r9, #0x0
    beq L_021fd060
    mov r0, r9
    bl InventoryRecord_GetMetadata
    ldrb r0, [r0, #0x2]
    cmp r0, #0x1
    beq L_021fd008
    mov r0, r5
    mov r1, r4
    bl func_ov015_021fce18
    b L_021fd060
L_021fd008:
    mov r0, r9
    bl InventoryRecord_IsEmptyKind1Subtype1
    cmp r0, #0x0
    beq L_021fd038
    cmp r6, #0x0
    bge L_021fd060
    ldr r0, [r10, #0xdc]
    mov r2, r8
    add r1, r10, #0xe0
    mov r6, r8
    bl Overlay001_GetViewRecordFromIndex
    b L_021fd060
L_021fd038:
    mov r0, r9
    bl ActorDescriptor_GetPanelImage
    cmp r0, #0x1
    bne L_021fd058
    mov r0, r5
    mov r1, r11
    bl func_ov015_021fce18
    b L_021fd060
L_021fd058:
    cmp r7, #0x0
    movlt r7, r8
L_021fd060:
    add r8, r8, #0x1
L_021fd064:
    ldr r0, [r10, #0xdc]
    ldr r1, [r0, #0x1a4]
    cmp r8, r1
    blt L_021fcfcc
    cmp r6, #0x0
    bge L_021fd090
    cmp r7, #0x0
    blt L_021fd090
    mov r2, r7
    add r1, r10, #0xe0
    bl Overlay001_GetViewRecordFromIndex
L_021fd090:
    ldr r0, [r10, #0xdc]
    add r1, r10, #0xe0
    mov r2, #0x0
    bl func_ov001_021fca38
    mov r1, #0x2
    ldr r0, L_021fd224
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x58
    mov r2, #0x0
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    mov r1, #0x48
    ldr r0, L_021fd224
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x64
    mov r2, #0x47
    mov r3, #0x45
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fd21c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    mov r9, #0x0
    str r0, [r10, #0x54]
    add r6, r10, #0xfc
    mov r8, #0x1
    mov r7, r9
    mov r5, #0x2
    mov r4, #0xac
L_021fd108:
    ldr r0, [r10, #0x54]
    mov r2, r8
    add r1, r10, #0x58
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mla r0, r9, r4, r6
    mov r2, r7
    str r7, [sp, #0x0]
    mov r3, r5
    bl SpriteMotionController_BindSprite
    add r9, r9, #0x1
    cmp r9, #0x3
    blt L_021fd108
    mov r1, #0x0
    mov r0, r10
    str r1, [r10, #0x300]
    bl Overlay015_StopRecords
    mov r0, r10
    mov r1, #0x0
    bl func_ov015_021fd8a8
    mov r0, r10
    bl Overlay015_LayoutRecords
    mov r0, r10
    bl Overlay015_StopRecords
    ldr r0, [r10, #0x54]
    add r1, r10, #0x64
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x70]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x70]
    mov r2, #0x9c
    mov r3, #0xe
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, L_021fd228
    mov r1, #0x0
    mov r2, #0x4
    mov r3, r2
    bl func_020afd0c
    ldr r1, [r10, #0x20]
    mov r0, r10
    orr r1, r1, #0x400
    str r1, [r10, #0x20]
    ldr r1, L_021fd22c
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd1e8: .word data_ov015_021fec74
L_021fd1ec: .word func_ov015_021fce14
L_021fd1f0: .word SpriteMotionController_Init
L_021fd1f4: .word 0x8010
L_021fd1f8: .word 0x8011
L_021fd1fc: .word 0x800b
L_021fd200: .word 0x7001
L_021fd204: .word 0x7005
L_021fd208: .word data_ov015_021fec88
L_021fd20c: .word gHeapContext
L_021fd210: .word gDebugFont
L_021fd214: .word data_021e9ac0
L_021fd218: .word data_ov015_021fec90
L_021fd21c: .word data_020f4e14
L_021fd220: .word gSoundContext
L_021fd224: .word data_020f4e18
L_021fd228: .word 0x4000050
L_021fd22c: .word data_ov015_021fec48
    .size Overlay015_Scene_Init, . - Overlay015_Scene_Init
