    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_SetMainBgPriorities
    .extern TitleScreenResourceCollection_Init
    .extern TitleScreenResourceCollection_Destroy
    .extern TitleScreenResourceCollection_Append
    .extern TitleScreenResourceCollection_Get
    .extern TitlePalette_SetMainBackdrop
    .extern func_020b44e8
    .extern func_ov021_021fe268

.global func_ov021_021fe29c
func_ov021_021fe29c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x54
    mov r4, r0
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    mov r0, #0x0
    ldr lr, L_021fe380
    mov r1, r0
    ldrh r2, [lr, #0x0]
    mov r3, r0
    mov ip, #0x1
    and r2, r2, #0x43
    orr r2, r2, #0x3c00
    strh r2, [lr, #0x0]
    mov r2, #0x1e
    str ip, [sp, #0x0]
    bl func_ov021_021fe268
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Init
    ldr r3, L_021fe384
    ldr r1, L_021fe388
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, L_021fe38c
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Append
    bl func_020b44e8
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
    str r0, [r4, #0x3fc]
    mov r1, #0x13
    str r1, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Destroy
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x54
    ldmia sp!, {r3, r4, pc}
L_021fe380: .word 0x4000008
L_021fe384: .word 0xa06f
L_021fe388: .word data_020f4e18
L_021fe38c: .word 0xa070
    .size func_ov021_021fe29c, . - func_ov021_021fe29c

