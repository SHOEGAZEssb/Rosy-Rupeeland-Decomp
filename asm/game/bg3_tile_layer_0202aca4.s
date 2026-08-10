; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global Bg3TileLayer_DestroyComplete
    .type Bg3TileLayer_DestroyComplete, @function
Bg3TileLayer_DestroyComplete: ; 0x0202aca4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202acc8
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202acc8: .word gTileLayerStateVtable
    .size Bg3TileLayer_DestroyComplete, . - Bg3TileLayer_DestroyComplete

