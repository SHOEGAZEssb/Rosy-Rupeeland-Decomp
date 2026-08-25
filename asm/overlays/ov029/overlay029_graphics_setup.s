.text

/* Exact fallback; see src/overlays/ov029/overlay029_graphics_setup.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern GraphicsBgCharacterResource_UploadToMainBg
.extern GraphicsBgCharacterResource_UploadToSubBg
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern TitleDisplay_ConfigureMain2dEngine
.extern TitleDisplay_ConfigureSub2dEngine
.extern TitleDisplay_ResetMainBgScroll
.extern TitleDisplay_ResetSubBgScroll
.extern TitleDisplay_SetMainBgPriorities
.extern TitleDisplay_SetSubBgPriorities
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov029_021fd464
func_ov029_021fd464:
    stmdb sp!, {r4, lr}
    ldr r3, L_021fd564
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1c
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr r1, L_021fd568
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3e00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x4]
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
    mov r0, #0x1c
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl TitleDisplay_ConfigureSub2dEngine
    ldr r1, L_021fd56c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x2]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    ldr r0, L_021fd570
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r2, [r0, #0x16]
    ldr r1, L_021fd574
    strh r2, [r0, #0x6]
    ldrh r2, [r0, #0x1e]
    strh r2, [r0, #0x8]
    strh r1, [r0, #0xa]
    ldrh r1, [r0, #0x1e]
    strh r1, [r0, #0xc]
    ldmia sp!, {r4, pc}
L_021fd564: .word 0x4000304
L_021fd568: .word 0x4000008
L_021fd56c: .word 0x400100c
L_021fd570: .word data_020f4e14
L_021fd574: .word 0x4210
.size func_ov029_021fd464, .-func_ov029_021fd464
    .global func_ov029_021fd578
func_ov029_021fd578:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fd63c
    ldr r0, L_021fd640
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xe8]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0x20
    str r0, [r4, #0xd8]
    str r0, [r4, #0xd4]
    mov r0, #0x10
    str r0, [r4, #0xdc]
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToMainBg
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, [r4, #0xd4]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b2058
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToSubBg
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [r4, #0xd4]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fd63c: .word 0xc008
L_021fd640: .word data_020f4e18
.size func_ov029_021fd578, .-func_ov029_021fd578
