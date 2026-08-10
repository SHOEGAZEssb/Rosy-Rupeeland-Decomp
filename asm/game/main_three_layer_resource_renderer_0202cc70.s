; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern MainThreeLayerResourceRenderer_LoadBgResources

    .global MainThreeLayerResourceRenderer_ActivateSecondary
    .type MainThreeLayerResourceRenderer_ActivateSecondary, @function
MainThreeLayerResourceRenderer_ActivateSecondary: ; 0x0202cc70
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl MainThreeLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainThreeLayerResourceRenderer_ActivateSecondary, . - MainThreeLayerResourceRenderer_ActivateSecondary
