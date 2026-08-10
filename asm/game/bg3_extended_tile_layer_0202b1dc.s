; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern Heap_Free
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global Bg3ExtendedTileLayer_DestroyAndFree
    .type Bg3ExtendedTileLayer_DestroyAndFree, @function
Bg3ExtendedTileLayer_DestroyAndFree: ; 0x0202b1dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202b208
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202b208: .word gTileLayerStateVtable
    .size Bg3ExtendedTileLayer_DestroyAndFree, . - Bg3ExtendedTileLayer_DestroyAndFree

