; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern DualLayerTileRenderer_LoadFromConfig
.extern func_0202cc88

    .global func_0202cc30
    .type func_0202cc30, @function
func_0202cc30: ; 0x0202cc30
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRenderer_LoadFromConfig
    ldr r1, [r4, #0x28]
    mov r0, r4
    add r1, r1, #0x1000
    ldrb r2, [r1, #0x30]
    bic r2, r2, #0x1
    strb r2, [r1, #0x30]
    ldr r1, [r4, #0x2c]
    add r1, r1, #0x1000
    ldrb r2, [r1, #0x30]
    bic r2, r2, #0x1
    strb r2, [r1, #0x30]
    bl func_0202cc88
    ldmia sp!, {r4, pc}
    .size func_0202cc30, . - func_0202cc30
