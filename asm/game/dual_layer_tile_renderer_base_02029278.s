; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern gDualLayerTileRendererBaseVtable
.extern VecFx32Object_Destroy
.extern DualLayerTileRendererBase_DestroyOwnedLayers
.extern AnimatedTileStagingBuffer_Destroy
.extern ByteTileMapOwner_Destroy

    .global DualLayerTileRendererBase_DestroyComplete
    .type DualLayerTileRendererBase_DestroyComplete, @function
DualLayerTileRendererBase_DestroyComplete: ; 0x02029278
    stmdb sp!, {r4, lr}
    ldr r1, .L_020292ac
    mov r4, r0
    str r1, [r4, #0x0]
    bl DualLayerTileRendererBase_DestroyOwnedLayers
    add r0, r4, #0x60
    bl AnimatedTileStagingBuffer_Destroy
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ByteTileMapOwner_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020292ac: .word gDualLayerTileRendererBaseVtable
    .size DualLayerTileRendererBase_DestroyComplete, . - DualLayerTileRendererBase_DestroyComplete

