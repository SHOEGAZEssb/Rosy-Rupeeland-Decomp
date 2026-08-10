; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern data_020deea4

    .global func_0202c8a8
    .type func_0202c8a8, @function
func_0202c8a8: ; 0x0202c8a8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c8c4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c8c4: .word data_020deea4
    .size func_0202c8a8, . - func_0202c8a8
