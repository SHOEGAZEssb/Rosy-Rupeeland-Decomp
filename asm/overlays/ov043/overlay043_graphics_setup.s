.text
.extern TitleDisplay_ConfigureMain2dEngine
.extern TitleDisplay_ResetMainBgScroll
.extern TitleDisplay_SetMainBgPriorities
.extern TitleDisplay_ConfigureSub2dEngine
.extern TitleDisplay_ResetSubBgScroll
.extern TitleDisplay_SetSubBgPriorities
.extern GraphicsResourceSet_Init
.extern TitleScreenResourceCollection_Init
.extern GraphicsResourceSet_Load
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_020b44e8
.extern GraphicsResourceSet_ApplyToMainBg
.extern GraphicsResourceSet_Apply
.extern func_02092754
.extern TitleScreenResourceCollection_Get
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern func_020926f8
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18
.extern data_020f4e14
.extern gDebugFont

    .global func_ov043_0220ba28
func_ov043_0220ba28:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x54
    ldr r3, .L_0220bc04
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x18
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr r1, .L_0220bc08
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x0]
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
    ldr r1, .L_0220bc0c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
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
    ldr r3, .L_0220bc10
    ldr r1, .L_0220bc14
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
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
    ldr r3, .L_0220bc18
    ldr r0, .L_0220bc14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, .L_0220bc1c
    add r0, sp, #0x10
    bl func_02092754
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl GraphicsResourceSet_Apply
    add r0, sp, #0x10
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, .L_0220bc20
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    mov r4, r0
    ldr r0, .L_0220bc24
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r2, [r4, #0xe]
    ldr r1, .L_0220bc28
    strh r2, [r0, #0x6]
    strh r2, [r4, #0x6]
    ldrh r2, [r4, #0x1e]
    strh r2, [r0, #0x8]
    strh r2, [r4, #0x8]
    strh r1, [r0, #0xa]
    ldrh r1, [r0, #0xa]
    strh r1, [r4, #0xa]
    ldrh r1, [r4, #0x1e]
    strh r1, [r0, #0xc]
    add r0, sp, #0x10
    strh r1, [r4, #0xc]
    bl func_020926f8
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x54
    ldmia sp!, {r3, r4, pc}
.L_0220bc04: .word 0x4000304
.L_0220bc08: .word 0x400000e
.L_0220bc0c: .word 0x4001008
.L_0220bc10: .word 0x8006
.L_0220bc14: .word data_020f4e18
.L_0220bc18: .word 0x8014
.L_0220bc1c: .word 0x8016
.L_0220bc20: .word data_020f4e14
.L_0220bc24: .word gDebugFont
.L_0220bc28: .word 0x4210
.size func_ov043_0220ba28, . - func_ov043_0220ba28

