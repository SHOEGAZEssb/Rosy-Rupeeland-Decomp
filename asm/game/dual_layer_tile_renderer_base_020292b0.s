; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern Heap_Free
.extern gDualLayerTileRendererBaseVtable
.extern VecFx32Object_Destroy
.extern DualLayerTileRendererBase_DestroyOwnedLayers
.extern func_0202b834
.extern ByteTileMapOwner_Destroy

    .global DualLayerTileRendererBase_DestroyAndFree
    .type DualLayerTileRendererBase_DestroyAndFree, @function
DualLayerTileRendererBase_DestroyAndFree: ; 0x020292b0
    stmdb sp!, {r4, lr}
    ldr r1, .L_020292ec
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
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020292ec: .word gDualLayerTileRendererBaseVtable
    .size DualLayerTileRendererBase_DestroyAndFree, . - DualLayerTileRendererBase_DestroyAndFree

