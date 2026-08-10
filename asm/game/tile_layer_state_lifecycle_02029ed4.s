; Matching retail form; see src/game/tile_layer_state_lifecycle.c.
.text
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global TileLayerState_DestroyComplete
    .type TileLayerState_DestroyComplete, @function
TileLayerState_DestroyComplete: ; 0x02029ed4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_02029ef8
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02029ef8: .word gTileLayerStateVtable
    .size TileLayerState_DestroyComplete, . - TileLayerState_DestroyComplete

