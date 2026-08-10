; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global SubThreeLayerResourceRenderer_DestroyAndFree
    .type SubThreeLayerResourceRenderer_DestroyAndFree, @function
SubThreeLayerResourceRenderer_DestroyAndFree: ; 0x0202c8dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubThreeLayerResourceRenderer_DestroyAndFree, . - SubThreeLayerResourceRenderer_DestroyAndFree
