; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern PaletteBuffer_Write
.extern gMainBgPaletteBuffer
.extern gSubBgPaletteBuffer
.extern func_020b1314
.extern func_020b1360
.extern func_020b13d4
.extern func_020b1534
.extern func_020b1598
.extern func_020b1618
.extern func_020b44e8

    .global DualLayerTileRenderer_UploadPalette
    .type DualLayerTileRenderer_UploadPalette, @function
DualLayerTileRenderer_UploadPalette: ; 0x02029914
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020b44e8
    ldrb r0, [r4, #0x30]
    cmp r0, #0x1
    beq .L_02029938
    cmp r0, #0x2
    beq .L_02029994
    ldmia sp!, {r4, pc}
.L_02029938:
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_02029950
    cmp r0, #0x2
    beq .L_02029968
    ldmia sp!, {r4, pc}
.L_02029950:
    ldr r1, [r4, #0x14]
    ldr r0, .L_020299f8
    mov r2, #0x0
    mov r3, #0x1c0
    bl PaletteBuffer_Write
    ldmia sp!, {r4, pc}
.L_02029968:
    bl func_020b1618
    ldr r0, [r4, #0x14]
    mov r1, #0x4000
    mov r2, #0x2000
    bl func_020b1598
    ldr r0, [r4, #0x14]
    mov r1, #0x6000
    mov r2, #0x2000
    bl func_020b1598
    bl func_020b1534
    ldmia sp!, {r4, pc}
.L_02029994:
    ldr r0, [r4, #0x14]
    mov r2, #0x0
    strh r2, [r0, #0x0]
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_020299b8
    cmp r0, #0x2
    beq .L_020299cc
    ldmia sp!, {r4, pc}
.L_020299b8:
    ldr r1, [r4, #0x14]
    ldr r0, .L_020299fc
    mov r3, #0x200
    bl PaletteBuffer_Write
    ldmia sp!, {r4, pc}
.L_020299cc:
    bl func_020b13d4
    ldr r0, [r4, #0x14]
    mov r1, #0x4000
    mov r2, #0x2000
    bl func_020b1360
    ldr r0, [r4, #0x14]
    mov r1, #0x6000
    mov r2, #0x2000
    bl func_020b1360
    bl func_020b1314
    ldmia sp!, {r4, pc}
.L_020299f8: .word gMainBgPaletteBuffer
.L_020299fc: .word gSubBgPaletteBuffer
    .size DualLayerTileRenderer_UploadPalette, . - DualLayerTileRenderer_UploadPalette

