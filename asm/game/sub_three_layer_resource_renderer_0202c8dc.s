; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global func_0202c8dc
    .type func_0202c8dc, @function
func_0202c8dc: ; 0x0202c8dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c8dc, . - func_0202c8dc
