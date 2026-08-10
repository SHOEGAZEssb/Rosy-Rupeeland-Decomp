; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern func_0202c574

    .global func_0202c544
    .type func_0202c544, @function
func_0202c544: ; 0x0202c544
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl func_0202c574
    ldmia sp!, {r4, pc}
    .size func_0202c544, . - func_0202c544
