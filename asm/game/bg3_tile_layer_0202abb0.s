; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern gBg3TileLayerVtable
.extern TileLayerState_Init

    .global Bg3TileLayer_Init
    .type Bg3TileLayer_Init, @function
Bg3TileLayer_Init: ; 0x0202abb0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayerState_Init
    ldr r1, .L_0202abdc
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202abdc: .word gBg3TileLayerVtable
    .size Bg3TileLayer_Init, . - Bg3TileLayer_Init

