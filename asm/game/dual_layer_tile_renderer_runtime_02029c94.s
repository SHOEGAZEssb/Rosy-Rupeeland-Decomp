; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern func_0202b9bc

    .global DualLayerTileRenderer_GetEmbeddedRendererState
    .type DualLayerTileRenderer_GetEmbeddedRendererState, @function
DualLayerTileRenderer_GetEmbeddedRendererState: ; 0x02029c94
    ldr ip, .L_02029ca0
    add r0, r0, #0x60
    bx ip
.L_02029ca0: .word func_0202b9bc
    .size DualLayerTileRenderer_GetEmbeddedRendererState, . - DualLayerTileRenderer_GetEmbeddedRendererState

