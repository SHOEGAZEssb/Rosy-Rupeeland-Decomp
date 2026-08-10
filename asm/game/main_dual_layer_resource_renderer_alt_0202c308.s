; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern gMainDualLayerResourceRendererAltVtable

    .global MainDualLayerResourceRendererAlt_Init
    .type MainDualLayerResourceRendererAlt_Init, @function
MainDualLayerResourceRendererAlt_Init: ; 0x0202c308
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c324
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c324: .word gMainDualLayerResourceRendererAltVtable
    .size MainDualLayerResourceRendererAlt_Init, . - MainDualLayerResourceRendererAlt_Init
