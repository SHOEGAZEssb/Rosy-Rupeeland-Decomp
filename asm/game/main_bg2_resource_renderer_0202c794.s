; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern func_0202c7c4

    .global func_0202c794
    .type func_0202c794, @function
func_0202c794: ; 0x0202c794
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    mov r0, r4
    bl func_0202c7c4
    ldmia sp!, {r4, pc}
    .size func_0202c794, . - func_0202c794
