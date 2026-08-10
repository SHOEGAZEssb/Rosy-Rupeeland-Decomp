; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global MainThreeLayerResourceRenderer_DestroyComplete
    .type MainThreeLayerResourceRenderer_DestroyComplete, @function
MainThreeLayerResourceRenderer_DestroyComplete: ; 0x0202cc00
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainThreeLayerResourceRenderer_DestroyComplete, . - MainThreeLayerResourceRenderer_DestroyComplete
