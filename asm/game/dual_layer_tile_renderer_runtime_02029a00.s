; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern TileLayer_GetMetatileIndex

    .global DualLayerTileRenderer_ForwardLayerPair
    .type DualLayerTileRenderer_ForwardLayerPair, @function
DualLayerTileRenderer_ForwardLayerPair: ; 0x02029a00
    ldr ip, .L_02029a18
    add r0, r0, r1, lsl #0x2
    mov r1, r2
    ldr r0, [r0, #0x28]
    mov r2, r3
    bx ip
.L_02029a18: .word TileLayer_GetMetatileIndex
    .size DualLayerTileRenderer_ForwardLayerPair, . - DualLayerTileRenderer_ForwardLayerPair

