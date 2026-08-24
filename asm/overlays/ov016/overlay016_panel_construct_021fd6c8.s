    .text
    .extern __construct_array
    .extern data_020f4e18
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_Destroy
    .extern func_02071ee0
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern func_02091b6c
    .extern TitleCharacterResourceCollection_Init
    .extern func_02092814
    .extern gSystemState

/* Exact fallback; see src/overlays/ov016/overlay016_panel_lifecycle.c. */
    .global func_ov016_021fd6c8

func_ov016_021fd6c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0xc
    mov r4, r1
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x18
    bl AnimationResourceState_InitEmbedded
    ldr r0, L_021fd964
    ldr r3, L_021fd968
    str r0, [sp, #0x0]
    add r0, r10, #0x24
    mov r1, #0x6
    mov r2, #0xc
    bl __construct_array
    add r0, r10, #0x6c
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x78
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0xd4
    bl TitleCharacterResourceCollection_Init
    add r0, r10, #0xf8
    bl func_02091b6c
    str r4, [r10, #0x0]
    mov r0, r4
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x4]
    mov r0, r4
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x8]
    add r0, r10, #0xd4
    mov r1, #0x7000
    bl func_02092814
    add r0, r10, #0xd4
    ldr r1, L_021fd96c
    bl func_02092814
    add r0, r10, #0xd4
    ldr r1, L_021fd970
    bl func_02092814
    mov r0, #0x25
    str r0, [sp, #0x0]
    add r0, r10, #0xc
    ldr r1, L_021fd974
    mov r2, #0x24
    ldr r1, [r1, #0x0]
    mov r3, #0x22
    bl func_02071ee0
    mov r0, #0x62
    str r0, [sp, #0x0]
    add r0, r10, #0x6c
    ldr r1, L_021fd974
    mov r2, #0x60
    ldr r1, [r1, #0x0]
    mov r3, #0x61
    bl func_02071ee0
    mov r0, #0x23
    str r0, [sp, #0x0]
    add r0, r10, #0x78
    ldr r1, L_021fd974
    mov r2, #0x21
    ldr r1, [r1, #0x0]
    mov r3, #0x22
    bl func_02071ee0
    ldr r0, [r10, #0x8]
    add r1, r10, #0x6c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x84]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x84]
    mov r2, #0x23
    mov r3, #0x2e
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x8]
    add r1, r10, #0xc
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x88]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x88]
    mov r1, #0x6
    mov r2, #0x58
    mov r3, #0x37
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, L_021fd978
    mov r7, #0x0
    ldrb r0, [r0, #0x5f]
    mov r9, #0x0
    mov r6, #0x1
    mov r8, r7
    cmp r0, #0x0
    subne r7, r7, #0x10
    mov r5, r9
    mov r4, #0x4
    mov r11, r6
L_021fd86c:
    ldr r0, [r10, #0x8]
    add r1, r10, #0x78
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xa4]
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r0, [r1, #0xa4]
    mov r1, r5
    add r2, r7, #0x48
    add r3, r8, #0x67
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x8]
    add r1, r10, #0x78
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x8c]
    str r11, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x8c]
    mov r1, #0xf
    add r2, r7, #0x26
    add r3, r8, #0x60
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x8]
    add r1, r10, #0x78
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xbc]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r1, #0xbc]
    mov r1, #0x12
    add r2, r7, #0x3a
    add r3, r8, #0x64
    bl GraphicsSpriteState_ApplyRenderConfig
    cmp r9, #0x2
    add r8, r8, #0x22
    bne L_021fd94c
    ldr r0, L_021fd978
    add r7, r7, #0x6c
    ldrb r0, [r0, #0x5f]
    mov r8, #0x0
    cmp r0, #0x0
    addne r7, r7, #0x10
L_021fd94c:
    add r9, r9, #0x1
    cmp r9, #0x6
    blt L_021fd86c
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd964: .word AnimationResourceState_Destroy
L_021fd968: .word AnimationResourceState_InitEmbedded
L_021fd96c: .word 0x7005
L_021fd970: .word 0x7006
L_021fd974: .word data_020f4e18
L_021fd978: .word gSystemState

    .size func_ov016_021fd6c8, . - func_ov016_021fd6c8
