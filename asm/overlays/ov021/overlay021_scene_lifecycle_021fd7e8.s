    .text
/* Exact fallback; see src/overlays/ov021/overlay021_scene_lifecycle.c. */
    .extern __construct_array
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_021e9ac0
    .extern data_021f3ecc
    .extern data_ov021_02202e10
    .extern data_ov021_02202f64
    .extern data_ov021_02202f88
    .extern data_ov021_02202f90
    .extern OverlaySlot_Init
    .extern InventoryRecordCollection_Sort
    .extern InventoryRecordCollection_SortAlternate
    .extern GraphicsArchive_AcquirePaletteResource
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern LanguageLookupDatabase_GetResourceSize
    .extern LanguageLookupDatabase_GetResourceById
    .extern SceneInputBase_Init
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern TitleScrollValue_Init
    .extern TitleDialog_Init
    .extern TitleDialog_SetExternalTextRow
    .extern SpriteMotionController_Init
    .extern Overlay021_List_FindSpecialRow
    .extern Overlay021_Controller_DestroyNoOp
    .extern Overlay021_Snapshot_Init
    .extern Overlay021_Dialog_SetLayout
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupDisplay
    .extern Overlay021_LoadSubBackground
    .extern Overlay021_SetupMainBackground
    .extern Overlay021_CreateLists
    .extern Overlay021_SetupSceneSprites
    .extern func_ov045_0220b83c
    .extern func_ov045_0220c48c
    .extern gDebugFont
    .extern genrand_int32
    .extern gHeapContext
    .extern Heap_Alloc
    .extern MIi_CpuCopy16

