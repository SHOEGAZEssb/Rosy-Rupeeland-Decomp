; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_ActivateLayers
.extern func_0202cc88

    .global func_0202cc70
    .type func_0202cc70, @function
func_0202cc70: ; 0x0202cc70
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_ActivateLayers
    mov r0, r4
    bl func_0202cc88
    ldmia sp!, {r4, pc}
    .size func_0202cc70, . - func_0202cc70
