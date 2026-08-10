; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern SubThreeLayerResourceRenderer_LoadBgResources

    .global SubThreeLayerResourceRenderer_ActivatePrimary
    .type SubThreeLayerResourceRenderer_ActivatePrimary, @function
SubThreeLayerResourceRenderer_ActivatePrimary: ; 0x0202c8f8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    ldr r1, [r4, #0x28]
    mov r0, r4
    add r1, r1, #0x1000
    ldrb r2, [r1, #0x30]
    bic r2, r2, #0x1
    strb r2, [r1, #0x30]
    ldr r1, [r4, #0x2c]
    add r1, r1, #0x1000
    ldrb r2, [r1, #0x30]
    bic r2, r2, #0x1
    strb r2, [r1, #0x30]
    bl SubThreeLayerResourceRenderer_LoadBgResources
    ldmia sp!, {r4, pc}
    .size SubThreeLayerResourceRenderer_ActivatePrimary, . - SubThreeLayerResourceRenderer_ActivatePrimary
