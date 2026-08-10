; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern gBg2ExtendedTileLayerVtable
.extern TileLayerState_Init

    .global Bg2ExtendedTileLayer_Init
    .type Bg2ExtendedTileLayer_Init, @function
Bg2ExtendedTileLayer_Init: ; 0x0202aeac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayerState_Init
    ldr r1, .L_0202aed8
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202aed8: .word gBg2ExtendedTileLayerVtable
    .size Bg2ExtendedTileLayer_Init, . - Bg2ExtendedTileLayer_Init

