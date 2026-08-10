; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern data_020ded3c

    .global func_0202c308
    .type func_0202c308, @function
func_0202c308: ; 0x0202c308
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c324
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c324: .word data_020ded3c
    .size func_0202c308, . - func_0202c308
