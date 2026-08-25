    .text
    .extern GXS_SetGraphicsMode
    .extern GX_SetBankForSubBG
    .extern func_020aea7c
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern func_020b44e8
    .extern GraphicsCharacterResource_GetUploadSize
    .extern func_020b198c
    .extern GraphicsBgResourceData_GetDecoded
    .extern GraphicsPaletteResource_GetUploadSize
    .extern func_020b1ff0
    .extern GraphicsBgMapResource_UploadToSubBg
    .extern GraphicsResourceSet_ReleaseHandles
    .extern func_020afd28
    .extern DisplayBrightnessPair_GetScreen
    .extern DisplayBrightness_StartTransition
    .extern GraphicsResourceSet_Destroy
    .extern data_020f4e18
    .extern gDisplayBrightnessPair

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_graphics_setup.c. */
    .global Overlay007_SetupGraphics
Overlay007_SetupGraphics: ; 0x021fbaf0
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x24
    mov r4, r0
    mov r0, #0x5
    bl GXS_SetGraphicsMode
    ldr r2, L_021fbc64
    mov r0, #0x4
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1100
    str r1, [r2, #0x0]
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    ldr r3, L_021fbc68
    mov r1, #0x0
    ldrh r2, [r3, #0x0]
    add r0, sp, #0x18
    and r2, r2, #0x43
    orr r2, r2, #0x3c00
    strh r2, [r3, #0x0]
    ldrh r2, [r3, #0x0]
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r3, #0x0]
    str r1, [r3, #0x8]
    bl GraphicsResourceSet_Init
    ldr r3, L_021fbc6c
    ldr r1, L_021fbc70
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x18
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x18]
    ldr r5, [r0, #0x24]
    bl GraphicsCharacterResource_GetUploadSize
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b198c
    bl func_020b44e8
    ldr r6, [sp, #0x1c]
    mov r0, r6
    bl GraphicsBgResourceData_GetDecoded
    mov r5, r0
    mov r0, r6
    bl GraphicsPaletteResource_GetUploadSize
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b1ff0
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x20]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    add r0, sp, #0x18
    bl GraphicsResourceSet_ReleaseHandles
    mov r2, #0x0
    mov r0, #0x1000
    str r0, [sp, #0x8]
    str r0, [sp, #0x14]
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x0]
    ldr r0, L_021fbc74
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, L_021fbc78
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    mov r2, #0x2
    ldr r0, L_021fbc7c
    mov r1, #0x1
    str r2, [r4, #0xd4]
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0xa
    bl DisplayBrightness_StartTransition
    add r0, sp, #0x18
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fbc64: .word 0x4001000
L_021fbc68: .word 0x4001008
L_021fbc6c: .word 0x9063
L_021fbc70: .word data_020f4e18
L_021fbc74: .word 0x4001020
L_021fbc78: .word 0x4001030
L_021fbc7c: .word gDisplayBrightnessPair

    .size Overlay007_SetupGraphics, .-Overlay007_SetupGraphics
