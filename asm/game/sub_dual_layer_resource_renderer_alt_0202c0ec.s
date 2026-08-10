; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global func_0202c0ec
    .type func_0202c0ec, @function
func_0202c0ec: ; 0x0202c0ec
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c0ec, . - func_0202c0ec
