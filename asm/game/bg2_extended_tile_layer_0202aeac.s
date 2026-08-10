; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern data_020deadc
.extern TileLayerState_Init

    .global func_0202aeac
    .type func_0202aeac, @function
func_0202aeac: ; 0x0202aeac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayerState_Init
    ldr r1, .L_0202aed8
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202aed8: .word data_020deadc
    .size func_0202aeac, . - func_0202aeac

