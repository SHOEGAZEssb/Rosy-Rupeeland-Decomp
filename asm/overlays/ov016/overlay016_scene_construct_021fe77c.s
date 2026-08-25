    .text
    .extern GameWork_ClearFlag
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_021e9ac0
    .extern data_021e9e00
    .extern data_ov016_022013e8
    .extern data_ov016_02201410
    .extern data_ov016_02201540
    .extern InventoryRecordCollection_Sort
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern SceneInputBase_Init
    .extern TitleScreenResourceCollection_Init
    .extern TitleScreenResourceCollection_Append
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern SpriteMotionController_Init
    .extern SpriteMotionController_BindSprite
    .extern SpriteMotionController_SetPosition
    .extern SpriteMotionController_Hide
    .extern func_ov016_021fe740
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021fedc4
    .extern func_ov016_021ff094
    .extern func_ov016_021ff17c
    .extern func_ov016_021ff288
    .extern Overlay016_CreateSceneSprite
    .extern Overlay016_PopulateAuxiliaryList
    .extern gGameWork

/* Exact fallback; see src/overlays/ov016/overlay016_scene_construct.c. */
    .global func_ov016_021fe77c

func_ov016_021fe77c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl SceneInputBase_Init
    ldr r1, L_021fea64
    add r0, r4, #0x60
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Init
    add r0, r4, #0xc8
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xd4
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xe8
    bl SpriteMotionController_Init
    add r0, r4, #0x194
    bl SpriteMotionController_Init
    add r0, r4, #0x240
    bl SpriteMotionController_Init
    add r0, r4, #0x2ec
    bl SpriteMotionController_Init
    add r0, r4, #0x398
    bl SpriteMotionController_Init
    add r0, r4, #0x54
    add r0, r0, #0x400
    bl func_ov016_021fe740
    add r0, r5, #0x1
    str r6, [r4, #0x54]
    mov r1, #0x0
    str r1, [r4, #0x444]
    str r1, [r4, #0x460]
    str r1, [r4, #0x464]
    str r1, [r4, #0xe4]
    str r1, [r4, #0x468]
    str r1, [r4, #0x46c]
    str r1, [r4, #0x44c]
    str r1, [r4, #0x450]
    str r1, [r4, #0x470]
    str r1, [r4, #0x47c]
    str r1, [r4, #0x478]
    str r5, [r4, #0x58]
    add r0, r0, r0, lsl #0x2
    str r0, [r4, #0x5c]
    str r1, [r4, #0x480]
    mov r0, #0x1
    str r0, [r4, #0x484]
    ldr r0, L_021fea68
    ldr r0, [r0, #0x0]
    bl InventoryRecordCollection_Sort
    ldr r1, L_021fea6c
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021fea70
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021fea74
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021fea78
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021fea7c
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Append
    ldr r1, L_021fea80
    add r0, r4, #0x60
    bl TitleCharacterResourceCollection_Append
    ldr r1, L_021fea84
    add r0, r4, #0x60
    bl TitleCharacterResourceCollection_Append
    mov r0, #0xf
    str r0, [sp, #0x0]
    ldr r1, L_021fea88
    add r0, r4, #0xc8
    ldr r1, [r1, #0x0]
    mov r2, #0xd
    mov r3, #0xe
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x1e
    str r0, [sp, #0x0]
    add r0, r4, #0xd4
    ldr r1, L_021fea88
    mov r2, #0x1c
    ldr r1, [r1, #0x0]
    mov r3, #0x1d
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fea8c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xe0]
    mov r0, r4
    bl func_ov016_021ff288
    mov r0, r4
    bl func_ov016_021fedc4
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq L_021fe91c
    cmp r0, #0x1
    beq L_021fe940
    cmp r0, #0x2
    bne L_021fea3c
L_021fe91c:
    mov r0, r4
    bl func_ov016_021ff094
    mov r0, r4
    bl Overlay016_CreateSceneSprite
    ldr r1, L_021fea90
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_021fea3c
L_021fe940:
    mov r0, r4
    bl func_ov016_021ff17c
    mov r0, r4
    bl Overlay016_PopulateAuxiliaryList
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xd4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x100
    str r0, [sp, #0x0]
    add r0, r4, #0x240
    mov r2, #0x0
    mov r3, #0x1
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x240
    mov r1, #0x14
    mov r2, #0x10
    bl SpriteMotionController_SetPosition
    ldr r0, L_021fea94
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne L_021fe9a4
    add r0, r4, #0x240
    bl SpriteMotionController_Hide
L_021fe9a4:
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xd4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov ip, #0x0
    add r0, r4, #0x2ec
    mov r2, #0x5
    mov r3, #0x1
    str ip, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x2ec
    mov r1, #0x14
    mov r2, #0x3b
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x2ec
    bl SpriteMotionController_Hide
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xd4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x398
    mov r2, #0x4
    mov r3, #0x1
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x398
    mov r1, #0x14
    mov r2, #0x25
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x398
    bl SpriteMotionController_Hide
    mov r0, r4
    ldr r1, L_021fea98
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_021fea3c:
    ldr r0, L_021fea9c
    ldr r1, L_021feaa0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x20]
    mov r0, r4
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fea64: .word data_ov016_02201540
L_021fea68: .word data_021e9ac0
L_021fea6c: .word 0x801b
L_021fea70: .word 0x801c
L_021fea74: .word 0x8010
L_021fea78: .word 0x8011
L_021fea7c: .word 0x800b
L_021fea80: .word 0x7005
L_021fea84: .word 0x7001
L_021fea88: .word data_020f4e18
L_021fea8c: .word data_020f4e14
L_021fea90: .word data_ov016_02201410
L_021fea94: .word data_021e9e00
L_021fea98: .word data_ov016_022013e8
L_021fea9c: .word gGameWork
L_021feaa0: .word 0x3a6

    .size func_ov016_021fe77c, . - func_ov016_021fe77c
