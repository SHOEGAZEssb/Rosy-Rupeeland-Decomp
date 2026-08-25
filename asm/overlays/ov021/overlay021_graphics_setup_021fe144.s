    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern data_021f5ee8
    .extern GraphicsBgCharacterResource_UploadToMainBg
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsBgMapResource_SetPaletteBank
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_SetMainBgPriorities
    .extern func_020afd0c
    .extern func_020b2058
    .extern func_020b44e8
    .extern func_ov021_021fe268

.global Overlay021_SetupMainBackground
Overlay021_SetupMainBackground:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    mov r0, #0x0
    mov ip, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    str ip, [sp, #0x0]
    bl func_ov021_021fe268
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe254
    ldr r1, L_021fe258
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    mov r0, #0x0
    str r0, [r4, #0x3fc]
    mov r0, #0x1c
    str r0, [r4, #0x48]
    mov r2, #0x8
    ldr r0, L_021fe25c
    mov r1, #0x4
    mov r3, r2
    str r2, [sp, #0x0]
    bl func_020afd0c
    ldr r3, L_021fe260
    ldr r1, L_021fe258
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_SetPaletteBank
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToMainBg
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, L_021fe264
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe254: .word 0x803a
L_021fe258: .word data_020f4e18
L_021fe25c: .word 0x4000050
L_021fe260: .word 0xc008
L_021fe264: .word data_021f5ee8
    .size Overlay021_SetupMainBackground, . - Overlay021_SetupMainBackground

