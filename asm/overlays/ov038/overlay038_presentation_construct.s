.text

/* Exact fallback; see src/overlays/ov038/overlay038_presentation_construct.c for documented portable C. */

    .extern SceneInputBase_Init
    .extern AnimationResourceState_InitEmbedded
    .extern func_020957bc
    .extern TitleCharacterResourceCollection_Init
    .extern func_02091b6c
    .extern func_02071ee0
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_020957f0
    .extern func_02095820
    .extern GameWork_TestFlag
    .extern Heap_Alloc
    .extern func_02094154
    .extern InventoryScroll_SetSpritePriority
    .extern InventoryScroll_UpdatePresentation
    .extern func_02092814
    .extern func_ov038_021fd210
    .extern func_ov038_021fd28c
    .extern func_ov046_0220b7bc
    .extern func_ov038_021fd508
    .extern func_ov046_0220bffc
    .extern func_ov046_0220c478
    .extern func_02027fe8
    .extern func_02091b98
    .extern func_ov038_021fce04
    .extern data_ov038_021fdd28
    .extern data_020f4e18
    .extern data_020f4e14
    .extern data_020c37e4
    .extern data_020d7a48
    .extern gGameWork
    .extern data_ov038_021fdd3c
    .extern gHeapContext
    .extern data_ov038_021fdd44
    .extern gDebugFont
    .extern data_ov038_021fdd4c
    .extern data_ov038_021fdcd0

    .global func_ov038_021fce2c
func_ov038_021fce2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r0
    bl SceneInputBase_Init
    ldr r1, L_021fd0a0
    add r0, r7, #0x54
    str r1, [r7, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r7, #0x64
    bl func_020957bc
    add r0, r7, #0x318
    bl TitleCharacterResourceCollection_Init
    add r0, r7, #0x348
    bl func_02091b6c
    mov r0, #0x0
    str r0, [r7, #0x33c]
    mov r0, #0x39
    str r0, [sp, #0x0]
    ldr r1, L_021fd0a4
    add r0, r7, #0x54
    ldr r1, [r1, #0x0]
    mov r2, #0x38
    mov r3, #0x1
    bl func_02071ee0
    ldr r0, L_021fd0a8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r7, #0x54
    mov r2, #0x2
    str r0, [r7, #0x60]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r7, #0x64
    mov r2, #0x6
    mov r3, #0x1
    bl func_020957f0
    add r0, r7, #0x64
    mov r1, #0xe8
    mov r2, #0xa0
    bl func_02095820
    ldr r0, L_021fd0ac
    mov r5, #0x0
    str r5, [r7, #0x110]
    ldr r6, [r0, #0x0]
    ldr r4, L_021fd0b0
    ldr r9, L_021fd0b4
    mov r8, #0x24
    b L_021fcf28
L_021fcef4:
    mla r0, r5, r8, r4
    ldrh r1, [r0, #0x1c]
    ldr r0, [r9, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fcf24
    ldr r0, [r7, #0x110]
    add r0, r7, r0, lsl #0x2
    str r5, [r0, #0x114]
    ldr r0, [r7, #0x110]
    add r0, r0, #0x1
    str r0, [r7, #0x110]
L_021fcf24:
    add r5, r5, #0x1
L_021fcf28:
    cmp r5, r6
    blt L_021fcef4
    ldr r0, [r7, #0x110]
    cmp r0, #0x0
    beq L_021fcfd0
    ldr r1, L_021fd0b8
    ldr r3, L_021fd0bc
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf84
    mov r1, #0xe8
    str r1, [sp, #0x0]
    mov r1, #0x20
    str r1, [sp, #0x4]
    mov r1, #0x4
    str r1, [sp, #0x8]
    ldr r1, L_021fd0a8
    ldr r2, [r7, #0x110]
    ldr r1, [r1, #0x0]
    mov r3, #0x5
    bl func_02094154
L_021fcf84:
    str r0, [r7, #0x314]
    mov r1, #0x1
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r7, #0x314]
    bl InventoryScroll_UpdatePresentation
    add r0, r7, #0x318
    mov r1, #0x7000
    bl func_02092814
    ldr r1, L_021fd0c0
    add r0, r7, #0x318
    bl func_02092814
    ldr r1, L_021fd0c4
    add r0, r7, #0x318
    bl func_02092814
    mov r0, r7
    bl func_ov038_021fd210
    mov r0, r7
    bl func_ov038_021fd28c
    b L_021fcfd8
L_021fcfd0:
    mov r0, #0x0
    str r0, [r7, #0x314]
L_021fcfd8:
    ldr r1, L_021fd0c8
    ldr r3, L_021fd0bc
    mov r0, #0x118
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd004
    ldr r1, L_021fd0cc
    mov r2, #0x1
    ldr r1, [r1, #0x0]
    bl func_ov046_0220b7bc
L_021fd004:
    str r0, [r7, #0x340]
    mov r0, r7
    bl func_ov038_021fd508
    mov r1, r0
    mov r2, #0x0
    ldr r0, [r7, #0x340]
    mov r3, r2
    bl func_ov046_0220bffc
    mov r0, r7
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r7, #0x340]
    bl func_ov046_0220c478
    mov r0, #0x3c
    ldr r1, L_021fd0d0
    mov r2, #0x4
    ldr r3, L_021fd0bc
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd060
    ldr r1, L_021fd0cc
    ldr r1, [r1, #0x0]
    bl func_02027fe8
L_021fd060:
    str r0, [r7, #0x344]
    add r0, r7, #0x348
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r7, #0x364]
    ldr r0, [r7, #0x20]
    ldr r1, L_021fd0d4
    orr r0, r0, #0x400
    str r0, [r7, #0x20]
    mov r0, r7
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_021fd0a0: .word data_ov038_021fdd28
L_021fd0a4: .word data_020f4e18
L_021fd0a8: .word data_020f4e14
L_021fd0ac: .word data_020c37e4
L_021fd0b0: .word data_020d7a48
L_021fd0b4: .word gGameWork
L_021fd0b8: .word data_ov038_021fdd3c
L_021fd0bc: .word gHeapContext
L_021fd0c0: .word 0x7006
L_021fd0c4: .word 0x7005
L_021fd0c8: .word data_ov038_021fdd44
L_021fd0cc: .word gDebugFont
L_021fd0d0: .word data_ov038_021fdd4c
L_021fd0d4: .word data_ov038_021fdcd0
    .size func_ov038_021fce2c, .-func_ov038_021fce2c
