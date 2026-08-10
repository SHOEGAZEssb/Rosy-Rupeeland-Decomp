; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern MainDualLayerResourceRendererAlt_LoadBgResources

    .global MainDualLayerResourceRendererAlt_ActivateSecondary
    .type MainDualLayerResourceRendererAlt_ActivateSecondary, @function
MainDualLayerResourceRendererAlt_ActivateSecondary: ; 0x0202c370
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl MainDualLayerResourceRendererAlt_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRendererAlt_ActivateSecondary, . - MainDualLayerResourceRendererAlt_ActivateSecondary
