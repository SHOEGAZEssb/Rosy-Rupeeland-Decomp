; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global MainDualLayerResourceRendererAlt_DestroyComplete
    .type MainDualLayerResourceRendererAlt_DestroyComplete, @function
MainDualLayerResourceRendererAlt_DestroyComplete: ; 0x0202c328
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRendererAlt_DestroyComplete, . - MainDualLayerResourceRendererAlt_DestroyComplete
