    .text
/* Exact fallback; see src/overlays/ov019/overlay019_graphics_setup.c. */
    .extern GraphicsResourceSet_Apply
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsBgMapResource_UploadToSubBg
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_ConfigureMain2dEngine
    .extern TitleDisplay_ConfigureSub2dEngine
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_ResetSubBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern TitleDisplay_SetSubBgPriorities
    .extern TitleScreenResourceCollection_Init
    .extern TitleScreenResourceCollection_Destroy
    .extern TitleScreenResourceCollection_Append
    .extern TitleScreenResourceCollection_Get
    .extern TitlePalette_SetMainBackdrop
    .extern TitlePalette_SetSubBackdrop
    .extern func_020aea7c
    .extern func_020b44e8
    .extern Overlay019_SetLcdRouting

.global Overlay019_SetupGraphics
Overlay019_SetupGraphics:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x54
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Init
    ldr r3, L_021fd140
    ldr r0, L_021fd144
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, L_021fd148
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Append
    bl func_020b44e8
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    bne L_021fd09c
    mov r0, #0x0
    bl Overlay019_SetLcdRouting
    mov r1, #0x13
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr r1, L_021fd14c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x10
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    b L_021fd128
L_021fd09c:
    mov r0, #0x1
    bl Overlay019_SetLcdRouting
    mov r1, #0x13
    mov r0, #0x0
    str r1, [r4, #0x4c]
    bl TitleDisplay_ConfigureSub2dEngine
    mov r0, #0x80
    bl func_020aea7c
    ldr r1, L_021fd150
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl GraphicsResourceSet_Apply
    add r0, sp, #0x10
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    mov r0, #0x0
    bl TitlePalette_SetSubBackdrop
L_021fd128:
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Destroy
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x54
    ldmia sp!, {r3, r4, pc}
L_021fd140: .word 0xa06f
L_021fd144: .word data_020f4e18
L_021fd148: .word 0xa070
L_021fd14c: .word 0x4000008
L_021fd150: .word 0x4001008
    .size Overlay019_SetupGraphics, . - Overlay019_SetupGraphics
