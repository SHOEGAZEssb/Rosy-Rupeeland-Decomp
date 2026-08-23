; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern PaletteBuffer_Write
.extern data_020f4e18
.extern gMainBgPaletteBuffer
.extern GamePhaseGraphicsMetadata_GetByIndex
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_02072048
.extern func_020b44e8

    .global func_02028684
    .type func_02028684, @function
func_02028684: ; 0x02028684
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r0, #0xa
    bl GamePhaseGraphicsMetadata_GetByIndex
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldrh r2, [r4, #0x4]
    ldr r1, .L_02028758
    add r0, sp, #0x4
    str r2, [sp, #0x0]
    ldrh r2, [r4, #0x0]
    ldrh r3, [r4, #0x2]
    ldr r1, [r1, #0x0]
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    ldr ip, .L_0202875c
    add r0, sp, #0x4
    ldrh r3, [ip, #0x0]
    mov r1, #0x1
    mov r2, #0x1e0
    and r3, r3, #0x43
    orr r3, r3, #0x208
    orr r3, r3, #0x1800
    strh r3, [ip, #0x0]
    ldrh r3, [ip, #0x0]
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [ip, #0x0]
    bl func_02072048
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    ldr r0, .L_02028760
    mov r2, #0x1e0
    mov r3, #0x20
    bl PaletteBuffer_Write
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02028758: .word data_020f4e18
.L_0202875c: .word 0x400000a
.L_02028760: .word gMainBgPaletteBuffer
    .size func_02028684, . - func_02028684

