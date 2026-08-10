; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern SubDualLayerResourceRenderer_LoadBgResources

    .global SubDualLayerResourceRenderer_ActivatePrimary
    .type SubDualLayerResourceRenderer_ActivatePrimary, @function
SubDualLayerResourceRenderer_ActivatePrimary: ; 0x0202bc68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl SubDualLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRenderer_ActivatePrimary, . - SubDualLayerResourceRenderer_ActivatePrimary
