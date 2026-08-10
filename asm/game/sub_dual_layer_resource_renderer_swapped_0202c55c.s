; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern SubDualLayerResourceRendererSwapped_LoadBgResources

    .global SubDualLayerResourceRendererSwapped_ActivateSecondary
    .type SubDualLayerResourceRendererSwapped_ActivateSecondary, @function
SubDualLayerResourceRendererSwapped_ActivateSecondary: ; 0x0202c55c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl SubDualLayerResourceRendererSwapped_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererSwapped_ActivateSecondary, . - SubDualLayerResourceRendererSwapped_ActivateSecondary
