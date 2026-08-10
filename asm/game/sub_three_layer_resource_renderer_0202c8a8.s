; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern gSubThreeLayerResourceRendererVtable

    .global SubThreeLayerResourceRenderer_Init
    .type SubThreeLayerResourceRenderer_Init, @function
SubThreeLayerResourceRenderer_Init: ; 0x0202c8a8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c8c4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c8c4: .word gSubThreeLayerResourceRendererVtable
    .size SubThreeLayerResourceRenderer_Init, . - SubThreeLayerResourceRenderer_Init
