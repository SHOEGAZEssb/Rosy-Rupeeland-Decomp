; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern gSubDualLayerResourceRendererVtable

    .global SubDualLayerResourceRenderer_Init
    .type SubDualLayerResourceRenderer_Init, @function
SubDualLayerResourceRenderer_Init: ; 0x0202bc18
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202bc34
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202bc34: .word gSubDualLayerResourceRendererVtable
    .size SubDualLayerResourceRenderer_Init, . - SubDualLayerResourceRenderer_Init
