; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern gBg3ExtendedTileLayerVtable
.extern TileLayerState_Init

    .global Bg3ExtendedTileLayer_Init
    .type Bg3ExtendedTileLayer_Init, @function
Bg3ExtendedTileLayer_Init: ; 0x0202b134
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayerState_Init
    ldr r1, .L_0202b160
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202b160: .word gBg3ExtendedTileLayerVtable
    .size Bg3ExtendedTileLayer_Init, . - Bg3ExtendedTileLayer_Init

