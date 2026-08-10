; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern func_0202c950

    .global func_0202c938
    .type func_0202c938, @function
func_0202c938: ; 0x0202c938
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl func_0202c950
    ldmia sp!, {r4, pc}
    .size func_0202c938, . - func_0202c938
