    .text
    .extern Heap_Alloc
    .extern data_020f4e18
    .extern data_021e9e00
    .extern data_ov016_02201394
    .extern data_ov016_02201570
    .extern data_ov016_02201578
    .extern Heap_AllocAlternateEntry
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern InventoryScroll_Init
    .extern InventoryScroll_UpdatePresentation
    .extern CxxArray_ConstructWithCookie
    .extern func_ov016_021fce00
    .extern func_ov016_021fd1e0
    .extern gHeapContext

/* Exact fallback for list construction; see src/overlays/ov016/overlay016_list_lifecycle.c. */
    .global func_ov016_021fce34

func_ov016_021fce34:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r0, r5, #0xc
    mov r4, r1
    mov r6, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r5, #0x18
    bl AnimationResourceState_InitEmbedded
    add r0, r5, #0x28
    bl TitleCharacterResourceCollection_Init
    ldr r1, L_021fd04c
    mov r0, r4
    ldr r1, [r1, r6, lsl #0x2]
    str r1, [r5, #0x60]
    str r4, [r5, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x4]
    mov r1, #0x30
    str r1, [r0, #0x18]
    mov r1, #0x20
    str r1, [r0, #0x1c]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x8]
    mov r0, #0x1b
    str r0, [sp, #0x0]
    ldr r1, L_021fd050
    add r0, r5, #0x18
    ldr r1, [r1, #0x0]
    mov r2, #0x19
    mov r3, #0x1a
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x62
    str r0, [sp, #0x0]
    ldr r1, L_021fd050
    add r0, r5, #0xc
    ldr r1, [r1, #0x0]
    mov r2, #0x60
    mov r3, #0x61
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fd054
    mov ip, #0x0
    ldr r0, [r0, #0x4]
    mov r2, #0x4
    str r0, [r5, #0x50]
    str ip, [r5, #0x54]
    ldr r6, [r5, #0x50]
    cmp r6, #0x0
    beq L_021fcfc8
    mov r0, #0x14
    mul r0, r6, r0
    ldr r1, L_021fd058
    ldr r3, L_021fd05c
    add r0, r0, #0x8
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_021fcf3c
    ldr r2, L_021fd060
    mov r1, r6
    str r2, [sp, #0x0]
    mov ip, #0x0
    mov r2, #0x14
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
L_021fcf3c:
    ldr r1, L_021fd064
    str r0, [r5, #0x4c]
    ldr r3, L_021fd05c
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf84
    mov r1, #0xd6
    str r1, [sp, #0x0]
    mov r1, #0x1c
    str r1, [sp, #0x4]
    mov r1, #0xc
    str r1, [sp, #0x8]
    ldr r2, [r5, #0x50]
    mov r1, r4
    mov r3, #0x5
    bl InventoryScroll_Init
L_021fcf84:
    str r0, [r5, #0x58]
    ldr r0, [r5, #0x8]
    add r1, r5, #0x18
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r5, #0x24]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x24]
    ldr r1, [r5, #0x60]
    mov r2, #0x26
    mov r3, #0xaa
    bl GraphicsSpriteState_ApplyRenderConfig
    b L_021fd018
L_021fcfc8:
    ldr r1, L_021fd064
    ldr r3, L_021fd05c
    mov r0, #0x80
    str ip, [r5, #0x4c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd00c
    mov r1, #0xd6
    mov r2, #0x1
    str r1, [sp, #0x0]
    mov ip, #0x1c
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    mov r4, #0x8
    str r4, [sp, #0x8]
    bl InventoryScroll_Init
L_021fd00c:
    str r0, [r5, #0x58]
    mov r0, #0x0
    str r0, [r5, #0x24]
L_021fd018:
    ldr r0, [r5, #0x58]
    bl InventoryScroll_UpdatePresentation
    mov r0, r5
    bl func_ov016_021fd1e0
    add r0, r5, #0x28
    mov r1, #0x7000
    bl TitleCharacterResourceCollection_Append
    ldr r1, L_021fd068
    add r0, r5, #0x28
    bl TitleCharacterResourceCollection_Append
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd04c: .word data_ov016_02201394
L_021fd050: .word data_020f4e18
L_021fd054: .word data_021e9e00
L_021fd058: .word data_ov016_02201570
L_021fd05c: .word gHeapContext
L_021fd060: .word func_ov016_021fce00
L_021fd064: .word data_ov016_02201578
L_021fd068: .word 0x7005

    .size func_ov016_021fce34, . - func_ov016_021fce34
