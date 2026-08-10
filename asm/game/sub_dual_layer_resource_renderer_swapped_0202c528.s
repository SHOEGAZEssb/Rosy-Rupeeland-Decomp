; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global SubDualLayerResourceRendererSwapped_DestroyAndFree
    .type SubDualLayerResourceRendererSwapped_DestroyAndFree, @function
SubDualLayerResourceRendererSwapped_DestroyAndFree: ; 0x0202c528
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererSwapped_DestroyAndFree, . - SubDualLayerResourceRendererSwapped_DestroyAndFree
