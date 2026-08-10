; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern SubDualLayerResourceRendererAlt_LoadBgResources

    .global SubDualLayerResourceRendererAlt_ActivateSecondary
    .type SubDualLayerResourceRendererAlt_ActivateSecondary, @function
SubDualLayerResourceRendererAlt_ActivateSecondary: ; 0x0202c120
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl SubDualLayerResourceRendererAlt_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererAlt_ActivateSecondary, . - SubDualLayerResourceRendererAlt_ActivateSecondary
