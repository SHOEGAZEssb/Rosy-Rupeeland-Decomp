; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global SubDualLayerResourceRenderer_DestroyComplete
    .type SubDualLayerResourceRenderer_DestroyComplete, @function
SubDualLayerResourceRenderer_DestroyComplete: ; 0x0202bc38
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRenderer_DestroyComplete, . - SubDualLayerResourceRenderer_DestroyComplete
