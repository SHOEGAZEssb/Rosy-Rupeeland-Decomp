; Matching retail form; see src/game/bg2_tile_layer.c.
.text
.extern gBg2TileLayerVtable
.extern TileLayerState_Init

    .global Bg2TileLayer_Init
    .type Bg2TileLayer_Init, @function
Bg2TileLayer_Init: ; 0x0202a8b4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayerState_Init
    ldr r1, .L_0202a8e0
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202a8e0: .word gBg2TileLayerVtable
    .size Bg2TileLayer_Init, . - Bg2TileLayer_Init

