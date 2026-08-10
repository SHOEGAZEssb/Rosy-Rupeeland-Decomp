; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern data_020def1c

    .global func_0202cbe0
    .type func_0202cbe0, @function
func_0202cbe0: ; 0x0202cbe0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202cbfc
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202cbfc: .word data_020def1c
    .size func_0202cbe0, . - func_0202cbe0
