; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern TileLayer_SetMetatileIndex

    .global DualLayerTileRenderer_ForwardLayerTriple
    .type DualLayerTileRenderer_ForwardLayerTriple, @function
DualLayerTileRenderer_ForwardLayerTriple: ; 0x02029a1c
    stmdb sp!, {r3, lr}
    add r0, r0, r1, lsl #0x2
    mov ip, r2
    mov r1, r3
    ldr r0, [r0, #0x28]
    ldr r2, [sp, #0x8]
    mov r3, ip
    bl TileLayer_SetMetatileIndex
    ldmia sp!, {r3, pc}
    .size DualLayerTileRenderer_ForwardLayerTriple, . - DualLayerTileRenderer_ForwardLayerTriple

