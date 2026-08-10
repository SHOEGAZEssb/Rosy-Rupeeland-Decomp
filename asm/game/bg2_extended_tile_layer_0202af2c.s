; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global Bg2ExtendedTileLayer_DestroyComplete
    .type Bg2ExtendedTileLayer_DestroyComplete, @function
Bg2ExtendedTileLayer_DestroyComplete: ; 0x0202af2c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202af50
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202af50: .word gTileLayerStateVtable
    .size Bg2ExtendedTileLayer_DestroyComplete, . - Bg2ExtendedTileLayer_DestroyComplete

