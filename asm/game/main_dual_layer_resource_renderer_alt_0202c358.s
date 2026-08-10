; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern MainDualLayerResourceRendererAlt_LoadBgResources

    .global MainDualLayerResourceRendererAlt_ActivatePrimary
    .type MainDualLayerResourceRendererAlt_ActivatePrimary, @function
MainDualLayerResourceRendererAlt_ActivatePrimary: ; 0x0202c358
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl MainDualLayerResourceRendererAlt_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRendererAlt_ActivatePrimary, . - MainDualLayerResourceRendererAlt_ActivatePrimary
