; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern MainBg0ResourceRenderer_LoadBgResources

    .global MainBg0ResourceRenderer_ActivateSecondary
    .type MainBg0ResourceRenderer_ActivateSecondary, @function
MainBg0ResourceRenderer_ActivateSecondary: ; 0x0202c7ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl MainBg0ResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainBg0ResourceRenderer_ActivateSecondary, . - MainBg0ResourceRenderer_ActivateSecondary
