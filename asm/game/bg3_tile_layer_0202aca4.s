; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global func_0202aca4
    .type func_0202aca4, @function
func_0202aca4: ; 0x0202aca4
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
    .size func_0202aca4, . - func_0202aca4

