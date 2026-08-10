; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern gMainThreeLayerResourceRendererVtable

    .global MainThreeLayerResourceRenderer_Init
    .type MainThreeLayerResourceRenderer_Init, @function
MainThreeLayerResourceRenderer_Init: ; 0x0202cbe0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202cbfc
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202cbfc: .word gMainThreeLayerResourceRendererVtable
    .size MainThreeLayerResourceRenderer_Init, . - MainThreeLayerResourceRenderer_Init
