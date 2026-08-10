; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern MainBg0ResourceRenderer_LoadBgResources

    .global MainBg0ResourceRenderer_ActivatePrimary
    .type MainBg0ResourceRenderer_ActivatePrimary, @function
MainBg0ResourceRenderer_ActivatePrimary: ; 0x0202c794
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl MainBg0ResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size MainBg0ResourceRenderer_ActivatePrimary, . - MainBg0ResourceRenderer_ActivatePrimary
