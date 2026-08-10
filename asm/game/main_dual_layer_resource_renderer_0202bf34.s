; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern MainDualLayerResourceRenderer_LoadBgResources

    .global MainDualLayerResourceRenderer_ActivateSecondary
    .type MainDualLayerResourceRenderer_ActivateSecondary, @function
MainDualLayerResourceRenderer_ActivateSecondary: ; 0x0202bf34
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl MainDualLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainDualLayerResourceRenderer_ActivateSecondary, . - MainDualLayerResourceRenderer_ActivateSecondary
