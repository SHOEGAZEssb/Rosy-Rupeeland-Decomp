; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern SubThreeLayerResourceRenderer_LoadBgResources

    .global SubThreeLayerResourceRenderer_ActivateSecondary
    .type SubThreeLayerResourceRenderer_ActivateSecondary, @function
SubThreeLayerResourceRenderer_ActivateSecondary: ; 0x0202c938
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl SubThreeLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubThreeLayerResourceRenderer_ActivateSecondary, . - SubThreeLayerResourceRenderer_ActivateSecondary
