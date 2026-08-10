; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global SubDualLayerResourceRenderer_DestroyAndFree
    .type SubDualLayerResourceRenderer_DestroyAndFree, @function
SubDualLayerResourceRenderer_DestroyAndFree: ; 0x0202bc4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRenderer_DestroyAndFree, . - SubDualLayerResourceRenderer_DestroyAndFree
