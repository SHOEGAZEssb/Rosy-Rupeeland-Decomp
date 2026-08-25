.text

/* Exact fallback; see src/overlays/ov023/overlay023_graphics_setup.c. */
.extern data_020f4e18
.extern GraphicsBgCharacterResource_UploadToMainBg
.extern GraphicsBgCharacterResource_UploadToSubBg
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsBgMapResource_SetPaletteBank
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov023_021fe2cc
func_ov023_021fe2cc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe394
    ldr r0, L_021fe398
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToSubBg
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
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
    ldr r0, [r4, #0x4c0]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0x40
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldr r0, [r4, #0x4c0]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0x40
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe394: .word 0xc008
L_021fe398: .word data_020f4e18
.size func_ov023_021fe2cc, .-func_ov023_021fe2cc

