.text

/* Exact fallback; see src/overlays/ov030/overlay030_main_scene_constructor.c for documented portable C. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_021e9ac0
.extern data_ov030_021ff788
.extern data_ov030_021ff8b0
.extern data_ov030_021ff8cc
.extern data_ov030_021ff8d4
.extern InventoryRecordCollection_FindId
.extern GraphicsArchive_AcquirePaletteResource
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091b6c
.extern SceneInputBase_Init
.extern TitleCharacterResourceCollection_Init
.extern func_02092814
.extern func_020929b0
.extern TitleDialog_Init
.extern func_02092f88
.extern func_020957bc
.extern func_020957f0
.extern func_02095820
.extern func_ov030_021fd9fc
.extern func_ov030_021fda14
.extern func_ov030_021fe2b4
.extern func_ov030_021fe448
.extern func_ov030_021fe808
.extern func_ov045_0220b83c
.extern func_ov045_0220c48c
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov030_021fda3c
func_ov030_021fda3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, L_021fdf38
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x7c
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x88
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x94
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xb8
    bl func_020957bc
    add r0, r4, #0x164
    bl func_020957bc
    add r0, r4, #0x210
    bl func_020957bc
    add r0, r4, #0x340
    bl func_02091b6c
    add r0, r4, #0x364
    bl func_020929b0
    ldr r0, L_021fdf3c
    ldr r1, L_021fdf40
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquirePaletteResource
    str r0, [r4, #0x360]
    mov r1, #0x0
    str r1, [r4, #0x33c]
    str r1, [r4, #0x338]
    sub r0, r1, #0x1
    str r0, [r4, #0x35c]
    mov r0, r4
    str r1, [r4, #0x390]
    bl func_ov030_021fe2b4
    mov r0, r4
    bl func_ov030_021fe448
    ldr r0, L_021fdf44
    mov r1, #0x164
    ldr r0, [r0, #0x0]
    str r0, [r4, #0x37c]
    bl InventoryRecordCollection_FindId
    str r0, [r4, #0x380]
    ldr r0, [r4, #0x37c]
    ldr r1, L_021fdf48
    bl InventoryRecordCollection_FindId
    str r0, [r4, #0x388]
    cmp r0, #0x0
    blt L_021fdb18
    ldr r0, L_021fdf4c
    ldr r1, L_021fdf50
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
L_021fdb18:
    ldr r1, L_021fdf54
    add r0, r4, #0x54
    bl func_02092814
    ldr r1, L_021fdf58
    add r0, r4, #0x54
    bl func_02092814
    mov r1, #0x43
    ldr r0, L_021fdf3c
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x7c
    mov r2, #0x42
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fdf5c
    ldr r1, L_021fdf3c
    str r3, [sp, #0x0]
    add r2, r3, #0x62
    ldr r1, [r1, #0x0]
    add r0, r4, #0x88
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fdf5c
    ldr r1, L_021fdf3c
    str r3, [sp, #0x0]
    add r2, r3, #0x63
    ldr r1, [r1, #0x0]
    add r0, r4, #0x94
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fdf60
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x78]
    add r1, r4, #0x88
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xa0]
    ldr r0, [r4, #0x78]
    add r1, r4, #0x94
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r6, #0x1
    str r0, [r4, #0xa4]
    mov r7, #0x0
    mov r5, r6
L_021fdbd0:
    ldr r0, [r4, #0x78]
    mov r2, r6
    add r1, r4, #0x7c
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r4, r7, lsl #0x2
    str r0, [r1, #0xa8]
    ldr r0, [r4, #0x78]
    mov r2, r5
    add r1, r4, #0x7c
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r4, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0xb0]
    cmp r7, #0x2
    blt L_021fdbd0
    mov r0, #0x8
    mov r1, #0x21
    mov r2, #0x0
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    mov r5, #0x0
    str r0, [r4, #0x2c0]
    mov r3, r5
L_021fdc28:
    add r2, r4, r5, lsl #0x1
    add r0, r2, #0x300
    strh r3, [r0, #0xc]
    ldrh r1, [r0, #0xc]
    add r0, r2, #0x200
    add r5, r5, #0x1
    strh r1, [r0, #0xec]
    strh r1, [r0, #0xcc]
    cmp r5, #0x10
    blt L_021fdc28
    ldr r1, L_021fdf64
    ldr r3, L_021fdf68
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdc7c
    ldr r1, L_021fdf6c
    ldr r2, [r4, #0x54]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fdc7c:
    str r0, [r4, #0x2bc]
    mov r0, #0x84
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x2bc]
    mov r1, #0x50
    mov r2, #0x28
    mov r3, #0xa8
    bl func_ov030_021fd9fc
    ldr r0, [r4, #0x2bc]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r1, [r4, #0x2bc]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r4, #0x2bc]
    add r2, r4, #0x2cc
    mov r1, #0x1
    bl func_02092f88
    ldr r0, [r4, #0x2bc]
    add r2, r4, #0x2ec
    mov r1, #0x2
    bl func_02092f88
    ldr r0, [r4, #0x2bc]
    mov r1, #0x3
    add r2, r4, #0x30c
    bl func_02092f88
    ldr r0, [r4, #0x78]
    add r1, r4, #0x7c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x0
    mov r1, r0
    add r0, r4, #0xb8
    mov r3, r2
    str r2, [sp, #0x0]
    bl func_020957f0
    ldr r0, L_021fdf4c
    ldr r1, L_021fdf50
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    add r0, r4, #0xb8
    mov r1, #0x80
    beq L_021fde1c
    mov r2, #0x40
    bl func_02095820
    ldr r0, [r4, #0x78]
    add r1, r4, #0x7c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0x164
    mov r2, #0x2
    str r3, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0x164
    mov r1, #0x80
    mov r2, #0x70
    bl func_02095820
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r4, #0xa0]
    mov r2, #0x20
    mov r3, #0x40
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r4, #0xa4]
    mov r2, #0x20
    mov r3, #0x70
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r9, #0x0
    mov r7, r9
    mov r6, #0x40
    mov r5, r9
    mov r10, #0x70
L_021fddc8:
    stmia sp, {r7, r9}
    str r7, [sp, #0x8]
    add r0, r4, r9, lsl #0x2
    mov r8, r9, lsl #0x3
    ldr r0, [r0, #0xa8]
    mov r1, r7
    mov r3, r6
    add r2, r8, #0x32
    bl GraphicsSpriteState_ApplyRenderConfig
    stmia sp, {r5, r9}
    str r5, [sp, #0x8]
    add r0, r4, r9, lsl #0x2
    ldr r0, [r0, #0xb0]
    mov r1, r5
    mov r3, r10
    add r2, r8, #0x32
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fddc8
    b L_021fdea4
L_021fde1c:
    mov r2, #0x60
    bl func_02095820
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r4, #0xa0]
    mov r2, #0x20
    mov r3, #0x60
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r1, [r4, #0xa4]
    mov r7, #0x0
    ldrh r0, [r1, #0x24]
    mov r6, r7
    mov r5, #0x60
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
L_021fde60:
    stmia sp, {r6, r7}
    str r6, [sp, #0x8]
    add r0, r4, r7, lsl #0x2
    mov r2, r7, lsl #0x3
    ldr r0, [r0, #0xa8]
    mov r1, r6
    mov r3, r5
    add r2, r2, #0x32
    bl GraphicsSpriteState_ApplyRenderConfig
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0xb0]
    add r7, r7, #0x1
    ldrh r0, [r1, #0x24]
    cmp r7, #0x2
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    blt L_021fde60
L_021fdea4:
    mov r0, r4
    bl func_ov030_021fe808
    ldr r0, [r4, #0x78]
    add r1, r4, #0x7c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0x210
    mov r2, #0x6
    str r3, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0x210
    mov r1, #0xe4
    mov r2, #0xb0
    bl func_02095820
    mov r0, #0x0
    str r0, [r4, #0x2c4]
    mov r0, #0x70
    ldr r1, L_021fdf70
    mov r2, #0x4
    ldr r3, L_021fdf68
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdf0c
    bl func_ov045_0220b83c
L_021fdf0c:
    str r0, [r4, #0x2c8]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fdf74
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fdf38: .word data_ov030_021ff8b0
L_021fdf3c: .word data_020f4e18
L_021fdf40: .word 0xc007
L_021fdf44: .word data_021e9ac0
L_021fdf48: .word 0x165
L_021fdf4c: .word gGameWork
L_021fdf50: .word 0x3b9
L_021fdf54: .word 0x7007
L_021fdf58: .word 0x7005
L_021fdf5c: .word 0xd082
L_021fdf60: .word data_020f4e14
L_021fdf64: .word data_ov030_021ff8cc
L_021fdf68: .word gHeapContext
L_021fdf6c: .word gDebugFont
L_021fdf70: .word data_ov030_021ff8d4
L_021fdf74: .word data_ov030_021ff788
.size func_ov030_021fda3c, .-func_ov030_021fda3c
