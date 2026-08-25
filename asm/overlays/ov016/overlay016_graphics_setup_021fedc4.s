    .text

/* Exact fallback; see src/overlays/ov016/overlay016_graphics_setup.c. */
    .extern GraphicsResourceSet_Apply
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e14
    .extern data_020f4e18
    .extern GraphicsBgMapResource_UploadToSubBg
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern GraphicsSpriteRenderer_GetObjectPaletteAddress
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
    .extern func_020afd0c
    .extern func_020b44e8
    .extern func_ov016_021ff04c
    .extern Overlay016_ConfigureMainBg3
    .extern gDebugFont
.global func_ov016_021fedc4
func_ov016_021fedc4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x54
    mov r4, r0
    mov r0, #0x0
    bl func_ov016_021ff04c
    mov r1, #0x10
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr ip, L_021ff01c
    mov r0, #0x0
    ldrh r3, [ip, #0x0]
    mov r1, r0
    mov r2, #0x1e
    and r3, r3, #0x43
    orr r3, r3, #0x3800
    strh r3, [ip, #0x0]
    ldrh r5, [ip, #0x2]
    mov r3, #0x4
    and r5, r5, #0x43
    orr r5, r5, #0x3a00
    strh r5, [ip, #0x2]
    ldrh r5, [ip, #0x4]
    and r5, r5, #0x43
    orr r5, r5, #0x1c00
    strh r5, [ip, #0x4]
    bl Overlay016_ConfigureMainBg3
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    mov r0, #0x1d
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl TitleDisplay_ConfigureSub2dEngine
    ldr r1, L_021ff020
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x6]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Init
    ldr r3, L_021ff024
    ldr r1, L_021ff028
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
    ldr r3, L_021ff02c
    ldr r1, L_021ff028
    str r3, [sp, #0x0]
    sub r2, r3, #0x6
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    ldr r0, [r4, #0x54]
    cmp r0, #0x2
    add r0, sp, #0x10
    bne L_021fef44
    ldr r1, L_021ff030
    bl TitleScreenResourceCollection_Append
    b L_021fef4c
L_021fef44:
    ldr r1, L_021ff034
    bl TitleScreenResourceCollection_Append
L_021fef4c:
    ldr r1, L_021ff038
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Append
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_Apply
    add r0, sp, #0x10
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x0
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    add r0, sp, #0x10
    mov r1, #0x1
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, L_021ff03c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    mov r5, r0
    ldr r0, L_021ff040
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r1, [r5, #0xe]
    ldr r4, L_021ff044
    mov r3, #0x8
    strh r1, [r0, #0x6]
    strh r1, [r5, #0x6]
    ldrh ip, [r5, #0x1e]
    mov r1, #0x0
    mov r2, #0xc
    strh ip, [r0, #0x8]
    strh ip, [r5, #0x8]
    strh r4, [r0, #0xa]
    ldrh r4, [r0, #0xa]
    strh r4, [r5, #0xa]
    ldrh r4, [r5, #0x1e]
    strh r4, [r0, #0xc]
    strh r4, [r5, #0xc]
    ldr r0, L_021ff048
    str r3, [sp, #0x0]
    bl func_020afd0c
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Destroy
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, pc}
L_021ff01c: .word 0x4000008
L_021ff020: .word 0x4001008
L_021ff024: .word 0x8006
L_021ff028: .word data_020f4e18
L_021ff02c: .word 0x8018
L_021ff030: .word 0x801e
L_021ff034: .word 0x8014
L_021ff038: .word 0x8015
L_021ff03c: .word data_020f4e14
L_021ff040: .word gDebugFont
L_021ff044: .word 0x4210
L_021ff048: .word 0x4001050
    .size func_ov016_021fedc4, . - func_ov016_021fedc4
