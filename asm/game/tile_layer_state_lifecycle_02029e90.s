; Matching retail form; see src/game/tile_layer_state_lifecycle.c.
.text
.extern gTileLayerStateVtable
.extern TileLayerState_Reset

    .global TileLayerState_Init
    .type TileLayerState_Init, @function
TileLayerState_Init: ; 0x02029e90
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, .L_02029ed0
    mov r6, r0
    str ip, [r6, #0x0]
    add ip, r6, #0x1000
    mov lr, #0x0
    str lr, [ip, #0x8]
    mov r5, r2
    mov r4, r3
    str lr, [ip, #0xc]
    bl TileLayerState_Reset
    add r1, r6, #0x1000
    str r5, [r1, #0x38]
    mov r0, r6
    str r4, [r1, #0x3c]
    ldmia sp!, {r4, r5, r6, pc}
.L_02029ed0: .word gTileLayerStateVtable
    .size TileLayerState_Init, . - TileLayerState_Init

