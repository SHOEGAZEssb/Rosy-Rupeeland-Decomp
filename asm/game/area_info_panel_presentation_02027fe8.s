; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern TitleCharacterResourceCollection_Init
.extern func_02092814

    .global AreaInfoPanelPresentation_Init
    .type AreaInfoPanelPresentation_Init, @function
AreaInfoPanelPresentation_Init: ; 0x02027fe8
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl TitleCharacterResourceCollection_Init
    add r0, r5, #0x24
    bl AnimationResourceState_InitEmbedded
    mov r0, r4
    str r4, [r5, #0x30]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x34]
    mov r0, r5
    ldr r1, .L_020280c8
    bl func_02092814
    mov r0, r5
    ldr r1, .L_020280cc
    bl func_02092814
    ldr r3, .L_020280d0
    add r0, r5, #0x24
    str r3, [sp, #0x0]
    ldr r1, .L_020280d4
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r5, #0x34]
    add r1, r5, #0x24
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r5, #0x38]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r5, #0x38]
    mov r2, #0x1e
    mov r3, #0xa2
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r5, #0x34]
    add r1, r5, #0x24
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0x5
    mov r3, #0xbd
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r5, #0x34]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_020280c8: .word 0x7005
.L_020280cc: .word 0x7007
.L_020280d0: .word 0x3328
.L_020280d4: .word data_020f4e18
    .size AreaInfoPanelPresentation_Init, . - AreaInfoPanelPresentation_Init

