; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern data_020dec4c

    .global func_0202becc
    .type func_0202becc, @function
func_0202becc: ; 0x0202becc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202bee8
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202bee8: .word data_020dec4c
    .size func_0202becc, . - func_0202becc
