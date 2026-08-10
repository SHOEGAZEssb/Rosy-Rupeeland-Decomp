; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global func_0202c778
    .type func_0202c778, @function
func_0202c778: ; 0x0202c778
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c778, . - func_0202c778
