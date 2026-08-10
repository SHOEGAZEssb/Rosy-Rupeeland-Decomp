; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern data_020decc4

    .global func_0202c0b8
    .type func_0202c0b8, @function
func_0202c0b8: ; 0x0202c0b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c0d4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c0d4: .word data_020decc4
    .size func_0202c0b8, . - func_0202c0b8
