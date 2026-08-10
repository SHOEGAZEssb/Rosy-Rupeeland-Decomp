; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global MainThreeLayerResourceRenderer_DestroyAndFree
    .type MainThreeLayerResourceRenderer_DestroyAndFree, @function
MainThreeLayerResourceRenderer_DestroyAndFree: ; 0x0202cc14
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainThreeLayerResourceRenderer_DestroyAndFree, . - MainThreeLayerResourceRenderer_DestroyAndFree
