.text

/* Exact fallback; see src/overlays/ov038/overlay038_display_resources.c for documented portable C. */

    .extern TitleDisplay_ConfigureMain2dEngine
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern GraphicsBgMapResource_SetPaletteBank
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern func_020b44e8
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsResourceSet_Destroy
    .extern data_020f4e18

    .global func_ov038_021fd210
func_ov038_021fd210:
    stmdb sp!, {r3, lr}
    ldr r3, L_021fd284
    mov r1, #0x1b
    ldrh r2, [r3, #0x0]
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r0, #0x48]
    mov r0, #0x0
    bl TitleDisplay_ConfigureMain2dEngine
    ldr r1, L_021fd288
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x6]
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    ldmia sp!, {r3, pc}
L_021fd284: .word 0x4000304
L_021fd288: .word 0x4000008
    .size func_ov038_021fd210, .-func_ov038_021fd210

    .global func_ov038_021fd28c
func_ov038_021fd28c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fd36c
    ldr r0, L_021fd370
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl GraphicsBgMapResource_SetPaletteBank
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x1e0
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r3, L_021fd374
    ldr r1, L_021fd370
    str r3, [sp, #0x0]
    sub r2, r3, #0x3
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x2
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x0
    mov r2, #0x100
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r3, L_021fd378
    ldr r1, L_021fd370
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
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_021fd36c: .word 0xc011
L_021fd370: .word data_020f4e18
L_021fd374: .word 0x8022
L_021fd378: .word 0x8021
    .size func_ov038_021fd28c, .-func_ov038_021fd28c
