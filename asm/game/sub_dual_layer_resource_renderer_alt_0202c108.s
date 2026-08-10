; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern SubDualLayerResourceRendererAlt_LoadBgResources

    .global SubDualLayerResourceRendererAlt_ActivatePrimary
    .type SubDualLayerResourceRendererAlt_ActivatePrimary, @function
SubDualLayerResourceRendererAlt_ActivatePrimary: ; 0x0202c108
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl SubDualLayerResourceRendererAlt_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererAlt_ActivatePrimary, . - SubDualLayerResourceRendererAlt_ActivatePrimary
