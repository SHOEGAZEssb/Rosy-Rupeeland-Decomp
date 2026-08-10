; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern func_0202c7c4

    .global func_0202c7ac
    .type func_0202c7ac, @function
func_0202c7ac: ; 0x0202c7ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl func_0202c7c4
    ldmia sp!, {r4, pc}
    .size func_0202c7ac, . - func_0202c7ac
