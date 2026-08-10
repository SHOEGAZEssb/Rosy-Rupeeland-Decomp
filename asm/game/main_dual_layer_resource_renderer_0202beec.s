; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global func_0202beec
    .type func_0202beec, @function
func_0202beec: ; 0x0202beec
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202beec, . - func_0202beec
