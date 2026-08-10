; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text


    .global DualLayerTileRendererBase_SetLayoutParameters
    .type DualLayerTileRendererBase_SetLayoutParameters, @function
DualLayerTileRendererBase_SetLayoutParameters: ; 0x02029360
    str r1, [r0, #0x44]
    str r2, [r0, #0x48]
    str r3, [r0, #0x4c]
    bx lr
    .size DualLayerTileRendererBase_SetLayoutParameters, . - DualLayerTileRendererBase_SetLayoutParameters

