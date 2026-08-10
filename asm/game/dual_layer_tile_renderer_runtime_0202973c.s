; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text


    .global DualLayerTileRenderer_UpdateLayers
    .type DualLayerTileRenderer_UpdateLayers, @function
DualLayerTileRenderer_UpdateLayers: ; 0x0202973c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x24]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
.L_02029758:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02029774
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02029774:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02029758
    ldmia sp!, {r3, r4, r5, pc}
    .size DualLayerTileRenderer_UpdateLayers, . - DualLayerTileRenderer_UpdateLayers

