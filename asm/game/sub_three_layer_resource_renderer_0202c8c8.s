; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global SubThreeLayerResourceRenderer_DestroyComplete
    .type SubThreeLayerResourceRenderer_DestroyComplete, @function
SubThreeLayerResourceRenderer_DestroyComplete: ; 0x0202c8c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubThreeLayerResourceRenderer_DestroyComplete, . - SubThreeLayerResourceRenderer_DestroyComplete
