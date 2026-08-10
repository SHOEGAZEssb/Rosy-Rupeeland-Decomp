; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern SubDualLayerResourceRenderer_LoadBgResources

    .global SubDualLayerResourceRenderer_ActivateSecondary
    .type SubDualLayerResourceRenderer_ActivateSecondary, @function
SubDualLayerResourceRenderer_ActivateSecondary: ; 0x0202bc80
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl SubDualLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubDualLayerResourceRenderer_ActivateSecondary, . - SubDualLayerResourceRenderer_ActivateSecondary
