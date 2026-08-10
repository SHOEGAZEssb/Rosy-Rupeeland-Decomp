; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global MainDualLayerResourceRenderer_DestroyAndFree
    .type MainDualLayerResourceRenderer_DestroyAndFree, @function
MainDualLayerResourceRenderer_DestroyAndFree: ; 0x0202bf00
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRenderer_DestroyAndFree, . - MainDualLayerResourceRenderer_DestroyAndFree
