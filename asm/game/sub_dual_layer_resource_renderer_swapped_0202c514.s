; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global func_0202c514
    .type func_0202c514, @function
func_0202c514: ; 0x0202c514
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c514, . - func_0202c514
