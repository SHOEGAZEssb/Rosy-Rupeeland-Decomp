; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern gDualLayerTileRendererBaseVtable
.extern VecFx32Object_Destroy
.extern DualLayerTileRendererBase_DestroyOwnedLayers
.extern func_0202b834
.extern ByteTileMapOwner_Destroy

    .global DualLayerTileRendererBase_Destroy
    .type DualLayerTileRendererBase_Destroy, @function
DualLayerTileRendererBase_Destroy: ; 0x020292f0
    stmdb sp!, {r4, lr}
    ldr r1, .L_02029324
    mov r4, r0
    str r1, [r4, #0x0]
    bl DualLayerTileRendererBase_DestroyOwnedLayers
    add r0, r4, #0x60
    bl func_0202b834
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ByteTileMapOwner_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02029324: .word gDualLayerTileRendererBaseVtable
    .size DualLayerTileRendererBase_Destroy, . - DualLayerTileRendererBase_Destroy

