; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern Heap_Free
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global Bg3TileLayer_DestroyAndFree
    .type Bg3TileLayer_DestroyAndFree, @function
Bg3TileLayer_DestroyAndFree: ; 0x0202accc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202acf8
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202acf8: .word gTileLayerStateVtable
    .size Bg3TileLayer_DestroyAndFree, . - Bg3TileLayer_DestroyAndFree

