; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text


    .global DualLayerTileRenderer_SetLayersEnabled
    .type DualLayerTileRenderer_SetLayersEnabled, @function
DualLayerTileRenderer_SetLayersEnabled: ; 0x02029a40
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
.L_02029a50:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02029a70
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0xc]
    blx r2
.L_02029a70:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02029a50
    ldmia sp!, {r4, r5, r6, pc}
    .size DualLayerTileRenderer_SetLayersEnabled, . - DualLayerTileRenderer_SetLayersEnabled

