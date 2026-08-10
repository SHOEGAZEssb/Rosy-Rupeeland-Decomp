; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern SubDualLayerResourceRendererSwapped_LoadBgResources

    .global SubDualLayerResourceRendererSwapped_ActivatePrimary
    .type SubDualLayerResourceRendererSwapped_ActivatePrimary, @function
SubDualLayerResourceRendererSwapped_ActivatePrimary: ; 0x0202c544
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl SubDualLayerResourceRendererSwapped_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRendererSwapped_ActivatePrimary, . - SubDualLayerResourceRendererSwapped_ActivatePrimary
