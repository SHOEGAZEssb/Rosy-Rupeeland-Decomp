; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern func_0202bf4c

    .global func_0202bf1c
    .type func_0202bf1c, @function
func_0202bf1c: ; 0x0202bf1c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl func_0202bf4c
    ldmia sp!, {r4, pc}
    .size func_0202bf1c, . - func_0202bf1c
