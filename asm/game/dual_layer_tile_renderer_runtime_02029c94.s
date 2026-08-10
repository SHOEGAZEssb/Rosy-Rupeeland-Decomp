; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern AnimatedTileStagingBuffer_SetPaused

    .global DualLayerTileRenderer_SetEmbeddedAnimationPaused
    .type DualLayerTileRenderer_SetEmbeddedAnimationPaused, @function
DualLayerTileRenderer_SetEmbeddedAnimationPaused: ; 0x02029c94
    ldr ip, .L_02029ca0
    add r0, r0, #0x60
    bx ip
.L_02029ca0: .word AnimatedTileStagingBuffer_SetPaused
    .size DualLayerTileRenderer_SetEmbeddedAnimationPaused, . - DualLayerTileRenderer_SetEmbeddedAnimationPaused

