; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern gTileLayerStateVtable
.extern OwnedTileBuffer_Destroy

    .global func_0202b1b4
    .type func_0202b1b4, @function
func_0202b1b4: ; 0x0202b1b4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202b1d8
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl OwnedTileBuffer_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202b1d8: .word gTileLayerStateVtable
    .size func_0202b1b4, . - func_0202b1b4

