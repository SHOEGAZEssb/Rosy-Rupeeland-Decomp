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
    .extern func_02092814
    .extern func_020929b0
    .extern TitleDialog_Init
    .extern func_02092f88
    .extern func_020957bc
    .extern func_ov021_021fd150
    .extern func_ov021_021fd790
    .extern func_ov021_021fd794
    .extern func_ov021_021fd7a8
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fdf88
    .extern func_ov021_021fe098
    .extern Overlay021_SetupMainBackground
    .extern func_ov021_021fe520
    .extern func_ov021_021fe6b0
    .extern func_ov045_0220b83c
    .extern func_ov045_0220c48c
    .extern gDebugFont
    .extern genrand_int32
    .extern gHeapContext
    .extern Heap_Alloc
    .extern MIi_CpuCopy16

.global func_ov021_021fd7e8
func_ov021_021fd7e8:
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
    bl func_020957bc
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
    bl func_ov021_021fd794
    add r0, r5, #0x368
    bl func_ov021_021fd794
    add r0, r5, #0x4
    add r0, r0, #0x400
    bl func_020929b0
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
    bl func_02092814
    add r0, r5, #0x58
    ldr r1, L_021fdb60
    bl func_02092814
    add r0, r5, #0x58
    ldr r1, L_021fdb64
    bl func_02092814
    add r0, r5, #0x58
    mov r1, #0x7000
    bl func_02092814
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
    bl func_ov021_021fdf88
    mov r0, r5
    bl func_ov021_021fe098
    mov r0, r5
    bl Overlay021_SetupMainBackground
    mov r0, r5
    bl func_ov021_021fe520
    mov r0, r5
    bl func_ov021_021fe6b0
    ldr r0, [r5, #0x2a4]
    cmp r0, #0x0
    beq L_021fda3c
    bl func_ov021_021fd150
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
    bl func_ov021_021fd7a8
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
    bl func_02092f88
    ldr r0, [r5, #0x388]
    add r2, r5, #0x3b8
    mov r1, #0x5
    bl func_02092f88
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
    bl func_ov021_021fd7c0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fdb38: .word data_ov021_02202f64
L_021fdb3c: .word func_ov021_021fd790
L_021fdb40: .word func_020957bc
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
.size func_ov021_021fd7e8, . - func_ov021_021fd7e8