.global Overlay021_Scene_Init
Overlay021_Scene_Init:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl SceneInputBase_Init
    ldr r1, L_021fdb38
    add r0, r5, #0x58
    str r1, [r5, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r5, #0x7c
    bl AnimationResourceState_InitEmbedded
    add r0, r5, #0x88
    bl AnimationResourceState_InitEmbedded
    add r0, r5, #0xa0
    bl SpriteMotionController_Init
    ldr r1, L_021fdb3c
    ldr r3, L_021fdb40
    str r1, [sp, #0x0]
    add r0, r5, #0x14c
    mov r1, #0x2
    mov r2, #0xac
    bl __construct_array
    mov r0, #0x0
    str r0, [r5, #0x2cc]
    add r0, r5, #0x35c
    bl Overlay021_Snapshot_Init
    add r0, r5, #0x368
    bl Overlay021_Snapshot_Init
    add r0, r5, #0x4
    add r0, r0, #0x400
    bl TitleScrollValue_Init
    add r0, r5, #0x1c
    add r0, r0, #0x400
    bl OverlaySlot_Init
    mov r2, #0x0
    str r2, [r5, #0x3d8]
    str r2, [r5, #0x3dc]
    str r2, [r5, #0x3e0]
    str r2, [r5, #0x3fc]
    str r2, [r5, #0x2c4]
    str r4, [r5, #0x54]
    str r2, [r5, #0x2c0]
    str r2, [r5, #0x354]
    str r2, [r5, #0x358]
    str r2, [r5, #0x390]
    str r2, [r5, #0x384]
    str r2, [r5, #0x2bc]
    str r2, [r5, #0x37c]
    str r2, [r5, #0x380]
    sub r0, r2, #0x1
    str r0, [r5, #0x374]
    str r0, [r5, #0x378]
    str r0, [r5, #0x2d0]
    str r0, [r5, #0x3e4]
    str r2, [r5, #0x3e8]
    mov r1, r2
L_021fd8c4:
    add r0, r5, r2, lsl #0x2
    str r1, [r0, #0x2ac]
    add r2, r2, #0x1
    str r1, [r0, #0x2b4]
    cmp r2, #0x2
    blt L_021fd8c4
    bl genrand_int32
    ldr r1, L_021fdb44
    str r0, [r5, #0x2cc]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    add r0, r0, #0x34
    bl InventoryRecordCollection_SortAlternate
    ldr r0, L_021fdb44
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl InventoryRecordCollection_Sort
    ldr r0, L_021fdb48
    ldr r1, L_021fdb4c
    bl LanguageLookupDatabase_GetResourceSize
    mov r4, r0
    ldr r0, L_021fdb48
    ldr r1, L_021fdb4c
    bl LanguageLookupDatabase_GetResourceById
    mov r2, r4
    add r1, r5, #0x2d4
    bl MIi_CpuCopy16
    ldr r0, L_021fdb48
    ldr r1, L_021fdb50
    bl LanguageLookupDatabase_GetResourceSize
    mov r4, r0
    ldr r0, L_021fdb48
    ldr r1, L_021fdb50
    bl LanguageLookupDatabase_GetResourceById
    mov r2, r4
    add r1, r5, #0x314
    bl MIi_CpuCopy16
    ldr r0, L_021fdb54
    ldr r1, L_021fdb58
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquirePaletteResource
    str r0, [r5, #0x400]
    add r0, r5, #0x58
    ldr r1, L_021fdb5c
    bl TitleCharacterResourceCollection_Append
    add r0, r5, #0x58
    ldr r1, L_021fdb60
    bl TitleCharacterResourceCollection_Append
    add r0, r5, #0x58
    ldr r1, L_021fdb64
    bl TitleCharacterResourceCollection_Append
    add r0, r5, #0x58
    mov r1, #0x7000
    bl TitleCharacterResourceCollection_Append
    mov r0, #0x3f
    str r0, [sp, #0x0]
    add r0, r5, #0x7c
    ldr r1, L_021fdb54
    mov r2, #0x3d
    ldr r1, [r1, #0x0]
    mov r3, #0x3e
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x46
    str r0, [sp, #0x0]
    add r0, r5, #0x88
    ldr r1, L_021fdb54
    mov r2, #0x44
    ldr r1, [r1, #0x0]
    mov r3, #0x45
    bl AnimationResourceState_ReplaceResources
    mov r1, #0x0
    ldr r0, [r5, #0x54]
    mov r2, r1
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    ldr r1, L_021fdb68
    str r0, [r5, #0x38c]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x94]
    mov r0, r5
    bl Overlay021_SetupDisplay
    mov r0, r5
    bl Overlay021_LoadSubBackground
    mov r0, r5
    bl Overlay021_SetupMainBackground
    mov r0, r5
    bl Overlay021_CreateLists
    mov r0, r5
    bl Overlay021_SetupSceneSprites
    ldr r0, [r5, #0x2a4]
    cmp r0, #0x0
    beq L_021fda3c
    bl Overlay021_List_FindSpecialRow
    str r0, [r5, #0x3e4]
L_021fda3c:
    mov r3, #0x0
    mov r2, r3
L_021fda44:
    add r0, r5, r3, lsl #0x1
    add r0, r0, #0x300
    strh r2, [r0, #0xb8]
    ldrh r1, [r0, #0xb8]
    add r3, r3, #0x1
    cmp r3, #0x10
    strh r1, [r0, #0x98]
    blt L_021fda44
    ldr r1, L_021fdb6c
    ldr r3, L_021fdb70
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fda90
    ldr r1, L_021fdb74
    ldr r2, [r5, #0x58]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fda90:
    str r0, [r5, #0x388]
    mov r0, #0x84
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x388]
    mov r1, #0x50
    mov r2, #0x28
    mov r3, #0xa8
    bl Overlay021_Dialog_SetLayout
    ldr r0, [r5, #0x388]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r1, [r5, #0x388]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r5, #0x388]
    add r2, r5, #0x398
    mov r1, #0x6
    bl TitleDialog_SetExternalTextRow
    ldr r0, [r5, #0x388]
    add r2, r5, #0x3b8
    mov r1, #0x5
    bl TitleDialog_SetExternalTextRow
    mov r0, #0x70
    ldr r1, L_021fdb78
    mov r2, #0x4
    ldr r3, L_021fdb70
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdb10
    bl func_ov045_0220b83c
L_021fdb10:
    str r0, [r5, #0x3ec]
    ldr r0, [r5, #0x20]
    ldr r1, L_021fdb7c
    orr r0, r0, #0x400
    str r0, [r5, #0x20]
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fdb38: .word data_ov021_02202f64
L_021fdb3c: .word Overlay021_Controller_DestroyNoOp
L_021fdb40: .word SpriteMotionController_Init
L_021fdb44: .word data_021e9ac0
L_021fdb48: .word data_021f3ecc
L_021fdb4c: .word 0x2e2
L_021fdb50: .word 0x2e3
L_021fdb54: .word data_020f4e18
L_021fdb58: .word 0xc007
L_021fdb5c: .word 0x7007
L_021fdb60: .word 0x7005
L_021fdb64: .word 0x7001
L_021fdb68: .word data_020f4e14
L_021fdb6c: .word data_ov021_02202f88
L_021fdb70: .word gHeapContext
L_021fdb74: .word gDebugFont
L_021fdb78: .word data_ov021_02202f90
L_021fdb7c: .word data_ov021_02202e10
.size Overlay021_Scene_Init, . - Overlay021_Scene_Init
