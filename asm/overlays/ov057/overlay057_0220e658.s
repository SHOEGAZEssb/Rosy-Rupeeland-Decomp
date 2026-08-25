.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern GraphicsResourceSet_Load
.extern PaletteBuffer_Write
.extern data_020f4e18
.extern gMainBgPaletteBuffer
.extern gSubBgPaletteBuffer
.extern GraphicsBgCharacterResource_UploadToMainBg
.extern GraphicsBgCharacterResource_UploadToSubBg
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_020b44e8

.global func_ov057_0220e658
func_ov057_0220e658:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r3, .L_0220e760
    ldr r1, .L_0220e764
    str r3, [sp, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x0]
    add r0, r4, #0x8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, .L_0220e768
    mov r1, #0xf
    ldrh r0, [r3, #0x0]
    sub r2, r3, #0x1000
    and r0, r0, #0x43
    orr r0, r0, #0x1a00
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r3, #0x0]
    ldrh r0, [r2, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x208
    orr r0, r0, #0x1800
    strh r0, [r2, #0x0]
    ldrh r0, [r2, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r2, #0x0]
    ldr r0, [r4, #0x10]
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToSubBg
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [r4, #0xc]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    ldr r0, .L_0220e76c
    mov r2, #0x1e0
    mov r3, #0x20
    bl PaletteBuffer_Write
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToMainBg
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, [r4, #0xc]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    ldr r0, .L_0220e770
    mov r2, #0x1e0
    mov r3, #0x20
    bl PaletteBuffer_Write
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0220e760: .word 0xa05d
.L_0220e764: .word data_020f4e18
.L_0220e768: .word 0x400100a
.L_0220e76c: .word gSubBgPaletteBuffer
.L_0220e770: .word gMainBgPaletteBuffer
.size func_ov057_0220e658, . - func_ov057_0220e658
