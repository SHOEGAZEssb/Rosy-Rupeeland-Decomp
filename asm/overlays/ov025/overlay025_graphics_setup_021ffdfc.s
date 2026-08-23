.text

/* Exact fallback; see src/overlays/ov025/overlay025_graphics_setup.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern func_020706c4
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_02072048
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern func_020925a4
.extern func_020925dc
.extern func_020925f8
.extern func_02092618
.extern func_02092638
.extern func_02092688
.extern func_020b1ff0
.extern func_020b44e8
.extern GraphicsResourceSet_Apply
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov025_021ffdfc
func_ov025_021ffdfc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r2, L_021fffec
    mov r4, r0
    ldrh r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x8000
    strh r1, [r2, #0x0]
    bl func_020925a4
    ldr r1, L_021ffff0
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    bl func_020925f8
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    mov r0, #0x12
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl func_020925dc
    ldr r1, L_021ffff4
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    bl func_02092618
    mov r1, #0x3
    mov r0, #0x0
    mov r2, #0x2
    mov r3, r1
    bl func_02092688
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021ffff8
    ldr r1, L_021ffffc
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
    bl func_02072048
    ldr r3, L_02200000
    ldr r0, L_021ffffc
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
    ldr r3, L_02200004
    ldr r1, L_021ffffc
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0xa0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldr r0, L_02200008
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r3, [r0, #0x1c]
    ldr r2, L_0220000c
    ldr r1, L_02200010
    strh r3, [r0, #0x6]
    strh r2, [r0, #0x8]
    ldrh r2, [r0, #0x1c]
    strh r2, [r0, #0xa]
    strh r1, [r0, #0xc]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fffec: .word 0x4000304
L_021ffff0: .word 0x400000a
L_021ffff4: .word 0x400100a
L_021ffff8: .word 0x8032
L_021ffffc: .word data_020f4e18
L_02200000: .word 0xa13a
L_02200004: .word 0xc008
L_02200008: .word data_020f4e14
L_0220000c: .word 0x31f
L_02200010: .word 0x215
.size func_ov025_021ffdfc, .-func_ov025_021ffdfc

