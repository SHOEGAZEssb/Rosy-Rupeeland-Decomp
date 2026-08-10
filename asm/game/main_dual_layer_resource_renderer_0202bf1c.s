; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern MainDualLayerResourceRenderer_LoadBgResources

    .global MainDualLayerResourceRenderer_ActivatePrimary
    .type MainDualLayerResourceRenderer_ActivatePrimary, @function
MainDualLayerResourceRenderer_ActivatePrimary: ; 0x0202bf1c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl MainDualLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRenderer_ActivatePrimary, . - MainDualLayerResourceRenderer_ActivatePrimary
