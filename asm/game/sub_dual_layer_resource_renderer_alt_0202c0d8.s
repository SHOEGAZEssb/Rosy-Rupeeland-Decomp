; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global SubDualLayerResourceRendererAlt_DestroyComplete
    .type SubDualLayerResourceRendererAlt_DestroyComplete, @function
SubDualLayerResourceRendererAlt_DestroyComplete: ; 0x0202c0d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererAlt_DestroyComplete, . - SubDualLayerResourceRendererAlt_DestroyComplete
