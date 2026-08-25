    .text
    .extern Heap_Alloc
    .extern data_020f4e18
    .extern data_021e9ac0
    .extern data_ov001_021fcc80
    .extern data_ov001_021fcc90
    .extern data_ov001_021fcc98
    .extern Heap_AllocAlternateEntry
    .extern ActorDescriptor_IsInvalid
    .extern InventoryCell_Init
    .extern InventoryCell_Destroy
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern TitleCharacterResourceCollection_Init
    .extern func_02092814
    .extern IndexedSelectionController_Init
    .extern IndexedSelectionController_ConfigureRange
    .extern func_02094154
    .extern func_020957bc
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940
    .extern func_020befec
    .extern CxxArray_ConstructWithCookie
    .extern func_ov001_021fc404
    .extern gHeapContext
    .global func_ov001_021fbabc
func_ov001_021fbabc: ; 0x021fbabc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    ldr r2, L_021fbe48
    add r0, r10, #0x10
    mov r4, r1
    str r2, [r10, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x28
    bl func_020957bc
    add r0, r10, #0xd4
    bl func_020957bc
    add r0, r10, #0x180
    bl TitleCharacterResourceCollection_Init
    add r0, r10, #0x1c0
    bl IndexedSelectionController_Init
    mov r1, #0x0
    str r4, [r10, #0x4]
    str r1, [r10, #0x1ac]
    sub r0, r1, #0x1
    str r0, [r10, #0x1b0]
    str r1, [r10, #0x1b4]
    str r1, [r10, #0x1c]
    str r1, [r10, #0x1f8]
    mov r0, #0x1e
    str r0, [r10, #0x1fc]
    mov r0, #0x200
    str r0, [r10, #0x200]
    str r1, [r10, #0x1bc]
    str r1, [r10, #0x24]
    str r1, [r10, #0x20]
    ldr r0, [r10, #0x4]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x8]
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r1, L_021fbe4c
    add r0, r10, #0x10
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x4]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0xc]
    ldr r1, [r10, #0x1b4]
    rsb r2, r1, #0x0
    mov r1, #0x0
    str r1, [r0, #0x18]
    str r2, [r0, #0x1c]
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0x28
    mov r2, #0x3a
    mov r3, #0x2
    bl func_020957f0
    add r0, r10, #0x28
    mov r1, #0xec
    mov r2, #0xaa
    bl func_02095820
    add r0, r10, #0x28
    bl func_02095940
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r4, #0x0
    add r0, r10, #0xd4
    mov r2, #0x42
    mov r3, #0x2
    str r4, [sp, #0x0]
    bl func_020957f0
    add r0, r10, #0xd4
    mov r1, #0xdc
    mov r2, #0x10
    bl func_02095820
    add r0, r10, #0xd4
    bl func_02095940
    ldr r1, L_021fbe50
    add r0, r10, #0x180
    bl func_02092814
    ldr r1, [r10, #0x1b4]
    ldr r0, L_021fbe54
    rsb r1, r1, #0x34
    str r1, [r10, #0x1b8]
    ldr r1, [r0, #0x0]
    mov r5, #0x24
    add r1, r1, #0x34
    str r1, [r10, #0x204]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    str r0, [r10, #0x208]
    str r4, [r10, #0x1a4]
    b L_021fbc68
L_021fbc4c:
    ldr r0, [r1, #0x4]
    mla r0, r4, r5, r0
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    addeq r0, r4, #0x1
    streq r0, [r10, #0x1a4]
    add r4, r4, #0x1
L_021fbc68:
    ldr r1, [r10, #0x204]
    ldr r0, [r1, #0xc]
    cmp r4, r0
    blt L_021fbc4c
    ldr r0, [r10, #0x1a4]
    mov r1, #0x5
    cmp r0, #0xf
    movlt r0, #0xf
    strlt r0, [r10, #0x1a4]
    ldr r0, [r10, #0x1a4]
    add r0, r0, #0x4
    bl func_020befec
    add r5, r0, r0, lsl #0x2
    str r0, [r10, #0x1a8]
    mov r0, r5, lsl #0x5
    ldr r1, L_021fbe58
    ldr r3, L_021fbe5c
    add r0, r0, #0x8
    mov r2, #0x4
    str r5, [r10, #0x1a4]
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_021fbce4
    ldr r1, L_021fbe60
    ldr r4, L_021fbe64
    str r1, [sp, #0x0]
    mov r1, r5
    mov r2, #0x20
    mov r3, #0x8
    str r4, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
L_021fbce4:
    mov r6, #0x5
    mov r4, #0x24
    str r0, [r10, #0x20c]
    mov r8, #0x0
    mov r7, #0x1
    mov r11, r6
    mov r5, r4
    b L_021fbd48
L_021fbd04:
    mov r0, r10
    mov r1, r8
    mov r2, r7
    bl func_ov001_021fc404
    ldr r2, [r10, #0x20c]
    mov r0, r8
    mov r1, r6
    add r9, r2, r8, lsl #0x5
    bl func_020befec
    mul r2, r1, r4
    mov r0, r8
    str r2, [r9, #0x14]
    mov r1, r11
    bl func_020befec
    mul r1, r0, r5
    str r1, [r9, #0x18]
    add r8, r8, #0x1
L_021fbd48:
    ldr r0, [r10, #0x1a4]
    cmp r8, r0
    blt L_021fbd04
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x20]
    mov r1, #0x2
    str r1, [sp, #0x0]
    mov r0, #0x0
    stmib sp, {r0, r1}
    ldr r0, [r10, #0x20]
    mov r2, #0x38
    mov r3, #0x34
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x24]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x3800
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x24]
    mov r1, #0x3
    mov r2, #0x38
    mov r3, #0x34
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r2, [r10, #0x1b8]
    ldr r1, [r10, #0x8]
    mov r0, #0x38
    str r0, [r1, #0x18]
    str r2, [r1, #0x1c]
    ldr r1, L_021fbe68
    ldr r3, L_021fbe5c
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fbe24
    mov r1, #0xea
    str r1, [sp, #0x0]
    ldr r2, [r10, #0x1b4]
    mov r1, #0x0
    rsb r2, r2, #0x2a
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r1, [r10, #0x4]
    ldr r2, [r10, #0x1a8]
    mov r3, #0x3
    bl func_02094154
L_021fbe24:
    mov r1, #0x0
    str r0, [r10, #0x1bc]
    mov r3, r1
    add r0, r10, #0x1c0
    mov r2, #0x4
    bl IndexedSelectionController_ConfigureRange
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fbe48: .word data_ov001_021fcc80
L_021fbe4c: .word data_020f4e18
L_021fbe50: .word 0x7004
L_021fbe54: .word data_021e9ac0
L_021fbe58: .word data_ov001_021fcc90
L_021fbe5c: .word gHeapContext
L_021fbe60: .word InventoryCell_Init
L_021fbe64: .word InventoryCell_Destroy
L_021fbe68: .word data_ov001_021fcc98
    .size func_ov001_021fbabc, .-func_ov001_021fbabc
