; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global func_0202c328
    .type func_0202c328, @function
func_0202c328: ; 0x0202c328
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c328, . - func_0202c328
