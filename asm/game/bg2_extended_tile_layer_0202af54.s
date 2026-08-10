; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern Heap_Free
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global Bg2ExtendedTileLayer_DestroyAndFree
    .type Bg2ExtendedTileLayer_DestroyAndFree, @function
Bg2ExtendedTileLayer_DestroyAndFree: ; 0x0202af54
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202af80
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202af80: .word gTileLayerStateVtable
    .size Bg2ExtendedTileLayer_DestroyAndFree, . - Bg2ExtendedTileLayer_DestroyAndFree

